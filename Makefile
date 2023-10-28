OBJ_PATH := obj

all: pass-use.so

clean:
	rm -rf $(OBJ_PATH)

$(OBJ_PATH)/engine.o : engine.c
	clang -g -c engine.c -o $(OBJ_PATH)/engine.o

$(OBJ_PATH)/main.o : main.c
	clang -g -c main.c -o $(OBJ_PATH)/main.o

$(OBJ_PATH)/inject.o : inject.c
	clang -g -c inject.c -o $(OBJ_PATH)/inject.o

game: $(OBJ_PATH)/game.o $(OBJ_PATH)/main.o $(OBJ_PATH)/engine.o game.h engine.h pass-use.so $(OBJ_PATH)/inject.o
	clang++ $(OBJ_PATH)/game.o $(OBJ_PATH)/main.o $(OBJ_PATH)/engine.o $(OBJ_PATH)/inject.o -o game -lSDL2

game_raw.bc: game.c
	clang -c -emit-llvm -O2 game.c -o game_raw.bc

game_cooked.bc: game_raw.bc
	opt -p reg2mem game_raw.bc > game_cooked.bc

pass-use.so: pass-use.cpp
	clang++ pass-use.cpp -fPIC -shared -o pass-use.so -std=c++20 -g

$(OBJ_PATH)/game.o: pass-use.so game_cooked.bc
	clang -g -fpass-plugin=./pass-use.so -c game_cooked.bc -o $(OBJ_PATH)/game.o

.PHONY: dump
