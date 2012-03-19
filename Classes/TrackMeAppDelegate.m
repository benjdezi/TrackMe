//
//  TrackMeAppDelegate.m
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackMeAppDelegate.h"
#import <CoreLocation/CoreLocation.h>


@implementation TrackMeAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize locationManager;
@synthesize totalDistance;
@synthesize avgSpeed;
@synthesize currentSpeed;
@synthesize locationPoints;
@synthesize numPoints;
@synthesize elapsedTime;
@synthesize timer;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.

    // Add the tab bar controller's view to the window and display.
    [self.window addSubview:tabBarController.view];
    [self.window makeKeyAndVisible];

	// Initialize stats
	[self reset];
	
	// Initialize location tracking
	self.locationManager = [[[CLLocationManager alloc] init] autorelease];
	self.locationManager.delegate = self;
	self.locationManager.distanceFilter = MIN_DIST_CHANGE;
	self.locationManager.desiredAccuracy = DEFAULT_PRECISION;
	
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Custom methods

- (void)reset {
	
	self.elapsedTime = 0;
	self.totalDistance = 0;
	self.avgSpeed = 0;
	self.locationPoints = [[NSMutableArray alloc] initWithCapacity:DEFAULT_NUM_POINTS];
	self.numPoints = 0;
	
	// Clear map annotations
	int index = self.tabBarController.selectedIndex;
	NSLog(@"Selected tab index = %d", index);
	//if (self.mainViewController.mapView.annotations != NULL) {
	//	for (id annotation in self.mainViewController.mapView.annotations) {		
	//		if (![annotation isKindOfClass:[MKUserLocation class]]){
	//			[self.mainViewController.mapView removeAnnotation:annotation];
	//		}
	//	}
	//}
	
	NSLog(@"Reset stats values");
	
}


-(void)start {
	[self.locationManager startUpdatingLocation];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_PERIOD target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
	NSLog(@"Started tracking");
}


-(void)stop {
	[self.timer invalidate];
	[self.locationManager stopUpdatingLocation];
	NSLog(@"Stopped tracking");
}


-(void)updateTimer {
	
	self.elapsedTime += 0.1;
	
	int delta_milli = self.elapsedTime * 1000;
	int hours = delta_milli / (3600 * 1000);
	int minutes = (delta_milli - (3600 * 1000) * hours) / (60 * 1000);
	int seconds = (delta_milli - (3600 * 1000) * hours - (60 * 1000) * minutes) / 1000;
	int ms = (delta_milli - (3600 * 1000) * hours - (60 * 1000) * minutes - 1000 * seconds) / 100;
	
	NSString* timeString = [NSString stringWithFormat:@"%.2d:%.2d:%.2d.%d", hours, minutes, seconds, ms];
	NSLog(@"Time = %@", timeString);
	
	//[self.mainViewController.runTimeLabel setText:timeString];
	
}


-(void)updateMap:(CLLocation*)oldLocation newLocation:(CLLocation*)location {
	
	//double scalingFactor = ABS(cos(2 * M_PI * location.coordinate.latitude / 360.0));
	
	//MKCoordinateSpan span;
	//span.latitudeDelta = MAP_RADIUS / 69.0;
	//span.longitudeDelta = MAP_RADIUS / (scalingFactor * 69.0);
	
	//MKCoordinateRegion region;
	//region.span = span;
	//region.center = location.coordinate;
	
	//if (oldLocation != NULL) {
	//	double deltaDist = fabs([location distanceFromLocation:oldLocation]);
	//	if (deltaDist > MIN_DIST_CHANGE || self.numPoints == 1) {
	//		MKPointAnnotation* annotation = [MKPointAnnotation alloc];
	//		annotation.coordinate = oldLocation.coordinate;
	//		[self.mainViewController.mapView addAnnotation:annotation];
	//	}
	//}
	
	//[self.mainViewController.mapView setRegion:region];
	//self.mainViewController.mapView.showsUserLocation = YES;
	NSLog(@"Updated map");
	
}


#pragma mark -
#pragma mark UITabBarControllerDelegate methods

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

