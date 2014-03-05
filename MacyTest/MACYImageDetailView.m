//
//  MACYImageDetailView.m
//  MacyTest
//
//  Created by yanping Lan on 3/4/14.
//  Copyright (c) 2014 yanping Lan. All rights reserved.
//

#import "MACYImageDetailView.h"

@implementation MACYImageDetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageView = [[UIImageView alloc] initWithFrame:frame];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _scrollView = [[UIScrollView alloc] initWithFrame:frame];
        
        [self addSubview:_imageView];
        [self addSubview:_scrollView];
        _scrollView.delegate = self;
        
        
        self.scrollView.delegate = self;
        self.scrollView.maximumZoomScale = 200.0;
    }
    return self;
}


- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return  _imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)sv
{
    UIView* zoomView = [sv.delegate viewForZoomingInScrollView:sv];
    CGRect zvf = zoomView.frame;
    if(zvf.size.width < sv.bounds.size.width)
    {
        zvf.origin.x = (sv.bounds.size.width - zvf.size.width) / 2.0;
    }
    else
    {
        zvf.origin.x = 0.0;
    }
    if(zvf.size.height < sv.bounds.size.height)
    {
        zvf.origin.y = (sv.bounds.size.height - zvf.size.height) / 2.0;
    }
    else
    {
        zvf.origin.y = 0.0;
    }
    zoomView.frame = zvf;
}


@end
