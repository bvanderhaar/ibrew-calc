//
//  BVPrimingSugarViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/11/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVPrimingSugarViewController.h"
#import <Social/Social.h>

@interface BVPrimingSugarViewController ()

@end

@implementation BVPrimingSugarViewController

- (void)viewDidLoad
{
    self.temperature.delegate = self;
    self.beerVolume.delegate = self;
    self.co2Volume.delegate = self;
    [super viewDidLoad];
	// Do any additional setup after loading the view.
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
    if ([self.beerVolume.text length] == 0)
    {
        self.beerVolume.placeholder = @"Yield in Gallons";
    }
    
    if ([self.temperature.text length] == 0)
    {
        self.temperature.placeholder = @"Temp";
    }
    
    if ([self.co2Volume.text length] == 0)
    {
        self.co2Volume.placeholder = @"Volumes of CO\u2082";
    }
    [self updateSugarAmount];
    [self.co2Volume resignFirstResponder];
    return YES;
}

- (float)sugarAmountInGrams : (float) volume : (float) co2Volume : (float) temperature
{
    return 15.195 * volume * ( co2Volume - 3.0378 + .050062 * temperature - .00026555 * temperature * temperature );
}

- (IBAction)postToFacebook:(id)sender
{
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.beerVolume.text stringByAppendingString:@" gallons of beer of my new brew being bottled"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
}

- (void) updateSugarAmount
{
    float beerVolume = [self.beerVolume.text floatValue];
    float co2Volume = [self.co2Volume.text floatValue];
    float temperature = [self.temperature.text floatValue];
    float sugarAmountToDisplay = [self sugarAmountInGrams: beerVolume: co2Volume: temperature];
    if (sugarAmountToDisplay > 0)
    {
        self.sugarAmountLabel.text = [NSString stringWithFormat:@"%.3f g", sugarAmountToDisplay];
    }
    else
    {
        self.sugarAmountLabel.text = nil;
    }
}

- (IBAction)findRecipes:(id)sender
{
    NSString *stringURL = @"http://beersmithrecipes.com/";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.co2Volume isFirstResponder] && [touch view] != self.co2Volume) {
        [self.co2Volume resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)sugarAmountChanged:(id)sender
{
    [self updateSugarAmount];
}
@end
