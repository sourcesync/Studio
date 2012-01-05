//
//  ZoomPicView.m
//  studioapp
//
//  Created by George Williams on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ZoomPicView.h"
#import "ZoomPicViewDelegate.h"
#import "MyScrollView.h"

@implementation ZoomPicView

@synthesize sv=_sv;
@synthesize top_view=_top_view;
@synthesize stap=_stap;
@synthesize dtap=_dtap;
@synthesize pinch=_pinch;
@synthesize zooming=_zooming;
@synthesize zoomed=_zoomed;
@synthesize lastPicRect=_lastPicRect;
@synthesize section=_section;
@synthesize delegate=_delegate;
@synthesize vparent=_vparent;
@synthesize full=_full;
@synthesize fullimg=_fullimg;
@synthesize thumb=_thumb;
@synthesize zoom_view=_zoom_view;

- (BOOL) handleBleed
{
    return NO;
    
    ViewController *vc = (ViewController *)self.vparent;
    if ( self.section != vc.section )
    {
        if ( self.delegate != nil )
        {
            [ self.delegate section_goto:self.section ];
        }
        return YES;
    }
    else
    {
        return NO;
    }
}

- (void) unzoom
{
    if (self.zooming)
    {
        return;
    }
    else
    {
        if ( self.zoomed )
        {
            [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.zoom_view.frame = self.lastPicRect;
                             self.top_view.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             self.frame = self.lastPicRect;
                             self.zoomed = NO;
                             self.zooming = NO;
                             self.sv.scrollEnabled = YES;
                             self.top_view.alpha = 1.0;
                             ViewController *vc = ( ViewController *)self.vparent;
                             vc.cur_zoom = nil;
                             
                             // set thumbnail back...
                             if (self.full)
                             {
                                 self.fullimg = nil;
                                 self.zoom_view.hidden = YES;
                             }
                         }
             ];
        }
    }
}

- (void) zoom
{
    if (self.zooming)
    {
        return;
    }
    else
    {
        self.zooming = YES;
        self.sv.scrollEnabled = NO;
        
        //[ self.top_view bringSubviewToFront:self ];
        
        if (!self.zoomed)
        {
            if ( self.full !=nil ) // swap zoom image here...
            {
                self.fullimg = [ UIImage imageNamed:self.full ];
                [ self.zoom_view setImage:self.fullimg ];
                self.zoom_view.hidden = NO;
                self.zoom_view.frame = self.frame;
                self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
                self.lastPicRect = self.frame;
            } 
             
            CGRect rct = CGRectMake(self.sv.contentOffset.x, 
                                    self.sv.contentOffset.y, 
                                    1024,768);
            
            [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.zoom_view.frame = rct;
                             self.top_view.alpha = 0.2;
                         }
                         completion:^(BOOL finished){
                             //self.frame = rct;
                             self.zoom_view.frame = rct;
                             self.zoomed = YES;
                             self.zooming = NO;
                             self.sv.scrollEnabled = NO;
                             self.top_view.alpha = 0.2;
                             
                         }
             ];
        }
#if 0
        else  // zoom back...
        {
            [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.zoom_view.frame = self.lastPicRect;
                             self.top_view.alpha = 1.0;
                         }
                         completion:^(BOOL finished){
                             self.frame = self.lastPicRect;
                             self.zoomed = NO;
                             self.zooming = NO;
                             self.sv.scrollEnabled = YES;
                             self.top_view.alpha = 1.0;
                             ViewController *vc = ( ViewController *)self.vparent;
                             vc.cur_zoom = nil;
                            
                             // set thumbnail back...
                             if (self.full)
                             {
                                 self.fullimg = nil;
                                 self.zoom_view.hidden = YES;
                             }
                         }
             ];
        }
#endif
    }
    
}

- (void) pinchGesture
{
    ViewController *vc = ( ViewController *)self.vparent;
    vc.cur_zoom = (id *)self;
    
    if ( [ self handleBleed ] )
    {
        return;
    }
    else
    {
        [ self zoom ]; 
    }
}


- (void) oneFingerTwoTaps
{
    ViewController *vc = ( ViewController *)self.vparent;
    vc.cur_zoom = (id *)self;
    
    if ( [ self handleBleed ] )
    {
        return;
    }
    else
    {
        [ self zoom ];
    }
}


- (void) oneFingerOneTap
{
    ViewController *vc = ( ViewController *)self.vparent;
    vc.cur_zoom = (id *)self;
    
    if ( [ self handleBleed ] )
    {
        return;
    }
    else
    {
        [ self zoom ];
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.lastPicRect = frame;
        self.dtap = 
            [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                                     action:@selector(oneFingerTwoTaps)] autorelease];
        // Set required taps and number of touches
        [self.dtap setNumberOfTapsRequired:2];
        [self.dtap setNumberOfTouchesRequired:1];
        
        //[ self addGestureRecognizer:self.dtap];
        
        self.stap = 
            [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                                 action:@selector(oneFingerOneTap)] autorelease];
        // Set required taps and number of touches
        [self.stap setNumberOfTapsRequired:1];
        [self.stap setNumberOfTouchesRequired:1];
        
        [ self addGestureRecognizer:self.stap];
        
        // Create gesture recognizer
        /*
        self.pinch = 
            [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchGesture)] autorelease];
        [ self addGestureRecognizer:self.pinch];
        */
         
        self.userInteractionEnabled = YES;
        self.multipleTouchEnabled = YES;
        self.hidden = NO;
        
        
        
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
