//
//  TrackMeAppDelegate.h
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "config.h"

@class FirstViewController;
@class SecondViewController;

@interface TrackMeAppDelegate : NSObject <UIApplicationDelegate, CLLocationManagerDelegate, UITabBarControllerDelegate> {
 
	UIWindow* window;
    UITabBarController* tabBarController;
	FirstViewController* firstController;
	SecondViewController* secondController;
	
	CLLocationManager* locationManager;
	CLLocationCoordinate2D bottomLeft;
	CLLocationCoordinate2D topRight;
	
	NSTimer* timer;
	
	NSMutableArray* locationPoints;
	double totalDistance;
	double avgSpeed;
	double currentSpeed;
	double altitude;
	int elapsedTime;
	NSDate* startTime;
	
	BOOL hasZoomedOnMap;
	BOOL isMetric;
	double sensitivity;
	
}

-(void)reset;
-(void)start;
-(void)stop;
-(void)updateTimer;
-(void)updateMap:(CLLocation*)oldLocation newLocation:(CLLocation*)location;
-(void)drawLineForLocations:(CLLocation*)location fromLocation:(CLLocation*)oldLocation;
-(void)processLocationChange:(CLLocation*)newLocation fromLocation:oldLocation;
-(double)generateRamdonChange;
-(void)annotateMap:(CLLocation*)location;
-(double)updateSensitivity;
-(BOOL)updateUnitSystem;
-(void)saveSettings;
-(BOOL)loadSettings;

-(NSString*)_formatDistance:(double)distance isBasic:(BOOL)basic;
-(NSString*)formatDistanceBasic:(double)distance;
-(NSString*)formatDistance:(double)distance;
-(NSString*)formatSpeed:(double)speed;
-(int)getElapsedTimeInMilliseconds;

@property (nonatomic, retain) IBOutlet UIWindow* window;
@property (nonatomic, retain) IBOutlet UITabBarController* tabBarController;
@property (nonatomic, retain) FirstViewController* firstController;
@property (nonatomic, retain) SecondViewController* secondController;

@property (retain) CLLocationManager* locationManager;
@property CLLocationCoordinate2D bottomLeft;
@property CLLocationCoordinate2D topRight;

@property (retain) NSMutableArray* locationPoints;
@property (retain) NSTimer* timer;
@property (retain) NSDate* startTime;
@property double totalDistance;
@property double avgSpeed;
@property double currentSpeed;
@property double altitude;
@property int elapsedTime;

@property BOOL hasZoomedOnMap;
@property BOOL isMetric;
@property double sensitivity;

@end
