//
//  ViewController.h
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyScrollView.h"
#import <mach/mach.h>

#define DO_MOVIES
#define DO_ZOOM
#define DO_GALLERY
#define MAX_GALLERY -1
#define LOAD_NEIGHBORS YES
//#define DO_DEBUG
//#define DO_FATBOY

#ifdef DO_MOVIES
#import "MyMovieView.h"
#endif

#import "Section.h"

enum Direction
{
    Direction_Top = 0,
    Direction_Right,
    Direction_Bottom,
    Direction_Left
};

@interface ViewController : UIViewController
    <UIScrollViewDelegate
#ifdef DO_MOVIES
    , MyMovieViewDelegate>
#else
    >
#endif

//  board...
@property (strong,nonatomic) MyScrollView *sv;
@property (strong,nonatomic) UIView *top_view;
@property (assign) enum Section section;
@property (assign) BOOL gotoing;
@property (strong,nonatomic) NSMutableDictionary *fullPathDCT;

//  home arrows...
@property (strong,nonatomic) UIButton *larr;
@property (strong,nonatomic) UIButton *rarr;
@property (strong,nonatomic) UIButton *tarr;
@property (strong,nonatomic) UIButton *barr; 
@property (assign) BOOL blinking;

//  menu...
@property (assign) BOOL menu_state;
@property (assign) BOOL menu_animating;
@property (strong,nonatomic) UIView *menu;
@property (strong,nonatomic) UIButton *menu_tag;

#ifdef DO_ZOOM
//  zoom...
@property (strong,nonatomic) UIImageView *zoom_view;
@property (strong,nonatomic) UIView *cur_zoom;
@property (strong,nonatomic) UIImage *zoom_img;
@property (assign) BOOL zooming;
#endif

#ifdef DO_FATBOY
//  fatboy anim...
@property (strong,nonatomic) UIView *fatboy;
@property (strong,nonatomic) UIImageView *flipanimation;
@property (strong,nonatomic) NSMutableArray *fatboys;
@property (strong,nonatomic) NSMutableArray *fatboyimgs;
@property (assign) int anim_index;
#endif

#ifdef DO_GALLERY
//  gallery...
@property (assign) BOOL arrow_scrolling;
@property (strong,nonatomic) UIImage *galleryImage;
@property (strong,nonatomic) NSMutableArray *cur_gallery;
@property (strong,nonatomic) MyScrollView *gsv;
@property (strong,nonatomic) UIView *gtv;
@property (strong,nonatomic) UIPageControl *pc;
@property (strong,nonatomic) NSMutableArray *ivs;
@property (strong,nonatomic) UIButton *grarrow;
@property (strong,nonatomic) UIButton *glarrow;
@property (strong,nonatomic) UITapGestureRecognizer *gtap;
@property (assign) CGRect lastrct;
@property (assign) int new_page;
@property (strong,nonatomic) NSMutableDictionary *galleryDCT;
#endif

#ifdef DO_MOVIES
//  movies
@property (strong,nonatomic) MyMovieView *fmv;
@property (strong,nonatomic) MyMovieView *fmv2;
@property (strong,nonatomic) MyMovieView *fmv3;
#endif

//  PUBLIC FUNCS...

//  board...
-(void) gotoSection:(enum Section)sct:(BOOL)anim;
-(void) hideBoard;
-(void) showBoard;
- (CGPoint) getCenter: (enum Section)sct;

//  home arrows...
-(void) goright: (id)sender;
-(void) goleft: (id)sender;
-(void) goup: (id)sender;
-(void) godown: (id)sender;
-(void) blink: (BOOL)again;

//  menu...
-(void) toggleMenu: (id)sender;
-(void) menuClicked: (id)sender;

#ifdef DO_MOVIES
//  movies...
-(void) stopMovies;
#endif

#ifdef DO_GALLERY
//  gallery...
-(void)loadPage;
-(void) nextPage;
-(void) prevPage;
-(void) gallerygoright:(id)sender;
-(void) gallerygoleft:(id)sender;
-(void) freeGallery;
-(void) galleryTap:(id)sender;
-(void) doGallery: (UIView *)v;
-(void) showGallery;
-(void) changePage: (id)sender;
#endif

#ifdef DO_ZOOM
//  zoom...
-(void) hideZoom;
#endif

#ifdef DO_FATBOY
//  fatboy...
-(void) hideFatBoy;
#endif

@end
