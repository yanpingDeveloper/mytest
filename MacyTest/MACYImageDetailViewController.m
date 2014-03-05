//
//  MACYImageDetailViewController.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYImageDetailViewController.h"

@interface MACYImageDetailViewController ()

@end

@implementation MACYImageDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        _imageView = [[MACYImageDetailView alloc]initWithFrame:CGRectMake(0, kScreenPadding, kScreenWidth, kScreenHeight-kScreenStarting)];
        
        [self.view addSubview:_imageView];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"View Image";
    
}

- (void)viewDidAppear:(BOOL)animated{
    
    //[[UINavigationBar appearance]setTranslucent:NO];
}

- (void)viewDidDisappear:(BOOL)animated{
    
    //[[UINavigationBar appearance]setTranslucent:YES];
}

- (void) fadein {
    
//    if(self.view.alpha < 1.0){
//        self.view.alpha = self.view.alpha + 0.01;
//        [self performSelector:@selector(fadein) withObject:nil afterDelay:0.006];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
