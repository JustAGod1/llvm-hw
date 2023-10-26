//
// Created by justagod on 27.10.23.
//

#include "game.h"
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include "engine.h"

#define WIDTH 50
#define HEIGHT 50
#define TOTAL_SIZE 2500

typedef struct {
    bool buf_a[TOTAL_SIZE];
    bool buf_b[TOTAL_SIZE];

    bool *view;
    bool *buf;
} game_t;

size_t get_pos(int x, int y) {

    size_t pos = ((size_t) y) * WIDTH + x;
    return pos;
}

bool get_pixel(bool * const data, int x, int y) {
    if (x >= WIDTH || x < 0) return false;
    if (y >= WIDTH || y < 0) return false;
    size_t pos = get_pos(x, y);
    return data[pos];
}

void set_pixel(bool *data, int x, int y, bool value) {
    if (x >= WIDTH || x < 0) return;
    if (y >= WIDTH || y < 0) return;
    size_t pos = get_pos(x, y);

    data[pos] = value;
}

void init_game(game_t *game) {
    memset(game->buf_a, 0, TOTAL_SIZE * sizeof(bool));
    memset(game->buf_b, 0, TOTAL_SIZE * sizeof(bool));

    game->view = game->buf_a;
    game->buf = game->buf_b;
}

bool init_from_file(game_t *game, char *file_name) {
    FILE *f = fopen(file_name, "r");

    if (!f) {
        return false;
    }

    int c;
    size_t pos = 0;
    while ((c = fgetc(f)) != EOF) {
        if (pos >= TOTAL_SIZE) {
            return false;
        }

        game->view[pos] = c == '1';

        pos++;
    }

    return true;
}

bool make_iteration(game_t *game) {
    bool r = 0;
    for (int x = 0; x < WIDTH; ++x) {
        for (int y = 0; y < HEIGHT; ++y) {
            int cnt = 0;
            for (int dx = 0; dx < 3; ++dx) {
                for (int dy = 0; dy < 3; ++dy) {
                    if (get_pixel(game->view, x - dx + 1, y - dy + 1)) {
                        cnt++;
                    }
                }
            }

            bool v = cnt >= 3 && cnt <= 4;
            set_pixel(game->buf, x, y, v);
            r |= v;
        }
    }
    bool *tmp = game->view;
    game->view = game->buf;
    game->buf = tmp;

    return r;

}

int run_game(int argc, char **argv) {

    game_t game;

    init_game(&game);

    if (argc >= 2) {
        init_from_file(&game, argv[1]);
    }

    while (make_iteration(&game)) {
        for (int x = 0; x < WIDTH; ++x) {
            for (int y = 0; y < HEIGHT; ++y) {
                put_pixel(x, y, get_pixel(game.view, x, y) ? 0xFFFFFFFF : 0xFF000000);
            }
        }
        flush();
    }



    return 0;
}
