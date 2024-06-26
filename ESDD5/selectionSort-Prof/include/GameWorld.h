/**
 * @file GameWorld.h
 * @author Prof. Dr. David Buzatto
 * @brief GameWorld struct and functions declarations.
 * 
 * @copyright Copyright (c) 2024
 */
#pragma once

#include "CopiaArray.h"

typedef struct GameWorld {
    
    int* array;
    int tamanho;
    CopiaArray* copias;

    float acumulador;
    float aguardar;
    int copiaAtual;
    int maxCopias;

} GameWorld;

/**
 * @brief Creates a dinamically allocated GameWorld struct instance.
 */
GameWorld* createGameWorld( void );

/**
 * @brief Destroys a GameWindow object and its dependecies.
 */
void destroyGameWorld( GameWorld *gw );

/**
 * @brief Reads user input and updates the state of the game.
 */
void inputAndUpdateGameWorld( GameWorld *gw );

/**
 * @brief Draws the state of the game.
 */
void drawGameWorld( GameWorld *gw );