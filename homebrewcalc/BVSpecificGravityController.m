//
//  BVFirstViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVSpecificGravityController.h"
#import "BVGravityTextField.h"
#import "BVTemperatureTextField.h"

#define A0 (1.313454)
#define A1 (-0.132674)
#define A2 (2.057793e-3)
#define A3 (-2.627634e-6)

@interface BVSpecificGravityController ()

@end

@implementation BVSpecificGravityController

- (void)viewDidLoad
{
    self.originalGravity.delegate = self;
    self.temperature.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    return YES;
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    if ([textField.text length] == 0)
    {
        if ([textField isKindOfClass:[BVTemperatureTextField class]])
        {
            textField.placeholder = @"Temperature";
        }
        
        if ([textField isKindOfClass:[BVGravityTextField class]])
        {
            textField.placeholder = @"Original Gravity";            
        }
        NSLog(@"text field is empty");
    }
    else
    {
        float gravity = [self.originalGravity.text floatValue];
        float temperature = [self.temperature.text floatValue];
        self.specificGravity.text = [NSString stringWithFormat:@"%f", [self correctedSG: gravity: temperature]];
    }
    return YES;
}

//http://homebrew.stackexchange.com/questions/4137/temperature-correction-for-specific-gravity
- (float) correctedSG:(float)specificGravity :(float) temp
{
    float correction;
    correction = A0 + A1*temp + A2*temp*temp + A3*temp*temp*temp;
    return( specificGravity + (correction * 0.001) );
}


@end
