#ifndef PGMSPACE_COMPAT_H
#define PGMSPACE_COMPAT_H

#include <stdint.h>

// Definisce il macro PROGMEM come vuoto, perché non è necessario per STM32
#define PROGMEM

// Definisce il macro pgm_read_word per leggere direttamente dai dati
#define pgm_read_word(addr) (*(const uint16_t *)(addr))

// Definisce il macro pgm_read_byte per leggere direttamente dai dati
#define pgm_read_byte(addr) (*(const uint8_t *)(addr))

#endif // PGMSPACE_COMPAT_H
