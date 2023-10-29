#include <stdio.h>
#include <string>
#include <unordered_map>

extern "C" void start_logger(char *name) {
    printf("Start: %s\n", name);
}

template<typename A, typename B>
struct pair_hash_t {
    size_t operator()(const std::pair<A, B> &v) const {
        return std::hash<A>{}(v.first) + std::hash<B>{}(v.second);
    }
};

static std::unordered_map<std::pair<std::string, std::string>, size_t, pair_hash_t<std::string, std::string>> stat;



extern "C" void opt_logger(char *me, char *him) {
    stat[std::pair{std::string{me}, std::string{him}}]+=1;
}

extern "C" void end_logger(char *name) {
    for (const auto&item : stat) {
        printf("\t%s -> %s: %lu\n", item.first.first.c_str(), item.first.second.c_str(), item.second);
    }
    printf("End: %s\n", name);
}


