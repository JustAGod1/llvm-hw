#include <SDL2/SDL.h>
#include "engine.h"

extern SDL_Renderer *ren;

void put_pixel(int x, int y, uint32_t argb) {
    uint8_t a = (argb >> 24) & 0xFF;
    uint8_t r = (argb >> 16) & 0xFF;
    uint8_t g = (argb >> 8) & 0xFF;
    uint8_t b = argb & 0xFF;
    SDL_SetRenderDrawColor(ren, r, g, b, a);
    SDL_RenderDrawPoint(ren, x, y);

}

void flush() {
    SDL_RenderPresent(ren);
    SDL_Delay(100);
}
