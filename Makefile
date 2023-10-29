OBJ_PATH := obj
BIN_PATH := $(OBJ_PATH)/bin

all: $(OBJ_PATH)/pass-use.so

clean:
	rm -rf $(OBJ_PATH)
	mkdir $(OBJ_PATH)
	mkdir $(BIN_PATH)

$(OBJ_PATH)/engine.o : engine.c
	clang -g -c engine.c -o $(OBJ_PATH)/engine.o

$(OBJ_PATH)/main.o : main.c
	clang -g -c main.c -o $(OBJ_PATH)/main.o

$(OBJ_PATH)/inject.o : inject.cpp
	clang++ -g -c inject.cpp -o $(OBJ_PATH)/inject.o

$(BIN_PATH)/game: $(OBJ_PATH)/game.o $(OBJ_PATH)/main.o $(OBJ_PATH)/engine.o game.h engine.h $(OBJ_PATH)/pass-use.so $(OBJ_PATH)/inject.o
	clang++ $(OBJ_PATH)/game.o $(OBJ_PATH)/main.o $(OBJ_PATH)/engine.o $(OBJ_PATH)/inject.o -o $(BIN_PATH)/game -lSDL2

$(OBJ_PATH)/game_raw.bc: game.c
	clang -c -emit-llvm -O2 game.c -o $(OBJ_PATH)/game_raw.bc

$(OBJ_PATH)/game_cooked.bc: $(OBJ_PATH)/game_raw.bc
	opt -p reg2mem $(OBJ_PATH)/game_raw.bc > $(OBJ_PATH)/game_cooked.bc

$(OBJ_PATH)/pass-use.so: pass-use.cpp
	clang++ pass-use.cpp -fPIC -shared -o $(OBJ_PATH)/pass-use.so -std=c++20 -g

$(OBJ_PATH)/game.o: $(OBJ_PATH)/pass-use.so $(OBJ_PATH)/game_cooked.bc
	clang -g -fpass-plugin=$(OBJ_PATH)/pass-use.so -c $(OBJ_PATH)/game_cooked.bc -o $(OBJ_PATH)/game.o

.PHONY: dump
