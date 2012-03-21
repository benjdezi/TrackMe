//
//  FirstViewController.m
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import "FirstViewController.h"
#import <MapKit/MapKit.h>

@implementation FirstViewController

@synthesize delegate;
@synthesize started;
@synthesize runTimeLabel;
@synthesize distanceLabel;
@synthesize avgSpeedLabel;
@synthesize curSpeedLabel;
@synthesize altitudeLabel;
@synthesize startButton;
@synthesize resetButton;
@synthesize mapView;


#pragma mark -
#pragma mark Custom methods

-(void)startOrStop {
	
	if (self.started == NO) {
		
		// Start new run
		NSLog(@"Starting or resuming run");
		self.started = YES;
		[self setStartButtonTitle:STOP_BUTTON_TEXT];
		[self.delegate start];
		
	}
	else {
		
		// Stop current run
		NSLog(@"Pausing current run");
		self.started = NO;
		if ([self.delegate getElapsedTimeInMilliseconds] > 0) {
			[self setStartButtonTitle:RESUME_BUTTON_TEXT];
		}
		else {
			[self setStartButtonTitle:START_BUTTON_TEXT];
		}
		[self.delegate stop];
		
	}
}


-(void)reset {
	NSLog(@"Resetting current run");
	[self.delegate stop];
	[self.delegate reset];
	[self.runTimeLabel setText:DEFAULT_TIMER_TEXT];
	[self.distanceLabel setText:@"0 m"];
	[self.altitudeLabel setText:@"0 m"];
	[self.avgSpeedLabel setText:@"-"];
	[self.curSpeedLabel setText:@"-"];
	[self setStartButtonTitle:START_BUTTON_TEXT];
	self.started = NO;
	[self setStartButtonTitle:START_BUTTON_TEXT];
}


-(void)setStartButtonTitle:(NSString*)text {
	[self.startButton setTitle:text forState:UIControlStateNormal];
}


-(void)updateRunDisplay {
	
	// Total distance formatting
	NSString* dist = [self.delegate formatDistance:self.delegate.totalDistance];
	
	// Altitude
	NSString* alt = [self.delegate formatDistanceBasic:self.delegate.altitude];
	
	// Average speed
	NSString* avgSpeed = [self.delegate formatSpeed:self.delegate.avgSpeed];
	
	// Current speed
	NSString* curSpeed = [self.delegate formatSpeed:self.delegate.currentSpeed];
	
	NSLog(@"New distance: %@", dist);
	NSLog(@"New altitude: %@", alt);
	NSLog(@"New avg. speed: %@", avgSpeed);
	NSLog(@"New speed: %@", curSpeed);
	
	[self.distanceLabel setText:dist];
	[self.altitudeLabel setText:alt];
	[self.avgSpeedLabel setText:avgSpeed];
	[self.curSpeedLabel setText:curSpeed];
	
}


#pragma mark -
#pragma mark ViewController protocol

- (void)viewDidLoad {
	
    [super viewDidLoad];
	
	self.delegate = (TrackMeAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	[self reset];
	
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)dealloc {
	[runTimeLabel release];
	[distanceLabel release];
	[avgSpeedLabel release];
	[curSpeedLabel release];
	[startButton release];
	[resetButton release];
	[mapView release];
    [super dealloc];
}

@end
