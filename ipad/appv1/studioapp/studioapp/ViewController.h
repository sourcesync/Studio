//
//  ViewController.h
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyScrollView.h"

#import "MyMovieView.h"

@interface ViewController : UIViewController
    <MyScrollViewDelegate, UIScrollViewDelegate>

@property (strong,nonatomic) MyScrollView *sv;
@property (strong,nonatomic) UIView *top_view;

@property (strong,nonatomic) UIImageView *zoom_view;
@property (strong,nonatomic) UIView *cur_zoom;
@property (strong,nonatomic) UIImage *zoom_img;
@property (assign) BOOL zooming;


@property (strong,nonatomic) MyMovieView *fmv;

typedef enum 
{
    Top = 0,
    Right,
    Bottom,
    Left
}   Direction;

@end
