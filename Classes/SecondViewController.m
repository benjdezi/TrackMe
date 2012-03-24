    //
//  SecondViewController.m
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

@synthesize delegate;
@synthesize sensitivityLabel;
@synthesize sensitivitySlider;
@synthesize metricSwitch;


#pragma mark -
#pragma mark Custom methods

-(IBAction)updateSensitivity {
	double value = [self.delegate updateSensitivity];
	NSString* formattedSensitivityValue = [self.delegate formatDistance:value];
	[self.sensitivityLabel setText:formattedSensitivityValue];
}


-(IBAction)changeUnitSystem {
	[self.delegate updateUnitSystem];
	[self updateSensitivity];
}


#pragma mark -
#pragma mark ViewController protocol

- (void)viewDidLoad {
	
	self.delegate = (TrackMeAppDelegate*)[[UIApplication sharedApplication] delegate];
	
	[self.sensitivityLabel setText:[self.delegate formatDistance:self.delegate.sensitivity]];
	[self.metricSwitch setOn:self.delegate.isMetric];
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[sensitivitySlider release];
	[metricSwitch release];
    [super dealloc];
}

@end
