/*
 *  config.h
 *  TrackMe
 *
 *  Created by Benjamin Dezile on 3/20/12.
 *  Copyright 2012 TrackMe. All rights reserved.
 *
 */

#define VERSION				@"0.1.5"			// Version

#define MILE_TO_YARD		1760				// Conversion from miles to yards
#define YARD_TO_METER		0.9144				// Conversion from yards to meters
#define MILE_TO_KM			1.609344			// Conversion from miles to kilometers
#define MAP_RADIUS			0.5					// Default map span
#define MIN_DIST_CHANGE		50					// Minimum change in position required to be relevant
#define MAX_DIST_CHANGE		1000				// Maximum change in position required to be relevant
#define MAX_SPEED			120					// Maximim speed
#define DEFAULT_NUM_POINTS	1024				// Maximim number of points on a path
#define TIMER_PERIOD		0.1					// Timer refresh period
#define DEFAULT_TIMER_TEXT	@"00:00:00.0"		// Inital display for the timer
#define DEFAULT_SENSITIVITY	250					// Default sensitivity
#define DEFAULT_PRECISION	75					// Default location precision

#define SETTINGS_FILE		@"settings.conf"	// File to save settings into
#define SETTINGS_SEP		@":"				// Separator for saved values