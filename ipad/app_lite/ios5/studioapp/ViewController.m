//
//  ViewController.m
//  studioapp
//
//  Created by George Williams on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//


#import <AVFoundation/AVFoundation.h>

#import "ViewController.h"
#import "MyScrollView.h"
#import "ZoomPicView.h"
#import "AVPlayerDemoPlaybackView.h"

#define MOVIE1
#define MOVIE2
#define MOVIE3

#define TITLEX 65

@implementation ViewController

//  views...
@synthesize sv=_sv;
@synthesize top_left_view=_top_left_view;
@synthesize top_middle_view=_top_middle_view;
@synthesize top_right_view=_top_right_view;
@synthesize middle_left_view=_middle_left_view;
@synthesize middle_middle_view=_middle_middle_view;
@synthesize middle_right_view=_middle_right_view;
@synthesize bottom_left_view=_bottom_left_view;
@synthesize bottom_middle_view=_bottom_middle_view;
@synthesize bottom_right_view=_bottom_right_view;
@synthesize top_view=_top_view;
@synthesize zoom_view=_zoom_view;

@synthesize illPics=_illPics;
@synthesize stbPics=_stbPics;
@synthesize desPics=_desPics;

//  movies...
@synthesize player=_player;
@synthesize av=_av;
@synthesize mv=_mv;
@synthesize player2=_player2;
@synthesize av2=_av2;
@synthesize mv2=_mv2;
@synthesize player3=_player3;
@synthesize av3=_av3;
@synthesize mv3=_mv3;


//  gestures...
//@synthesize tap=_tap;
//@synthesize tap2=_tap2;
//@synthesize swipe=_swipe;
//@synthesize swipe_pan=_swipe_pan;
//@synthesize swipe_page=_swipe_page;

//  bools...
@synthesize zoomed=_zoomed;
@synthesize zooming=_zooming;
@synthesize gotoing=_gotoing;

//  section...
@synthesize section=_section;

//  current zoomed img...
@synthesize cur_zoom=_cur_zoom;

//@synthesize htap=_htap;

//  animation state...
CGRect lastPicRect;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    //return NO;
    if (interfaceOrientation ==  UIInterfaceOrientationLandscapeLeft )
    {
        return YES;
    }
    else if (interfaceOrientation ==  UIInterfaceOrientationLandscapeRight )
    {
        return YES;
    }
    else
    {
        return NO;
    }
    //return interfaceOrientation == UIInterfaceOrientationPortrait || interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationFade];
    
    //  Set this view controller globally...
    id<UIApplicationDelegate> main = [[UIApplication sharedApplication] delegate];
    [ main SetMainVC: self ];
    
    //  Create scroll view...
    self.sv = [ [ MyScrollView alloc ] initWithFrame:CGRectMake(0,0,1024,768) ];
    self.sv.delegate = self;
    
    //self.sv.del = self; 
    
    self.sv.backgroundColor = [ UIColor whiteColor ];
    //self.sv.contentSize = CGSizeMake(1024*3, 768*3);
    self.sv.contentSize = CGSizeMake(1024*7, 768);
    
    [ self.view addSubview:self.sv ];
    self.sv.multipleTouchEnabled = YES;
    self.sv.directionalLockEnabled = YES;
    
    //
    //  Create pages
    //
    
    /*
    //  top left...
    self.top_left_view = [ [ UIView alloc ] initWithFrame:CGRectMake(0,0,1024,768) ];
    //self.top_left_view.backgroundColor = [ UIColor redColor ];
    [ self.sv addSubview:self.top_left_view ];
    
    //  top middle...
    self.top_middle_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024,0,1024,768) ];
    //self.top_middle_view.backgroundColor = [ UIColor greenColor ];
    [ self.sv addSubview:self.top_middle_view ];
    
    //  top right...
    self.top_right_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2,0,1024,768) ];
    //self.top_right_view.backgroundColor = [ UIColor blueColor ];
    [ self.sv addSubview:self.top_right_view ];
    
    //  middle left...
    self.middle_left_view = [ [ UIView alloc ] initWithFrame:CGRectMake(0,768,1024,768) ];
    //self.middle_left_view.backgroundColor = [ UIColor brownColor ];
    [ self.sv addSubview:self.middle_left_view ];
    
    //  middle middle...
    self.middle_middle_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024,768,1024,768) ];
    //self.middle_middle_view.backgroundColor = [ UIColor blackColor ];
    [ self.sv addSubview:self.middle_middle_view ];
    
    //  middle right...
    self.middle_right_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2,768,1024,768) ];
    //self.middle_right_view.backgroundColor = [ UIColor yellowColor ];
    [ self.sv addSubview:self.middle_right_view ];
    
    //  bottom left...
    self.bottom_left_view = [ [ UIView alloc ] initWithFrame:CGRectMake(0,768*2,1024,768) ];
    //self.bottom_left_view.backgroundColor = [ UIColor redColor ];
    [ self.sv addSubview:self.bottom_left_view ];
    
    //  bottom middle...
    self.bottom_middle_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024,768*2,1024,768) ];
    //self.bottom_middle_view.backgroundColor = [ UIColor greenColor ];
    [ self.sv addSubview:self.bottom_middle_view ];
    
    //  top right...
    self.bottom_right_view = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2,768*2,1024,768) ];
    //self.bottom_right_view.backgroundColor = [ UIColor blueColor ];
    [ self.sv addSubview:self.bottom_right_view ];
    */
    
    //  top view...
    self.top_view = [ [ UIView alloc ] initWithFrame:CGRectMake(0,0,1024*7,768) ];
    //self.top_view.backgroundColor = [ UIColor colorWithRed:128 green:128 blue:128 alpha:0.5 ];
    [ self.sv addSubview:self.top_view ];
    
    self.zoom_view = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0,0,1,1) ];
    self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
    UITapGestureRecognizer *ztap = [ [ UITapGestureRecognizer alloc ] initWithTarget:self action:@selector(zoom_tapped) ];
    [ztap setNumberOfTapsRequired:1];
    [ztap setNumberOfTouchesRequired:1];
    self.zoom_view.userInteractionEnabled = YES;
    [self.zoom_view addGestureRecognizer:ztap];
    [ self.sv addSubview:self.zoom_view ];
    [ self.sv bringSubviewToFront:self.zoom_view ];
    
    //  Initialize content offset of scrollview...
    self.sv.contentOffset = CGPointMake(0,0);
    
    //  Initialize scroll view parms...
    self.sv.pagingEnabled = YES;
    self.sv.scrollEnabled = YES;
    self.sv.showsVerticalScrollIndicator = YES;
    self.sv.showsHorizontalScrollIndicator = YES;
      
    //  Init images...
    //self.img = [ UIImage imageNamed:@"Box.png" ];
    

    //self.htap = 
    //[[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    //[self.htap setNumberOfTapsRequired:1];
    //[self.htap setNumberOfTouchesRequired:1];
    
    //
    //  Initialze sections...
    //
    
    //[ self initAboutUs ];
    //[ self initCharacterDevelopment ];
    
    [ self initHome ];
    
    [ self initDesign ];
    [ self initIllustration ];
    [ self initStoryboard ];
    
    
    [ self initFilm ];
    [ self initPreproduction ];
    [ self initAnimation ];
    
}

-(void) zoom_tapped
{
    if ( self.cur_zoom != nil )
    {
        ZoomPicView *pic = (ZoomPicView *)self.cur_zoom;
        
        [ pic unzoom ];
    }
}

-(void) gohome
{
    [ self stopMovies ];
    [ self gotosection:Home:YES ];
}

-(ZoomPicView *) initPic:(NSString *)thumb:(NSString *)full:(CGPoint)xy:(CGSize)sz:
    (enum Section)sct
{
    CGRect rect = CGRectMake(xy.x, xy.y, sz.width, sz.height );
                             //self.img.size.width, self.img.size.height);
    ZoomPicView *pic = [ [ ZoomPicView alloc] initWithFrame:rect ];
    if ( thumb != nil )
    {
        UIImage *img = [ UIImage imageNamed:thumb ];
        
        [ pic setImage:img];
        pic.thumb = img;
        
    }
    if ( full != nil )
    {
        //UIImage *img = [ UIImage imageNamed:full ];
        //pic.full = img;
        pic.full = full;
    }
    pic.sv = self.sv;
    pic.top_view = self.top_view;
    pic.section = sct;
    pic.vparent = (id *)self;
    pic.delegate = self;
    pic.contentMode = UIViewContentModeScaleAspectFit;
    pic.zoom_view = self.zoom_view;
    
    [ self.top_view addSubview:pic ];
    
    //[ self.zoomPics addObject:pic ];
    return pic;
}


-(void) initAboutUs
{
    // row 1...
    [ self initPic:@"aboutUs01.jpg":nil:CGPointMake(442.22, -0.31):CGSizeMake(134.63,152.11):AboutUs ];
    //  row 2...
    [ self initPic:nil:nil:CGPointMake(700, 190):CGSizeMake(160.0,160):AboutUs ];
    //  row 3...
    [ self initPic:@"aboutUs08.jpg":nil:CGPointMake(500, 380):CGSizeMake(160.0,160):AboutUs ];
    [ self initPic:@"aboutUs19.jpg":nil:CGPointMake(700, 380):CGSizeMake(160.0,160):AboutUs ];
    [ self initPic:@"aboutUs04.jpg":nil:CGPointMake(900, 380):CGSizeMake(160.0,160):AboutUs ];
    //  row 4...
    [ self initPic:nil:nil:CGPointMake(0, 570):CGSizeMake(160.0,160):AboutUs ];
    [ self initPic:@"aboutUs02.jpg":nil:CGPointMake(300, 570):CGSizeMake(160.0,160):AboutUs ];
    [ self initPic:@"aboutUs24.jpg":nil:CGPointMake(700, 570):CGSizeMake(160.0,160):AboutUs ];
    [ self initPic:@"aboutUs15.jpg":nil:CGPointMake(900, 570):CGSizeMake(160.0,160):AboutUs ];
    //  text...
    //[ self initPic:@"Tile1Aboutus.png":nil:CGPointMake(105.16,74.6 ):CGSizeMake(160.0,160):AboutUs ];
    //[ self initPic:@"Tile1Text.png":nil:CGPointMake(105.8,116.6 ):CGSizeMake(160.0,160):AboutUs ];
}


-(void) initIllustration
{
    /*
    [ self initPic:@"illustration14cr.jpg":@"illustration14.jpg":CGPointMake(1024+900, 0):CGSizeMake(160.0,160):Illustration ];
    [ self initPic:@"illustration06.jpg":nil:CGPointMake(1024+300, 190):CGSizeMake(160.0,160):Illustration ];
    [ self initPic:@"illustration04.jpg":nil:CGPointMake(1024+500, 190):CGSizeMake(160.0,160):Illustration ];
    [ self initPic:@"illustration03.jpg":nil:CGPointMake(1024+700, 380):CGSizeMake(160.0,160):Illustration ];
    [ self initPic:@"illustration15.jpg":nil:CGPointMake(1024+100, 570):CGSizeMake(160.0,160):Illustration ];
     */
    
    float xoff = 1024*2;
    
    self.illPics = [ [ NSMutableArray alloc ] initWithCapacity:10 ];
    ZoomPicView *pic = nil;
    
    pic = [ self initPic:@"illustration01Thumb.jpg":@"illustration01v2.jpg":CGPointMake(xoff+40, 80):CGSizeMake(200.0,200):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration05Thumb.jpg":@"illustration05.jpg":CGPointMake(xoff+555, 20):CGSizeMake(240.0,240):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration14Thumb.jpg":@"illustration14.jpg":CGPointMake(xoff+870, 50):CGSizeMake(160.0,160):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration04Thumb.jpg":@"illustration04.jpg":CGPointMake(xoff+650, 240):CGSizeMake(160.0,160):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration03Thumb.jpg":@"illustration03.jpg":CGPointMake(xoff+680, 420):CGSizeMake(300,180):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration06Thumb.jpg":@"illustration06.jpg":CGPointMake(xoff+330, 160):CGSizeMake(190.0,190):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration08Thumb.jpg":@"illustration08.jpg":CGPointMake(xoff+740, 610):CGSizeMake(160.0,160):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration24Thumb.jpg":@"illustration24.jpg":CGPointMake(xoff+40, 350):CGSizeMake(160.0,160):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration02Thumb.jpg":@"illustration02.jpg":CGPointMake(xoff+350, 415):CGSizeMake(310.0,310.0):Illustration ];
    [ self.illPics addObject:pic ];
    pic = [ self initPic:@"illustration15Thumb.jpg":@"illustration15.jpg":CGPointMake(xoff+100, 570):CGSizeMake(160.0,160):Illustration ];
    [ self.illPics addObject:pic ];
    
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff + 10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
    [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile2Illustration.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text autorelease ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
    
    
}

-(void) initFilm
{
    float xoff = 1024*5.0;
    
    //[ self initPic:nil:nil:CGPointMake(xoff+500, 0):CGSizeMake(160.0,160):Film ];
    
#ifdef MOVIE1
    self.mv = [ [ MyMovieView alloc ] 
               initWithFrame:
               CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
    
    self.mv.section = Film;
    self.mv.delegate = self;
    self.mv.vparent = (id *)self;
    [ self.top_view addSubview:self.mv ];
#endif
    
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff+10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
        [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile3Film.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text autorelease ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
}

-(void) initDesign
{
    float xoff = 1024.0*6;
    
#if 1
    ZoomPicView *pic = nil;
    self.desPics = [ [ NSMutableArray alloc ] initWithCapacity:10 ];
    
    pic = [ self initPic:@"design10Thumb.jpg":@"design10.jpg":CGPointMake(xoff+745,265):
        CGSizeMake(240.0,240.0):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design16Thumb.jpg":@"design16.jpg":CGPointMake(xoff+45,30):
           CGSizeMake(320.0,320.0):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design12Thumb.jpg":@"design12.jpg":CGPointMake(xoff+430,40):
     CGSizeMake(240.0,240.0):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design01Thumb.jpg":@"design01.jpg":CGPointMake(xoff+20,455):
     CGSizeMake(320.0, 320.0):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design07v2Thumb.png":@"design07v2.png":CGPointMake(xoff+800,+50):
        CGSizeMake(160.0,160):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design15Thumb.jpg":@"design15.jpg":CGPointMake(xoff +824,568):
        CGSizeMake(160.0,160):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design08v2Thumb.jpg":@"design08v2.jpg":CGPointMake(xoff+250,320):
           CGSizeMake(160.0,160):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design18Thumb.jpg":@"design18.jpg":CGPointMake(xoff +20,350):
           CGSizeMake(160.0,160):Design ]; 
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design04Thumb.jpg":@"design04.jpg":CGPointMake(xoff+480,290):
        CGSizeMake(160.0,160):Design ];
    [ self.desPics addObject:pic ];
    pic = [ self initPic:@"design13v2Thumb.jpg":@"design13v2.jpg":CGPointMake(xoff+460,430):
        CGSizeMake(320.0,320.0):Design ];
    [ self.desPics addObject:pic ];
#endif
    
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff + 10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
    [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile4Design.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text autorelease ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
}

-(void) goup: (id)sender
{
    [ self gotosection:Illustration:YES];
}

-(void) goleft: (id)sender
{
    [ self gotosection:Design:YES];
}

-(void) goright: (id)sender
{
    //[ self gotosection:Preproduction ];
    [ self gotosection:Animation:YES ];
}

-(void) godown: (id)sender
{
    [ self gotosection:Animation:YES ];
}

-(void) initHome
{
    
    
    UIImage *img = [ UIImage imageNamed:@"THESTUDIO_with_logo_RED copy.png" ];
    float w = 350; //img.size.width;
    float h = 350; //img.size.height;
    CGRect rect = CGRectMake( 1024/2.0 - w/2.0, 768/2.0 - h/2.0, w,h );
    UIImageView *studio = [ [ UIImageView alloc] initWithFrame:rect ];
    studio.contentMode = UIViewContentModeScaleAspectFit;
    //UIImage *img = [ UIImage imageNamed:@"Tile5Thestudio.png" ];
    
    [ studio setImage:img ];
    [ self.top_view addSubview:studio ];
    
    //float xoff = 0;
    //float yoff = 0;
    UIButton *btn = nil;
    /*
    UIButton *btn = [ UIButton buttonWithType:UIButtonTypeRoundedRect ];
    [ btn setTitle:@"UP" forState:UIControlStateNormal ];
    btn.frame = CGRectMake(xoff + 500, yoff, 100, 40);
    [ btn addTarget:self action:@selector(goup:) forControlEvents:UIControlEventTouchDown];
    [ self.top_view addSubview:btn ];
    
    btn = [ UIButton buttonWithType:UIButtonTypeRoundedRect ];
    [ btn setTitle:@"DOWN" forState:UIControlStateNormal ];
    btn.frame = CGRectMake(xoff + 500, yoff+768-40, 100, 40);
    [ btn addTarget:self action:@selector(godown:) forControlEvents:UIControlEventTouchDown];
    [ self.top_view addSubview:btn ];
    
    btn = [ UIButton buttonWithType:UIButtonTypeRoundedRect ];
    [ btn setTitle:@"LEFT" forState:UIControlStateNormal ];
    btn.frame = CGRectMake(xoff, yoff/2.0-20, 100, 40);
    [ btn addTarget:self action:@selector(goleft:) forControlEvents:UIControlEventTouchDown];
    [ self.top_view addSubview:btn ];
     */
    
    btn = [ UIButton buttonWithType:UIButtonTypeCustom];
    [ btn setTitle:@"RIGHT" forState:UIControlStateNormal ];
    btn.frame = CGRectMake(1024-100, 768/2.0-20, 100, 40);
    UIImage *arrow = [ UIImage imageNamed:@"Tile5Rightarrow.png" ];
    [btn setImage:arrow forState:UIControlStateNormal ];
    [ btn addTarget:self action:@selector(goright:) forControlEvents:UIControlEventTouchDown];
    [ self.top_view addSubview:btn ];

                     
}

-(void) initPreproduction
{
    float xoff = 1024*3.0;
    
#ifdef MOVIE2
    //self.mv2 = [ [ MyMovieView alloc ] 
    //           initWithFrame:
    //            CGRectMake(1024*2+100, 768+100, 800, 550):@"Preproduction_Reel":7];
    self.mv2 = [ [ MyMovieView alloc ] 
                initWithFrame:
                CGRectMake(xoff, 0, 1024, 768):@"Preproduction_Reel":7];
    self.mv2.section = Preproduction; 
    self.mv2.delegate = self;
    self.mv2.vparent = (id *)self;
    [ self.top_view addSubview:self.mv2 ];
    [ self.top_view bringSubviewToFront:self.mv2 ];
#endif
    
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff + 10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
    [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile6Preproduction.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
    [ self.top_view bringSubviewToFront:text ];
}



-(void) initCharacterDevelopment
{
    [ self initPic:@"charDev15.jpg" :nil:CGPointMake(300, 768*2-20 ):CGSizeMake(160.0,160):CharacterDevelopment ];
    [ self initPic:@"charDev12.jpg" :nil:CGPointMake(550, 768*2+570 ):CGSizeMake(160.0,160):CharacterDevelopment ];
}

-(void) initAnimation
{
    //self.mv3 = [ [ MyMovieView alloc ] 
    //            initWithFrame:
    //            CGRectMake(1024-20, 768*2+200, 1050, 450):@"Animation_Reel":0];
    
    float xoff = 1024.0; 
    
#ifdef MOVIE3
    //  MOVIE...
    self.mv3 = [ [ MyMovieView alloc ] 
                initWithFrame:
                CGRectMake(xoff, 0, 1024, 768):@"Animation_Reel":6];
    self.mv3.section = Animation;
    self.mv3.delegate = self;
    self.mv3.vparent = (id *)self;
    [ self.top_view addSubview:self.mv3 ];
#endif
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff + 10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
    [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile8Animation.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
    [ self.top_view bringSubviewToFront:text ];
    
}

-(void) initStoryboard
{
    float xoff = 1024*4;
    /*
    [ self initPic:@"SB_Concepts08jpg" :nil:CGPointMake(1024*2+400, 768*2-20 ):CGSizeMake(160.0,160):Storyboarding ];
    [ self initPic:@"SB_Concepts29.jpg" :nil:CGPointMake(1024*2+400, 768*2+200 ):CGSizeMake(160.0,160):Storyboarding ];
    [ self initPic:@"SB_Concepts21.jpg" :nil:CGPointMake(1024*2+100, 768*2+400 ):CGSizeMake(160.0,160):Storyboarding ];
    [ self initPic:@"SB_Concepts04.jpg" :nil:CGPointMake(1024*2+100, 768*2+600 ):CGSizeMake(160.0,160):Storyboarding ];
     */
    ZoomPicView *pic = nil;
    self.stbPics = [ [ NSMutableArray alloc ] initWithCapacity: 10 ];
    
    pic = [ self initPic:@"SB_Concepts34Thumb.jpg" :@"SB_Concepts34.jpg":CGPointMake(xoff+30, 100 ):CGSizeMake(320.0,320):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts08Thumb.jpg" :@"SB_Concepts08.jpg":CGPointMake(xoff+650, 500 ):CGSizeMake(320.0,320):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts02Thumb.jpg" :@"SB_Concepts02.jpg":CGPointMake(xoff+670, 380 ):CGSizeMake(160.0,160):Storyboarding ]; 
    [ self.stbPics addObject:pic ];   
    pic = [ self initPic:@"SB_Concepts01Thumb.jpg" :@"SB_Concepts01.jpg":CGPointMake(xoff+300, 310 ):CGSizeMake(320.0,320):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts29Thumb.jpg" :@"SB_Concepts29.jpg":CGPointMake(xoff+445, 0+100 ):CGSizeMake(240.0,240):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts44Thumb.jpg" :@"SB_Concepts44.jpg":CGPointMake(xoff+760, -20 ):CGSizeMake(240.0,240):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts11Thumb.jpg" :@"SB_Concepts11.jpg":CGPointMake(xoff+800, 185 ):CGSizeMake(200.0,200):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts37Thumb.jpg" :@"SB_Concepts37.jpg":CGPointMake(xoff+320, 600 ):CGSizeMake(160.0,160):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts04Thumb.jpg" :@"SB_Concepts04.jpg":CGPointMake(xoff+20, 0+550 ):CGSizeMake(240.0,240):Storyboarding ];
    [ self.stbPics addObject:pic ];
    pic = [ self initPic:@"SB_Concepts21Thumb.jpg" :@"SB_Concepts21.jpg":CGPointMake(xoff+70, 0+350 ):CGSizeMake(200.0,200):Storyboarding ];
    [ self.stbPics addObject:pic ];
    
    
#if 1
    //  HOME...
    UIImage *himg = [ UIImage imageNamed:@"Icon.png" ];
    CGRect hrect = CGRectMake( xoff + 10, 13, himg.size.width*0.66, himg.size.height*0.66);
    UIImageView *hv = [ [ UIImageView alloc] initWithFrame:hrect ];
    hv.userInteractionEnabled = YES;
    [ hv setImage:himg ];
    [ self.top_view addSubview:hv ]; 
    [ self.top_view bringSubviewToFront:hv ];
    UITapGestureRecognizer *htap = 
    [[[UITapGestureRecognizer alloc] initWithTarget:self 
                                             action:@selector(gohome)] autorelease];
    // Set required taps and number of touches
    [htap setNumberOfTapsRequired:1];
    [htap setNumberOfTouchesRequired:1];
    [ hv addGestureRecognizer:htap ];
#endif
    
    //  TEXT...
    UIImage *img = [ UIImage imageNamed:@"Tile9Storyboards.png" ];
    CGRect rect = CGRectMake( xoff + TITLEX, 10, img.size.width, img.size.height );
    UIImageView *text = [ [ UIImageView alloc] initWithFrame:rect ];
    [ text setImage:img ];
    [ self.top_view addSubview:text ];
    [ self.top_view bringSubviewToFront:text ];
    //[ self.stbPics addObject:pic ];
}

#pragma mark - controls...

-(void) stopMovies
{
#ifdef MOVIE1
    [ self.mv stop ];
#endif
    
#ifdef MOVIE2
    [ self.mv2 stop ];
#endif
    
#ifdef MOVIE3
    [ self.mv3 stop ];
#endif     
}

#pragma mark - gotos...
 
-(void) gotosection:(enum Section)sct:(BOOL)anim
{
    if ( self.gotoing )
    {
        return;
    }
    else
    {
        CGPoint pt;
        switch (sct)
        {
            case AboutUs: 
                pt = CGPointMake(0, 0);
                break;
            case Illustration:
                //pt = CGPointMake(1024, 0);
                pt = CGPointMake(1024*2, 0);
                break;
            case Film:
                pt = CGPointMake(1024*5, 0);
                break;
            case Design:
                //pt = CGPointMake(0, 768);
                pt = CGPointMake(1024*6, 0);
                break;
            case Home:
                pt = CGPointMake(0, 0);
                //pt = CGPointMake(1024, 768);
                break;
            case Preproduction:
                //pt = CGPointMake(1024*2, 768);
                pt = CGPointMake(1024*3, 0);
                break;
            case CharacterDevelopment:
                pt = CGPointMake(0, 0);
                //pt = CGPointMake(0, 768*2);
                break;
            case Animation:
                //pt = CGPointMake(1024, 768*2);
                pt = CGPointMake(1024, 0);
                break;
            case Storyboarding:
                //pt = CGPointMake(2014*2, 768*2);
                pt = CGPointMake(1024*4, 0);
                break;
        }
        
        if (anim)
        {
            self.gotoing = YES;
            self.sv.scrollEnabled = NO;
            [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.sv.contentOffset = pt;
                         }
                         completion:^(BOOL finished){
                             self.sv.contentOffset = pt;
                             self.gotoing = NO;
                             self.sv.scrollEnabled = YES;
                             self.section = sct;
                         }
             ];
        }
        else
        {
            self.sv.contentOffset = pt;
        }
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.sv.contentOffset = CGPointMake(0, 0);
    //self.sv.contentOffset = CGPointMake(1024*6, 0);
    //self.sv.contentOffset = CGPointMake(1024, 768);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
        
    //self.sv.contentOffset = CGPointMake(1024, 768);
    //self.sv.contentOffset = CGPointMake(0, 0);

}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

#pragma mark - zoompicview delegate...


-(void) section_goto:(enum Section)sct
{
    [ self gotosection:sct: YES];
}


#pragma mark - myscrollview delegate...

-(void) TouchBegan:(int)num
{
#if 0
    if (num==1)
    {
        self.dbg1.hidden = NO;
        self.dbg2.hidden = YES;
        self.sv.pagingEnabled = NO;
        
        [UIView animateWithDuration:0.2
                                  delay: 0.0
                                options: UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.top_view.backgroundColor = [ UIColor whiteColor ];
                             }
                             completion:^(BOOL finished){
                                 self.top_view.backgroundColor = [ UIColor colorWithRed:128 green:128 blue:128 alpha:0.5 ];
                             }
             ];
        
    }
    else if (num>1)
    {
        self.dbg1.hidden = NO;
        self.dbg2.hidden = NO;
        self.sv.pagingEnabled = YES;
    }
#endif
}

#pragma mark - scroll view delegate

- (CGPoint) getCenter: (enum Section)sct
{
    float hx = 1024/2.0f;
    float hy = 768/2.0f;
    switch (sct)
    {
        case AboutUs:
            return CGPointMake( 0+hx, 768*2+hy );
        case Illustration:
            //return CGPointMake( 1024+hx, 0+hy );
            return CGPointMake( 1024*2+hx, 0+hy );
        case Film:
            //return CGPointMake( 1024*2+hx, 0+hy );
            return CGPointMake( 1024*5+hx, 0+hy );
        case Design:
            //return CGPointMake( 0+hx, 768+hy );
            return CGPointMake( 1024*6+hx, 0+hy );
        case Home:
            //return CGPointMake( 1024+hx, 768+hy );
            return CGPointMake( 0+hx, 0+hy );
        case Preproduction:
            //return CGPointMake( 1024*2+hx, 768+hy );   
            return CGPointMake( 1024*3+hx, 0+hy );   
        case CharacterDevelopment:
            return CGPointMake( 0+hx, 768*2+hy );
        case Animation:
            return CGPointMake( 1024+hx, 0+hy );
        case Storyboarding:
            //return CGPointMake( 1024*2+hx, 768*2+hy ); 
            return CGPointMake( 1024*4+hx, 0+hy ); 
    }
}

- (void) setArrayHidden: (NSMutableArray *)array: (BOOL)hidden
{
    for ( int i=0;i< [array count];i++)
    {
        UIImageView *v = [ array objectAtIndex:i];
        v.hidden = hidden;
    }
}

- (void) togglePage: (enum Section)sct:(BOOL)on
{
    switch (sct)
    {
        case Home:
            break;
        case Animation:
            if (on) self.mv3.hidden = NO;
            else self.mv3.hidden = YES;
            break;
        case Preproduction:
            if (on) self.mv2.hidden = NO;
            else self.mv2.hidden = YES;
            break;
        case Film:
            if (on) self.mv.hidden = NO;
            else self.mv.hidden = YES;
            break;
        case Illustration:
            [ self setArrayHidden:self.illPics :!on ];
            break;
        case Storyboarding:
            [ self setArrayHidden:self.stbPics :!on ];
            break;
        case Design:
            [ self setArrayHidden:self.desPics :!on ];
            break;
        default:
            break;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //  Stop any movies...
    [ self stopMovies ];
    
#if 0
    enum Section lastSection = self.section;

    //  Figure out the section we are in...
    for ( int i=AboutUs;i<=Storyboarding;i++)
    {
        CGRect rect = CGRectMake(self.sv.contentOffset.x, self.sv.contentOffset.y, self.sv.frame.size.width, self.sv.frame.size.height);
        CGPoint pt = [self getCenter:i];
        if ( CGRectContainsPoint(rect,pt ) )
        {
            self.section = i;
            break;
        }
    }
    
    [ self togglePage:lastSection :NO ];
    [ self togglePage:self.section :YES ];
#endif
}


#pragma mark - movie player

@end
