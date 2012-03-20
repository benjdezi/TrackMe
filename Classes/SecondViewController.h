//
//  SecondViewController.h
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 TrackMe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackMeAppDelegate.h"

@class TrackMeAppDelegate;

@interface SecondViewController : UIViewController {

	TrackMeAppDelegate* delegate;
	
	UILabel* sensitivityLabel;
	UISlider* sensitivitySlider;
	UISwitch* metricSwitch;
	
}

-(IBAction)updateSensitivity;
-(IBAction)changeUnitSystem;

@property (nonatomic, retain) TrackMeAppDelegate* delegate;

@property (nonatomic, retain) IBOutlet UILabel* sensitivityLabel;
@property (nonatomic, retain) IBOutlet UISlider* sensitivitySlider;
@property (nonatomic, retain) IBOutlet UISwitch* metricSwitch;

@end
