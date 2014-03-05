//
//  UIButton+custom.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "UIButton+custom.h"

@implementation UIButton (custom)

+(UIButton *)composeButton:(NSString *)title withBackgroundColor:(UIColor *)color{
    
    UIButton *button = [[UIButton alloc] init];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    
    [button setBackgroundColor:[UIColor greenColor]];
    button.showsTouchWhenHighlighted = YES;
    
    return button;
    
}

@end
