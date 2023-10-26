#include <SDL2/SDL.h>
#include "game.h"

SDL_Renderer *ren;

int main(int argc, char **argv) {
    if (SDL_Init(SDL_INIT_EVERYTHING) != 0){
        return 1;
    }
    SDL_Window *win = SDL_CreateWindow("Life Game", 100, 100, 50, 50, SDL_WINDOW_SHOWN);
    if (!win){
        return 1;
    }
    ren = SDL_CreateRenderer(win, -1, SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC);
    if (!ren){
        return 1;
    }
    return run_game(argc, argv);
}
