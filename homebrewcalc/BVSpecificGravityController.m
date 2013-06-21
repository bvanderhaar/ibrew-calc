//
//  BVFirstViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVSpecificGravityController.h"
#import <Social/Social.h>

#define A0 (1.313454)
#define A1 (-0.132674)
#define A2 (2.057793e-3)
#define A3 (-2.627634e-6)

@interface BVSpecificGravityController ()

@end

@implementation BVSpecificGravityController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.originalGravity.delegate = self;
    self.temperature.delegate = self;
    self.trackedViewName = @"Specific Gravity Calculator";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    textField.placeholder = @"";
}

- (BOOL) textFieldShouldEndEditing:(UITextField *)textField
{
    if ([self.originalGravity.text length] == 0)
    {
        self.originalGravity.placeholder = @"Original Gravity (OG)";
    }
    
    if ([self.temperature.text length] == 0)
    {
        self.temperature.placeholder = @"Temp";
    }
    else
    {
        [self updateSpecificGravity];
    }
    [self.temperature resignFirstResponder];
    return YES;
}

- (float) correctedSG:(float)specificGravity :(float) temp
{
    float correction;
    correction = A0 + A1*temp + A2*temp*temp + A3*temp*temp*temp;
    return( specificGravity + (correction * 0.001) );
}

- (float) fahrenheitToCelsius: (float) temp
{
    return (temp - 32) * 5 / 9;
}

- (float) celsiusToFahrenheit: (float) temp
{
    return temp * 9 / 5 + 32;
}

- (IBAction)postToFacebook:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.originalGravity.text stringByAppendingString:@" original gravity on my new brew"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
}

- (void) updateSpecificGravity
{
    float gravity = [self.originalGravity.text floatValue];
    float temperature = [self.temperature.text floatValue];
    self.specificGravity.text = [NSString stringWithFormat:@"%.3f", [self correctedSG: gravity: temperature]];
}

- (IBAction)findRecipes:(id)sender
{
    NSString *stringURL = @"http://beersmithrecipes.com/";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

- (IBAction)tempEditingChanged:(id)sender
{
    [self updateSpecificGravity];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.temperature isFirstResponder] && [touch view] != self.temperature) {
        [self.temperature resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

@end
