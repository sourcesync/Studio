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


enum Direction
{
    Direction_Top = 0,
    Direction_Right,
    Direction_Bottom,
    Direction_Left
};

@interface ViewController : UIViewController
    <MyScrollViewDelegate, UIScrollViewDelegate, MyMovieViewDelegate>

@property (strong,nonatomic) MyScrollView *sv;
@property (strong,nonatomic) UIView *top_view;

@property (strong,nonatomic) UIImageView *zoom_view;
@property (strong,nonatomic) UIView *cur_zoom;
@property (strong,nonatomic) UIImage *zoom_img;
@property (assign) BOOL zooming;

@property (strong,nonatomic) MyMovieView *fmv;
@property (strong,nonatomic) MyMovieView *fmv2;
@property (strong,nonatomic) MyMovieView *fmv3;

@property (assign) enum Section section;

@property (assign) BOOL gotoing;

@property (strong,nonatomic) NSMutableDictionary *objSection;

@property (assign) BOOL menu_state;

@property (assign) BOOL menu_animating;

@property (strong,nonatomic) UIView *menu;

@property (strong,nonatomic) NSMutableDictionary *fullPathDCT;

@property (strong,nonatomic) UIButton *larr;
@property (strong,nonatomic) UIButton *rarr;
@property (strong,nonatomic) UIButton *tarr;
@property (strong,nonatomic) UIButton *barr;

//  PUBLIC FUNCS...


-(void) goright: (id)sender;
-(void) goleft: (id)sender;
-(void) goup: (id)sender;
-(void) godown: (id)sender;
-(void) toggleMenu: (id)sender;
-(void) menuClicked: (id)sender;
-(void) stopMovies;
@end
