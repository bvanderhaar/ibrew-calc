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
    float beerVolume = [self.beerVolume.text floatValue];
    float co2Volume = [self.co2Volume.text floatValue];
    float temperature = [self.temperature.text floatValue];
    self.sugarAmount.text = [NSString stringWithFormat:@"%f", [self sugarAmountInGrams: beerVolume: co2Volume: temperature]];
    return YES;
}

- (float)sugarAmountInGrams : (float) volume : (float) co2Volume : (float) temperature
{
    return 15.195 * volume * ( co2Volume - 3.0378 + .050062 * temperature - .00026555 * temperature * temperature );
}

- (IBAction)postToFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.beerVolume.text stringByAppendingString:@" gallons of beer of my new brew being bottled"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"no facebook available");
    }
}

- (IBAction)findRecipes:(id)sender {
    NSString *stringURL = @"http://beersmithrecipes.com/";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}
@end
