//
//  ViewController.m
//  Stadiometer
//
//  Created by hIDDEN on 2014/10/08.
//  Copyright (c) 2014年 hIDDEN. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
{
	__weak IBOutlet UIButton *startButton;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// init altimeter
	if ( ![CMAltimeter isRelativeAltitudeAvailable] )
	{
		[startButton setTitle:@"サポートしていません。" forState:UIControlStateNormal];
	}
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
