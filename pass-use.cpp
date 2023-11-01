#include <llvm/Pass.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <iostream>
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"


using namespace llvm;
namespace {

    constexpr std::string START_LOGGER = "start_logger";
    constexpr std::string OPT_LOGGER = "opt_logger";
    constexpr std::string END_LOGGER = "end_logger";

    struct Functions {
        FunctionCallee start;
        FunctionCallee opt;
        FunctionCallee end;
    };

    struct UsesPass : public llvm::PassInfoMixin<UsesPass> {

        [[maybe_unused]] llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM) {
            auto &context = M.getContext();
            IRBuilder<> builder{context};

            auto *s1_type = FunctionType::get(Type::getVoidTy(context), {builder.getInt8Ty()->getPointerTo()}, false);
            auto *s2_type = FunctionType::get(Type::getVoidTy(context), {builder.getInt8Ty()->getPointerTo(), builder.getInt8Ty()->getPointerTo()}, false);

            const auto functions = Functions {
                    M.getOrInsertFunction(START_LOGGER, s1_type),
                    M.getOrInsertFunction(OPT_LOGGER, s2_type),
                    M.getOrInsertFunction(END_LOGGER, s1_type)
            };



            for (auto &item: M.functions()) {
                run_on_function(item, functions);
            }

            return llvm::PreservedAnalyses::all();
        }

        static bool is_logger(StringRef name) {
            return name == OPT_LOGGER || name == END_LOGGER || name == START_LOGGER;
        }

        static void run_on_function(llvm::Function &F, const Functions &functions) {
            if (F.isIntrinsic()) return;
            if (F.isDeclaration()) return;
            if (is_logger(F.getName())) {
                return;
            }

            auto &context = F.getContext();
            IRBuilder<> builder{context};

            outs().write_escaped(F.getName()) << "\n";

            builder.SetInsertPoint(&F.getEntryBlock(), F.getEntryBlock().getFirstInsertionPt());
            auto *name_str = builder.CreateGlobalStringPtr(F.getName());
            Value *args[] = {name_str};
            builder.CreateCall(functions.start, args);

            for (auto &block: F) {
                for (auto &insn: block) {
                    std::string s;
                    raw_string_ostream ss{s};

                    insn.print(ss, true);

                    for (auto &use: insn.uses()) {
                        auto *user = dyn_cast<Instruction>(use.getUser());

                        builder.SetInsertPoint(&insn);
                        auto *opt_str = builder.CreateGlobalStringPtr(insn.getOpcodeName());
                        auto *user_str = builder.CreateGlobalStringPtr(user->getOpcodeName());
                        Value *args[] = {opt_str, user_str};
                        builder.CreateCall(functions.opt, args);
                    }
                    if (auto *ret = dyn_cast<ReturnInst>(&insn)) {
                        // Insert before ret
                        builder.SetInsertPoint(ret);

                        // Insert a call to funcEndLogFunc function
                        Value *funcName = builder.CreateGlobalStringPtr(F.getName());
                        Value *args[] = {funcName};
                        builder.CreateCall(functions.end, args);
                    }
                }
            }

        }
    };

    llvm::PassPluginLibraryInfo getPassPluginInfo() {
        const auto callback = [](llvm::PassBuilder &PB) {
            PB.registerOptimizerLastEPCallback(
                    [&](llvm::ModulePassManager &MPM, auto) {
                        MPM.addPass(UsesPass{});
                        return true;
                    });
        };

        return {LLVM_PLUGIN_API_VERSION, "uses", "0.0.1", callback};
    };

}

extern "C" LLVM_ATTRIBUTE_WEAK llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}