//
//  BVEfficiencyCalculatorViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/21/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVEfficiencyCalculatorViewController.h"

@interface BVEfficiencyCalculatorViewController ()

@end

@implementation BVEfficiencyCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.trackedViewName = @"Efficiency Calculator";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) updateEfficiency
{
    float gravity = [self.originalGravity.text floatValue];
    float volume = [self.volume.text floatValue];
    float ppg = [self.ppg.text floatValue];
    
}
@end
