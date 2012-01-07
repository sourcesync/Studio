//
//  ViewController.m
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize top_view=_top_view;
@synthesize sv=_sv;

@synthesize zoom_view=_zoom_view;
@synthesize cur_zoom=_cur_zoom;
@synthesize zooming=_zooming;
@synthesize zoom_img=_zoom_img;

@synthesize fmv=_fmv;

#define SPACING 10.0

CGRect lastZoomPicRect;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - zoom...


- (void) unzoom
{
    if (self.zooming)
    {
        return;
    }
    else
    {
        self.zooming = YES;
        
        [UIView animateWithDuration:0.3
                                  delay: 0.0
                                options: UIViewAnimationOptionCurveEaseIn
                             animations:^{
                                 self.zoom_view.frame = lastZoomPicRect;
                                 self.top_view.alpha = 1.0;
                             }
                             completion:^(BOOL finished){
                                 self.zoom_view.frame = lastZoomPicRect;
                                 self.zooming = NO;
                                 self.sv.scrollEnabled = YES;
                                 self.top_view.alpha = 1.0;
                                 self.cur_zoom = nil;
                                 self.zoom_view.hidden = YES;
                             }
             ];
        
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
        [ self.zoom_view setImage:self.zoom_img ];
        self.zoom_view.hidden = NO;
        self.zoom_view.frame = self.cur_zoom.frame;
        self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
        lastZoomPicRect = self.cur_zoom.frame;
           
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
                                 //self.zoomed = YES;
                                 self.zooming = NO;
                                 self.sv.scrollEnabled = NO;
                                 self.top_view.alpha = 0.2;
                                 
                             }
             ];
    }
}


#pragma mark - gestures...

-(void) oneFingerOneTap: (UIGestureRecognizer *)g
{
    UIView *v = g.view;
    self.cur_zoom = v;
    UIImageView *iv = (UIImageView *)[v.subviews objectAtIndex:0 ];
    self.zoom_img = iv.image;
    [ self zoom ];
}


-(void) zoom_view_tapped
{
    if ( self.cur_zoom != nil )
    {
        [ self unzoom ];
    }
}


#pragma mark - elements..

-(UIView *) singlePic: (int)sr: (int)sc: (int)row: (int)col: (NSString *)img: (CGAffineTransform)tr: (BOOL)clip
{
    float aw = (1024.0-5*SPACING)/6.0;
    float ah = (768-3*SPACING)/4.0;
    
    float w = (1024.0)/6.0;
    float h = (768)/4.0;
    float coordx = w*col;
    float coordy = h*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    
    //  adjust coords for spacing...
    if (col>0) x = x+ SPACING/2.0;
    if (row>0) y = y+ SPACING/2.0;
    
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        [ v addSubview:iv ];
        
        //iv.transform = tr;
        iv.transform = tr;
        
        v.clipsToBounds = clip;
        if (!v.clipsToBounds)
        {
            UIView *t = [ [ UIView alloc ] initWithFrame:
                         CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
            [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
            [ v addSubview:t];  
            
        }
    }
    
    //  gesture...
    UITapGestureRecognizer *stap = 
    [[UITapGestureRecognizer alloc] 
                        initWithTarget:self action:@selector(oneFingerOneTap:)];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ v addGestureRecognizer:stap ];
    
    return v;
}


-(UIView *) twoByOnePic: (int)sr: (int)sc: (int)row: (int)col
{
    float aw = (1024.0/6.0)*2;
    float ah = 768/4.0;
    if (col==0) aw = aw - SPACING/2.0;
    else aw = aw - 2*(SPACING/2.0);
    if ((row==0)||(row==3)) ah = ah - (SPACING/2.0);
    else ah = ah - 2*(SPACING/2.0);
    
    //float w = (1024.0/6.0)*2;
    //float h = 768/4.0;
    
    float coordx = (1024.0/6.0)*col;
    float coordy = (768/4.0)*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    if (row>0) y = y + SPACING/2.0;
    if (col>0) x = x +SPACING/2.0;
    
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    
    [ self.top_view addSubview:v ];
    
    return v;
}


-(UIView *) fourByTwoPic: (int)sr: (int)sc: (int)row: (int)col: (BOOL)movie: (NSString *)path
{
    float aw = (1024.0/6.0)*4;
    float ah = (768/4.0)*2;
    if (row==0) ah = ah - SPACING/2.0;
    else ah = ah - 2*(SPACING/2.0);
    if ((col==0)||(col==2)) aw = aw - SPACING/2.0;
    else aw = aw - 2*(SPACING/2.0);
    
    //float w = (1024.0/6.0)*4;
    //float h = (768/4.0)*2;
    
    float coordx = (1024.0/6.0)*col;
    float coordy = (768/4.0)*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    if ((row>0)&&(col>0)) y = y + SPACING/2.0 + 3; //TODO: fudge?
    else if (row>0) y = y + SPACING/2.0;
    if (col>0) x = x +SPACING/2.0 + 2; //TODO: fudge?
    
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (movie && path)
    {
        //  movie...
        self.fmv = [ [ MyMovieView alloc ] 
                    initWithFrame:
                    CGRectMake(x, y, aw, ah):path:2 ];
        //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
        //self.fmv.section = Film;
        //self.fmv.delegate = self;
        //self.fmv.vparent = (id *)self;
        [ self.top_view addSubview:self.fmv ];
    }
    else if (path)
    {
        
    }
    
    return v;
}


-(UIView *) sixByTwoPic: (int)sr: (int)sc: (int)row: (int)col
{
    float aw = (1024.0/6.0)*6;
    float ah = (768/4.0)*2;
    if (row>0) ah = ah - 2*(SPACING/2.0);
    
    float coordx = (1024.0/6.0)*col;
    float coordy = (768/4.0)*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    if (row>0) y = y + SPACING/2.0 ;
    if (col>0) x = x +SPACING/2.0;
    
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    
    [ self.top_view addSubview:v ];
    
    
#if 1
    //  movie...
    self.fmv = [ [ MyMovieView alloc ] 
                initWithFrame:
                CGRectMake(x, y, aw, ah):@"Animation_Reel":2 ];
    //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
    
    //self.fmv.section = Film;
    //self.fmv.delegate = self;
    //self.fmv.vparent = (id *)self;
    [ self.top_view addSubview:self.fmv ];
#endif
    
    return v;
}



-(UIView *) sixByThreePic: (int)sr: (int)sc: (int)row: (int)col
{
    float aw = (1024.0/6.0)*6;
    float ah = (768/4.0)*3;
    if (row>0) ah = ah - (SPACING/2.0);
    
    float coordx = (1024.0/6.0)*col;
    float coordy = (768/4.0)*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    if (row>0) y = y + SPACING/2.0;
    
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    
    [ self.top_view addSubview:v ];
    
#if 1
    //  movie...
    self.fmv = [ [ MyMovieView alloc ] 
               initWithFrame:
                CGRectMake(x, y, aw, ah):@"FILM_REEL":2 ];
                //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
    
    //self.fmv.section = Film;
    //self.fmv.delegate = self;
    //self.fmv.vparent = (id *)self;
    [ self.top_view addSubview:self.fmv ];
#endif
    
    return v;
}


#pragma mark - init each section...

//  TOP ROW...

-(void) initPeople
{
    UIView *people = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, 1024, 768) ];
    [ people setBackgroundColor: [ UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5 ] ];
    [ self.top_view addSubview:people ];
    
#if 0
    UIView *p = [ [ UIImageView alloc ] initWithFrame:CGRectMake(50, 50, 450, 450) ];
    [ p setBackgroundColor:[ UIColor grayColor ]];
    p.clipsToBounds = YES;
    [ self.top_view addSubview:p ];
   
    UIImageView *v = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0, 0, 700, 700) ];
    UIImage *i = [ UIImage imageNamed:@"illustration02.jpg"];
    [ v setImage:i ];
    v.contentMode = UIViewContentModeScaleToFill;
    v.clipsToBounds = YES;
    
    [ p addSubview:v ];
    //v.contentMode = UIViewContentModeScaleAspectFill;
#endif
    
    [ self singlePic:0 :0 :0 :3 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :1 :4 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :2 :3 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :2 :4 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :2 :5 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :3 :0 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :3 :2 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :3 :4 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:0 :0 :3 :5 :nil: CGAffineTransformIdentity: YES ];
}


-(void) initIllustration
{
    UIView *parent= [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 0, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:0 :1 :0 :0 :nil: CGAffineTransformIdentity: YES  ];
    [ self singlePic:0 :1 :0 :5 :nil: CGAffineTransformIdentity: YES  ];
    [ self singlePic:0 :1 :1 :2 :@"illustration06.jpg": CGAffineTransformMakeTranslation(-50, -215): YES  ];
    [ self singlePic:0 :1 :1 :3 :@"illustration04.jpg": CGAffineTransformMakeTranslation(-130, -170): YES ];
    [ self singlePic:0 :1 :2 :4 :nil: CGAffineTransformIdentity: YES  ];
    [ self singlePic:0 :1 :3 :1 :nil: CGAffineTransformIdentity: YES ];
}


-(void) initFilm
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 0, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:0 :2 :0 :3  :nil: CGAffineTransformIdentity: YES];
    [ self sixByThreePic:0 :2 :1 :0];
}

//  MIDDLE ROW...

-(void) initDesign
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:0.5 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:1 :0 :2 :3 :nil: CGAffineTransformIdentity: YES ];
    
    [ self twoByOnePic:1 :0 :2 :0];
    [ self twoByOnePic:1 :0 :3 :0];
    
    //[ self twoByOnePic:1:0:0:2];
    
    [ self fourByTwoPic:1:0:0:2:NO:nil];
}


-(void) initHome
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:0.5 ] ];
    [ self.top_view addSubview:parent ];
    
}


-(void) initPreproduction
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:0.8 alpha:1.0 ] ];
    [ self.top_view addSubview:parent ];
    
    
    [ self singlePic:1 :2 :0 :4 :nil: CGAffineTransformIdentity: YES];
    [ self singlePic:1 :2 :2 :0 :nil: CGAffineTransformIdentity: YES];
    
    [ self fourByTwoPic:1:2:1:1:YES:@"Preproduction_Reel"];
    
}


//  BOTTOM ROW...

-(void) initCharacterDev
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:2 :0 :0 :2 :nil: CGAffineTransformIdentity: YES];
    [ self singlePic:2 :0 :0 :5 :nil: CGAffineTransformIdentity: YES];
    [ self singlePic:2 :0 :3 :1 :nil: CGAffineTransformIdentity: YES];
    [ self singlePic:2 :0 :3 :4 :nil: CGAffineTransformIdentity: YES];
    
    [ self fourByTwoPic:2:0:1:0:NO:nil];
}


-(void) initAnimation
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:2 :1 :3 :5:nil: CGAffineTransformIdentity: YES ];
    
    [ self sixByTwoPic:2 :1 :1 :0 ];
}


-(void) initStoryboard
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:1.0 ] ];
    [ self.top_view addSubview:parent ];
    
    [ self singlePic:2 :2 :0 :0 :nil: CGAffineTransformIdentity: YES ];
    [ self singlePic:2 :2 :2 :5 :nil: CGAffineTransformIdentity: YES ];
    
    [ self twoByOnePic:2:2:0:3];
    [ self twoByOnePic:2:2:1:3];
    [ self twoByOnePic:2:2:2:1];
    [ self twoByOnePic:2:2:3:1];
}

#pragma mark - zoom stuff...


-(void) zoom_tapped
{
#if 0
    if ( self.cur_zoom != nil )
    {
        ZoomPicView *pic = (ZoomPicView *)self.cur_zoom;
        
        [ pic unzoom ];
    }
#endif
}



#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //
    //  Create scroll view...
    //
    self.sv = [ [ MyScrollView alloc ] initWithFrame:CGRectMake(0,0,1024,768) ];
    self.sv.delegate = self;
    self.sv.backgroundColor = [ UIColor whiteColor ];
    self.sv.contentSize = CGSizeMake(1024*3, 768*3);
    [ self.view addSubview:self.sv ];
    self.sv.multipleTouchEnabled = YES;
    self.sv.directionalLockEnabled = YES;
    self.sv.contentOffset = CGPointMake(0,0);
    self.sv.pagingEnabled = YES;
    self.sv.scrollEnabled = YES;
    self.sv.showsVerticalScrollIndicator = YES;
    self.sv.showsHorizontalScrollIndicator = YES;
    
    //
    //  top view...
    //
    self.top_view = [ [ UIView alloc ] initWithFrame:CGRectMake(0,0,1024*3,768*3) ];
    //self.top_view.backgroundColor = [ UIColor colorWithRed:128 green:128 blue:128 alpha:0.5 ];
    [ self.sv addSubview:self.top_view ];

    //
    //  Zoom view...
    //
    self.zoom_view = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0,0,1,1) ];
    self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
    UITapGestureRecognizer *ztap = [ [ UITapGestureRecognizer alloc ] 
                                    initWithTarget:self action:@selector(zoom_view_tapped) ];
    [ztap setNumberOfTapsRequired:1];
    [ztap setNumberOfTouchesRequired:1];
    self.zoom_view.userInteractionEnabled = YES;
    [self.zoom_view addGestureRecognizer:ztap];
    [ self.sv addSubview:self.zoom_view ];
    [ self.sv bringSubviewToFront:self.zoom_view ];
    
    //
    //  Init each section...
    //
    
    //  Top row..
    [ self initPeople ];
    [ self initIllustration ];
    [ self initFilm ];
    
    //  Middle row...
    [ self initDesign ];
    [ self initHome ];
    [ self initPreproduction ];
    
    //  Bottom row...
    [ self initCharacterDev ];
    [ self initAnimation ];
    [ self initStoryboard ];
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
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
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



- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
#if 0
    //  Stop any movies...
    [ self stopMovies ];
    
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


@end
