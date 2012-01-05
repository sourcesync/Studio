//
//  ZoomPicView.h
//  studioapp
//
//  Created by George Williams on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "ZoomPicViewDelegate.h"

@interface ZoomPicView : UIImageView

@property (strong,nonatomic) UIScrollView *sv;
@property (strong,nonatomic) UIView *top_view;
@property (strong,nonatomic) UITapGestureRecognizer *dtap;
@property (strong,nonatomic) UITapGestureRecognizer *stap;
@property (strong,nonatomic) UIPinchGestureRecognizer *pinch;
@property (nonatomic) BOOL zooming;
@property (nonatomic) BOOL zoomed;
@property (nonatomic) CGRect lastPicRect;
@property (nonatomic) enum Section section;
@property (assign) id<ZoomPicViewDelegate> delegate;
@property (nonatomic) id *vparent;
@property (strong,nonatomic) UIImage *thumb;
@property (strong,nonatomic) NSString *full;
@property (strong,nonatomic) UIImage *fullimg;
@property (strong,nonatomic) UIImageView *zoom_view;


- (void) unzoom;

@end
