//
//  UILabel+custom.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "UILabel+custom.h"

@implementation UILabel (custom)

+(UILabel *)composeLabel:(NSString *)title isTitle:(BOOL) isTitle{
    
    UILabel * label = [[UILabel alloc] init];
    NSString * style = (isTitle)? UIFontTextStyleHeadline :UIFontTextStyleBody;
    label.font = [UIFont preferredFontForTextStyle: style];
    label.text = title;
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentLeft;
    
    return label;
    
}


@end
