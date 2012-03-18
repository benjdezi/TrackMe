//
//  TrackMeAppDelegate.h
//  TrackMe
//
//  Created by Benjamin Dezile on 3/4/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


#define MAP_RADIUS			1.0
#define MIN_DIST_CHANGE		100
#define MAX_DIST_CHANGE		1000
#define MAX_SPEED			100
#define DEFAULT_PRECISION	75
#define DEFAULT_NUM_POINTS	1024
#define TIMER_PERIOD		0.1
#define DEFAULT_TIMER_TEXT	@"00:00:00.0"


@class TrackMeViewController;

@interface TrackMeAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate> {

    UIWindow *window;
    TrackMeViewController *viewController;
	
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
-(void)updateMap:(CLLocation*)location;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TrackMeViewController *viewController;
@property (retain) CLLocationManager* locationManager;
@property (retain) NSMutableArray* locationPoints;
@property (retain) NSTimer* timer;
@property double totalDistance;
@property double avgSpeed;
@property double currentSpeed;
@property int numPoints;
@property double elapsedTime;

@end

