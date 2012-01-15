//
//  DropShadowView.m
//  studioapp
//
//  Created by George Williams on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DropShadowView.h"

#import <QuartzCore/QuartzCore.h>

@implementation DropShadowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
#if 1
        [self.layer setMasksToBounds:NO];
        [self.layer setCornerRadius:1];        
        [self.layer setBorderColor:[UIColor grayColor].CGColor]; //[RGB(180, 180, 180) CGColor]];
        [self.layer setBorderWidth:1.0f];
        [self.layer setShadowColor:[UIColor blackColor].CGColor];
        [self.layer setShadowOffset:CGSizeMake(3.0, 3.0)];
        [self.layer setShadowOpacity:0.5];
        [self.layer setShadowRadius:5.0];
        self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
#endif
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

@end
