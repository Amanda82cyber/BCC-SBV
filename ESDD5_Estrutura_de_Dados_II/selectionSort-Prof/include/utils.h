/**
 * @file utils.h
 * @author Prof. Dr. David Buzatto
 * @brief Utilitary functions and constants declarations.
 * 
 * @copyright Copyright (c) 2024
 */
#pragma once

#include "GameWorld.h"

double toRadians( double degrees );
double toDegrees( double radians );

void ordenar( GameWorld* gw );
void trocar( int* array, int p1, int p2 );