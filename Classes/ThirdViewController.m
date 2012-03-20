//
//  ThirdViewController.m
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import "ThirdViewController.h"
#import "config.h"


@implementation ThirdViewController

@synthesize versionLabel;


#pragma mark -
#pragma mark ViewController protocol

- (void)viewDidLoad {	
	
	[self.versionLabel setText:VERSION];
	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc {
	[versionLabel release];
    [super dealloc];
}

@end
