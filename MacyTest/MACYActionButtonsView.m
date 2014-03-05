//
//  MACYActionButtonsView.m
//  MacyTest
//
//  Created by yanping Lan on 3/3/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYActionButtonsView.h"

@implementation MACYActionButtonsView{
    BOOL isShowButtonClicked;
}

- (void) setUpView {
    
    self.buttonCreateProduct = [UIButton composeButton:@"Create Product" withBackgroundColor:[UIColor greenColor]];
    [self.buttonCreateProduct addTarget:self action:@selector(buttonCreateProductPressed:)forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.buttonCreateProduct];
    
    self.buttonShowProduct = [UIButton composeButton:@"Show Products" withBackgroundColor:[UIColor greenColor]];
    [self.buttonShowProduct addTarget:self action:@selector(buttonShowProductPressed:)forControlEvents:UIControlEventTouchUpInside];

    [self addSubview:self.buttonShowProduct];
    
    self.buttonCreateProduct.translatesAutoresizingMaskIntoConstraints = NO;
    self.buttonShowProduct.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    
    [self updateConstraints];

}
- (void)updateConstraints{
    
    [super updateConstraints];
    [self removeConstraints:self.constraints];
    
    NSDictionary *constrantsViewsDictionary = @{
                                                @"buttonCreateProduct"     : self.buttonCreateProduct,
                                                @"buttonShowProduct"       : self.buttonShowProduct,
                                                };
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[buttonCreateProduct(==130)]-20-[buttonShowProduct(==130)]"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:constrantsViewsDictionary]];
    
  
    
    
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonCreateProduct]-20-|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:constrantsViewsDictionary]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[buttonShowProduct]-20-|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:constrantsViewsDictionary]];
}


- (id) initWithFrame:(CGRect)frame createProductBlock:(buttonClickBlock) createProductButtonBlock showProductBlock:(buttonClickBlock) showProductButtonBlock{
    
    self = [super initWithFrame:frame];
    if(self) {
        
        self.createProductBlock = createProductButtonBlock;
        self.showProductBlock = showProductButtonBlock;
        [self setUpView];
    
    }
    
    return self;
    
}

- (void)buttonCreateProductPressed:(id)sender{
    
    if(self.createProductBlock){
        
        self.createProductBlock();
    }
    
}

- (void)buttonShowProductPressed:(id)sender{
    
    if(self.showProductBlock){
        
        self.showProductBlock();
        //update button title
        isShowButtonClicked = !isShowButtonClicked;
        NSString * titleText = (isShowButtonClicked)? @"Close Products":@"Show Products";
        [self.buttonShowProduct setTitle:titleText forState:UIControlStateNormal];
        [self setNeedsDisplay];
       
    }
    
}
@end
