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

        llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM) {
            auto &context = M.getContext();
            IRBuilder<> builder{context};

            auto *func_type = FunctionType::get(Type::getVoidTy(context), {builder.getInt8Ty()->getPointerTo()}, false);

            const auto functions = Functions {
                    M.getOrInsertFunction(START_LOGGER, func_type),
                    M.getOrInsertFunction(OPT_LOGGER, func_type),
                    M.getOrInsertFunction(END_LOGGER, func_type)
            };



            for (auto &item: M.functions()) {
                run_on_function(item, functions);
            }

            return llvm::PreservedAnalyses::all();
        }

        bool is_logger(StringRef name) {
            return name == OPT_LOGGER || name == END_LOGGER || name == START_LOGGER;
        }

        void run_on_function(llvm::Function &F, const Functions &functions) {
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

        }
    };

    llvm::PassPluginLibraryInfo getPassPluginInfo() {
        const auto callback = [](llvm::PassBuilder &PB) {
            PB.registerPipelineEarlySimplificationEPCallback(
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