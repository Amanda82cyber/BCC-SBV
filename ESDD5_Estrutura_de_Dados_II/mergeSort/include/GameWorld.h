/**
 * @file GameWorld.h
 * @author Prof. Dr. David Buzatto
 * @brief GameWorld struct and functions declarations.
 *
 * @copyright Copyright (c) 2024
 */
#pragma once

typedef struct GameWorld
{
    int *array;
    int *arrayCopia;
    int tamanho;
} GameWorld;

/**
 * @brief Creates a dinamically allocated GameWorld struct instance.
 */
GameWorld *createGameWorld(void);

/**
 * @brief Destroys a GameWindow object and its dependecies.
 */
void destroyGameWorld(GameWorld *gw);

/**
 * @brief Reads user input and updates the state of the game.
 */
void inputAndUpdateGameWorld(GameWorld *gw);

/**
 * @brief Draws the state of the game.
 */
void drawGameWorld(int *array, int tamanho);