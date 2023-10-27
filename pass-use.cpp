#include <llvm/Pass.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <iostream>
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/PassManager.h"


using namespace llvm;
struct UsesPass : public llvm::PassInfoMixin<UsesPass> {

    llvm::PreservedAnalyses run(llvm::Module &M, llvm::ModuleAnalysisManager &AM) {

        for (const auto &item: M.functions()) {
            run_on_function(item);
        }

        return llvm::PreservedAnalyses::all();
    }


    void run_on_function(const llvm::Function &F) {
        outs() << "\nIn a function called " << F.getName() << "!\n";
        outs() << "\nFunction Uses: \n";
        for (auto &U : F.uses()) {
            User *user = U.getUser();
            user->print(outs(), true);
            outs() << "\n";
        }

        for (auto &B : F) {
            outs() << "\nBasic block:";
            outs() << "BasicBlock Uses: \n";
            for (auto &U : B.uses()) {
                User *user = U.getUser();
                user->print(outs(), true);
                outs() << "\n";
            }

            for (auto &I : B) {
                outs() << "\nUses: \n";
                for (auto &U : I.uses()) {
                    User *user = U.getUser();
                    user->print(outs(), true);
                    outs() << "\n";
                }
                outs() << "Use: \n";
                for (auto &U : I.operands()) {
                    Value *use = U.get();
                    use->print(outs(), true);
                    outs() << "\n";
                }
            }
        }
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


extern "C" LLVM_ATTRIBUTE_WEAK llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getPassPluginInfo();
}