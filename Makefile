OBJ_PATH := obj
BIN_PATH := $(OBJ_PATH)/bin

all: obj/bin/game game.ll

clean:
	rm -rf $(OBJ_PATH)
	mkdir $(OBJ_PATH)
	mkdir $(BIN_PATH)

game.ll: game.c
	clang -S -emit-llvm game.c -o game.ll

$(OBJ_PATH)/sim.o : sim.c
	clang -g -c sim.c -o $(OBJ_PATH)/sim.o

$(OBJ_PATH)/inject.o : inject.cpp
	clang++ -g -c inject.cpp -o $(OBJ_PATH)/inject.o

$(BIN_PATH)/game: $(OBJ_PATH)/game.o $(OBJ_PATH)/sim.o game.h sim.h $(OBJ_PATH)/pass-use.so $(OBJ_PATH)/inject.o
	clang++ $(OBJ_PATH)/game.o $(OBJ_PATH)/sim.o $(OBJ_PATH)/inject.o -o $(BIN_PATH)/game -lSDL2

$(OBJ_PATH)/game_raw.bc: game.c
	clang -c -emit-llvm -O2 game.c -o $(OBJ_PATH)/game_raw.bc

$(OBJ_PATH)/game_cooked.bc: $(OBJ_PATH)/game_raw.bc
	opt -p reg2mem $(OBJ_PATH)/game_raw.bc > $(OBJ_PATH)/game_cooked.bc

$(OBJ_PATH)/pass-use.so: pass-use.cpp
	clang++ pass-use.cpp -fPIC -shared -o $(OBJ_PATH)/pass-use.so -std=c++20 -g

$(OBJ_PATH)/game.o: $(OBJ_PATH)/pass-use.so $(OBJ_PATH)/game_cooked.bc
	clang -g -c $(OBJ_PATH)/game_cooked.bc -o $(OBJ_PATH)/game.o

.PHONY: dump
