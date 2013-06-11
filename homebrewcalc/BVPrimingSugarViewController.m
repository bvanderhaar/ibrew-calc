//
//  BVPrimingSugarViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/11/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVPrimingSugarViewController.h"

@interface BVPrimingSugarViewController ()

@end

@implementation BVPrimingSugarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (float)sugarAmountInGrams : (float) volume : (float) co2Volume : (float) temperature
{
    return 15.195 * volume * ( co2Volume - 3.0378 + .050062 * temperature - .00026555 * temperature * temperature );
}

@end
