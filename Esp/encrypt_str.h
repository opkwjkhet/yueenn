#pragma once
#include <cstddef>
#include <cstdint>

template <size_t N, uint8_t KEY>
struct XorStr {
    char data[N];

    constexpr XorStr(const char (&str)[N]) : data{} {
        for (size_t i = 0; i < N; ++i) {
            data[i] = str[i] ^ (KEY + i);
        }
    }

    const char* decrypt() {
        for (size_t i = 0; i < N; ++i) {
            data[i] = data[i] ^ (KEY + i);
        }
        return data;
    }
};

#define ENCRYPT(str) (XorStr<sizeof(str), 0x55>(str).decrypt())
