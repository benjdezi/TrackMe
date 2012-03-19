//
//  TrackMeAppDelegate.h
//  TrackMe
//
//  Created by Benjamin Dezile on 3/4/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

#define YARD_TO_METER		0.9144			// Conversion from yards to meters
#define MILES_TO_KM			1.609344		// Conversion from miles to kilometers
#define MAP_RADIUS			0.5				// Default map span
#define MIN_DIST_CHANGE		250				// Minimum change in position required to be relevant
#define MAX_DIST_CHANGE		1000			// Maximum change in position
#define MAX_SPEED			120				// Maximim speed
#define DEFAULT_PRECISION	75				// Default location precision
#define DEFAULT_NUM_POINTS	1024			// Maximim number of points on a path
#define TIMER_PERIOD		0.1				// Timer refresh period
#define DEFAULT_TIMER_TEXT	@"00:00:00.0"	// Inital display for the timer 


@class TrackMeViewController;

@interface TrackMeAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, UITabBarDelegate> {

    UIWindow* window;
    TrackMeViewController* mainViewController;
	UITabBarController* tabBarController;
	
	CLLocationManager* locationManager;
	NSTimer* timer;
	
	NSMutableArray* locationPoints;
	double totalDistance;
	double avgSpeed;
	double currentSpeed;
	int numPoints;
	double elapsedTime;
}

-(void)reset;
-(void)start;
-(void)stop;
-(void)updateTimer;
-(void)updateMap:(CLLocation*)oldLocation newLocation:(CLLocation*)location;

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet TrackMeViewController* mainViewController;
@property (nonatomic, retain) IBOutlet UITabBarController* tabBarController;
@property (retain) CLLocationManager* locationManager;
@property (retain) NSMutableArray* locationPoints;
@property (retain) NSTimer* timer;
@property double totalDistance;
@property double avgSpeed;
@property double currentSpeed;
@property int numPoints;
@property double elapsedTime;

@end

