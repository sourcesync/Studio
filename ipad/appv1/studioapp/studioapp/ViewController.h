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
@property (strong,nonatomic) UIView *menu_tag;

@property (strong,nonatomic) NSMutableDictionary *fullPathDCT;

@property (strong,nonatomic) UIView *larr;
@property (strong,nonatomic) UIView *rarr;
@property (strong,nonatomic) UIView *tarr;
@property (strong,nonatomic) UIView *barr; 

@property (strong,nonatomic) MyScrollView *gsv;
@property (strong,nonatomic) UIView *gtv;
@property (strong,nonatomic) UIPageControl *pc;
@property (strong,nonatomic) NSMutableArray *ivs;
@property (strong,nonatomic) UIView *grarrow;
@property (strong,nonatomic) UIView *glarrow;

@property (strong,nonatomic) NSMutableDictionary *galleryDCT;

@property (strong,nonatomic) NSMutableDictionary *pageDCT;

@property (strong,nonatomic) UIView *fatboy;
@property (strong,nonatomic) UIImageView *flipanimation;
@property (strong,nonatomic) NSMutableArray *fatboys;
@property (strong,nonatomic) NSMutableArray *fatboyimgs;
@property (assign) int anim_index;

@property (assign) BOOL blinking;

//  PUBLIC FUNCS...


-(void) gotoSection:(enum Section)sct:(BOOL)anim;

-(void) blink: (BOOL)again;
-(void) goright: (id)sender;
-(void) goleft: (id)sender;
-(void) goup: (id)sender;
-(void) godown: (id)sender;
-(void) toggleMenu: (id)sender;
-(void) menuClicked: (id)sender;
-(void) stopMovies;
-(void) changePage: (id)sender;
-(void) nextPage;
-(void) prevPage;
-(void) gallerygoright:(id)sender;
-(void) gallerygoleft:(id)sender;
@end
