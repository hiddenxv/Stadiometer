//
//  MeterViewController.h
//  Stadiometer
//
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface MeterViewController : UIViewController
{
	CMAltimeter* altimeter;
	
	float prevAltitude;
	BOOL firstMeasured;
}

@end
