//
//  BVGravityTextField.m
//  homebrewcalc
//
//  Created by Brett VanderHaar on 6/6/13.
//  Copyright (c) 2013 Brett VanderHaar. All rights reserved.
//

#import "BVGravityTextField.h"

@implementation BVGravityTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = self;
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void) textFieldDidBeginEditing:(BVGravityTextField *)textField
{
    NSLog(@"textFieldDidBeginEditing");
    if (textField.didTouchRecently)
    {
        
    }
}

- (BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"textFieldShouldBeginEditing");
    textField.backgroundColor = [UIColor colorWithRed:220.0f/255.0f green:220.0f/255.0f blue:220.0f/255.0f alpha:1.0f];
    return YES;
}

@end
