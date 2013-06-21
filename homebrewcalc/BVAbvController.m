//
//  BVSecondViewController.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/4/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVAbvController.h"
#import <Social/Social.h>

@interface BVAbvController ()

@end

@implementation BVAbvController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.trackedViewName = @"ABV Calculator";
    self.originalGravity.delegate = self;
    self.finalGravity.delegate = self;
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
    else if ([self.finalGravity.text length] == 0)
    {
        self.finalGravity.placeholder =  @"Final Gravity (FG)";
    }
    else
    {
        [self updateAbvPercentage];
    }
    [self.finalGravity resignFirstResponder];
    return YES;
}

- (void) updateAbvPercentage
{
    float gravity = [self.originalGravity.text floatValue];
    float finalGravity = [self.finalGravity.text floatValue];
    self.abvLabel.text = [NSString stringWithFormat:@"%.02f%%", [self abv: gravity: finalGravity]];
}

- (float) abv: (float) originalGravity : (float) finalGravity
{
    return ((1.05 * (originalGravity - finalGravity)) / finalGravity) / 0.79 * 100;
}

- (IBAction)postToFacebook:(id)sender {
    if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
    {
        SLComposeViewController* facebookVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
        [facebookVC setInitialText:[self.originalGravity.text stringByAppendingString:@" original gravity on my new brew"]];
        [self presentViewController:facebookVC animated:YES completion:NULL];
    }
}

- (IBAction)findRecipes:(id)sender {
    NSString *stringURL = @"http://homebrewmanual.com/beer-alcohol-content-abv-style/";
    NSURL *url = [NSURL URLWithString:stringURL];
    [[UIApplication sharedApplication] openURL:url];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    if ([self.finalGravity isFirstResponder] && [touch view] != self.finalGravity) {
        [self.finalGravity resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

- (IBAction)finalGravityChanged:(id)sender {
    [self updateAbvPercentage];
}
@end
