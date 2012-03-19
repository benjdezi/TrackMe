//
//  FirstViewController.h
//  TrackMe
//
//  Created by Benjamin Dezile on 3/19/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "TrackMeAppDelegate.h"


#define START_BUTTON_TEXT	@"Start"
#define STOP_BUTTON_TEXT	@"Pause"
#define RESUME_BUTTON_TEXT	@"Resume"


@class TrackMeAppDelegate;

@interface FirstViewController : UIViewController {

	TrackMeAppDelegate* delegate;
	
	BOOL started;
	
	UILabel* runTimeLabel;
	UILabel* distanceLabel;
	UILabel* avgSpeedLabel;
	UILabel* curSpeedLabel;
	UIButton* startButton;
	UIButton* resetButton;
	MKMapView* mapView;
	
}

-(IBAction)startOrStop;
-(IBAction)reset;

-(void)setStartButtonTitle:(NSString*)text;
-(void)updateRunDisplay;

@property (nonatomic, retain) TrackMeAppDelegate* delegate;

@property BOOL started;

@property (nonatomic, retain) IBOutlet UILabel* runTimeLabel;
@property (nonatomic, retain) IBOutlet UILabel* distanceLabel;
@property (nonatomic, retain) IBOutlet UILabel* avgSpeedLabel;
@property (nonatomic, retain) IBOutlet UILabel* curSpeedLabel;
@property (nonatomic, retain) IBOutlet UIButton* startButton;
@property (nonatomic, retain) IBOutlet UIButton* resetButton;
@property (nonatomic, retain) IBOutlet MKMapView* mapView;

@end
