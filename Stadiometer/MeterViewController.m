//
//  MeterViewController.m
//  Stadiometer
//
//

#import "MeterViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface MeterViewController ()
{
	__weak IBOutlet UILabel *altitudeLabel;
	__weak IBOutlet UIActivityIndicatorView *indicator;
	__weak IBOutlet UILabel *messageLabel;
}

@end

@implementation MeterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

	altimeter = [[CMAltimeter alloc] init];
	[altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue]
									   withHandler:^( CMAltitudeData* data, NSError* error ) {
										   [self altimeterUpdated:data error:error];
									   }];
	
	firstMeasured = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) altimeterUpdated:(CMAltitudeData*) data error:(NSError*) error
{
	int altitude = (int) ABS( data.relativeAltitude.floatValue * 100 );
	altitudeLabel.text = [NSString stringWithFormat:@"%d cm", altitude];
	
	if ( !firstMeasured )
	{
		AudioServicesPlaySystemSound( kSystemSoundID_Vibrate );
		firstMeasured = YES;
		
		[indicator stopAnimating];
		messageLabel.hidden = NO;
	}
}

@end
