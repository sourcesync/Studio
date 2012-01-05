//
//  ViewController.h
//  studioapp
//
//  Created by George Williams on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyScrollView.h"
#import "AVPlayerDemoPlaybackView.h"
#import "MyMovieView.h"
#import "ZoomPicViewDelegate.h"
#import "ZoomPicView.h"
#import "MyMoviePlayer.h"

 
@interface ViewController : UIViewController
    <MyScrollViewDelegate, ZoomPicViewDelegate, UIScrollViewDelegate>
  //  < UIScrollViewDelegate >

@property (strong,nonatomic) MyScrollView *sv;

//  PAGE VIEWS...
@property (strong,nonatomic) UIView *top_left_view;
@property (strong,nonatomic) UIView *top_middle_view;
@property (strong,nonatomic) UIView *top_right_view;
@property (strong,nonatomic) UIView *middle_left_view;
@property (strong,nonatomic) UIView *middle_middle_view;
@property (strong,nonatomic) UIView *middle_right_view;
@property (strong,nonatomic) UIView *bottom_left_view;
@property (strong,nonatomic) UIView *bottom_middle_view;
@property (strong,nonatomic) UIView *bottom_right_view;
@property (strong,nonatomic) UIImageView *zoom_view;

//  TOP VIEW...
@property (strong,nonatomic) UIView *top_view;

//  IMAGES...
//@property (strong,nonatomic) UIImage *img;

//  MOVIES...
@property (strong,nonatomic) AVPlayerDemoPlaybackView *player;
@property (strong,nonatomic) AVPlayer *av;
@property (strong,nonatomic) MyMovieView *mv;

@property (strong,nonatomic) AVPlayerDemoPlaybackView *player2;
@property (strong,nonatomic) AVPlayer *av2;
@property (strong,nonatomic) MyMovieView *mv2;


@property (strong,nonatomic) AVPlayerDemoPlaybackView *player3;
@property (strong,nonatomic) AVPlayer *av3;
@property (strong,nonatomic) MyMovieView *mv3;

//  COLLECTIONS...
@property (strong, nonatomic) NSMutableArray *illPics;
@property (strong, nonatomic) NSMutableArray *stbPics;
@property (strong, nonatomic) NSMutableArray *desPics;

//  TAP GESTURES...
//@property (strong,nonatomic) UITapGestureRecognizer *tap;
//@property (strong,nonatomic) UIPinchGestureRecognizer *tap2;
//@property (strong,nonatomic) UISwipeGestureRecognizer *swipe;
//@property (strong,nonatomic) UISwipeGestureRecognizer *swipe_pan;
//@property (strong,nonatomic) UISwipeGestureRecognizer *swipe_page;

@property (assign) id *cur_zoom;

//  ANIMATION GLOBALS...
@property ( assign ) BOOL zoomed;
@property ( assign ) BOOL zooming;
@property ( assign ) BOOL gotoing;

//  SECTION...
@property (assign ) enum Section section;

//  DEBUG...
//@property (strong,nonatomic) UIImageView *dbg1;
//@property (strong,nonatomic) UIImageView *dbg2;
//@property (strong, nonatomic) UITapGestureRecognizer *htap;


//  PUBLIC FUNCS...
-(void) initAboutUs;
-(void) initIllustration;
-(void) initFilm;

-(void) initDesign;
-(void) initHome;
-(void) initPreproduction;

-(void) initCharacterDevelopment;
-(void) initAnimation;
-(void) initStoryboard;

-(void) gotosection:(enum Section)sct:(BOOL)anim;
-(void) stopMovies;
-(void) gohome;
-(void) zoom_tapped;


@end 
