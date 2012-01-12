//
//  ViewController.m
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DropShadowView.h"

@implementation ViewController

@synthesize top_view=_top_view;
@synthesize sv=_sv;

@synthesize zoom_view=_zoom_view;
@synthesize cur_zoom=_cur_zoom;
@synthesize zooming=_zooming;
@synthesize zoom_img=_zoom_img;

@synthesize fmv=_fmv;
@synthesize fmv2=_fmv2;
@synthesize fmv3=_fmv3;

@synthesize section=_section;

@synthesize objSection=_objSection;

@synthesize gotoing=_gotoing;

@synthesize menu_state=_menu_state;

@synthesize menu_animating=_menu_animating;

@synthesize menu = _menu;

@synthesize fullPathDCT=_fullPathDCT;

@synthesize larr=_larr;
@synthesize rarr=_rarr;
@synthesize barr=_barr;
@synthesize tarr=_tarr;

#define SPACING 10.0
#define EXTEND 20.0

CGRect lastZoomPicRect;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


-(void) gotoSection:(enum Section)sct:(BOOL)anim
{
    if ( self.gotoing )
    {
        return;
    }
    else
    {
        [ self stopMovies ];
        
        CGPoint pt;
        switch (sct)
        {
            case Section_AboutUs: 
                pt = CGPointMake(0, 0);
                break;
            case Section_Illustration:
                pt = CGPointMake(1024, 0);
                break;
            case Section_Film:
                pt = CGPointMake(1024*2, 0);
                break;
            case Section_Design:
                pt = CGPointMake(0, 768);
                break;
            case Section_Home:
                pt = CGPointMake(1024, 768);
                break;
            case Section_Preproduction:
                pt = CGPointMake(1024*2, 768);
                break;
            case Section_CharacterDevelopment:
                pt = CGPointMake(0, 768*2);
                break;
            case Section_Animation:;
                pt = CGPointMake(1024, 768*2);
                break;
            case Section_Storyboarding:
                pt = CGPointMake(1024*2, 768*2);
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
        if ( [self.cur_zoom.subviews count] > 0 )
        {
            UIView *pp = [ self.cur_zoom.subviews objectAtIndex:0 ];
            UIImageView *iv = [ pp.subviews objectAtIndex:0 ];
            if ( CGAffineTransformIsIdentity( iv.transform ) )
            {
                return;
            }
        }
        
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

-(void) handleBleed: (enum Section)sct
{
    [ self gotoSection:sct :YES ];
}

#pragma mark - gestures...

-(void) oneFingerOneTap: (UIGestureRecognizer *)g
{
    UIView *v = g.view;
    
    //  See if we need to handle bleed...
    enum Section nsct= v.tag;
    enum Section osct = self.section;
    if ( osct != nsct)
    {
        [ self handleBleed:nsct ];
    }
    else // zoom
    {
        self.cur_zoom = v;
        if ( [ v.subviews count ] > 0 )
        {
            UIView *pp = [ self.cur_zoom.subviews objectAtIndex:0 ];
            UIImageView *iv = [ pp.subviews objectAtIndex:0 ];
            
            long vint = (long)v;
            NSString *fullimg = [ self.fullPathDCT objectForKey:[NSNumber numberWithLong:vint ] ];
            if (fullimg)
            {
                UIImage *img = [ UIImage imageNamed:fullimg ];
                self.zoom_img = img;
            }
            else
            {
                self.zoom_img = iv.image;
            }
            [ self zoom ];
        }
    }
}


-(void) zoom_view_tapped
{
    if ( self.cur_zoom != nil )
    {
        [ self unzoom ];
    }
}


#pragma mark - elements..

-(UIView *) singlePic: 
    (int)sr: (int)sc: 
    (int)row: (int)col: 
    (NSString *)img: 
    (NSString *)fullimg:
    (CGAffineTransform)tr: (BOOL)clip:
    (float) l:(float)t:(float)r:(float)b:
    (enum Section)sct
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
    
    //  adjust coords for bleeding...
    {
        x = x - l;
        y = y - t;
        aw = aw + l + r;
        ah = ah + t + b;
    }
    
    //  TODO: HACKS: extend certain bleeds a little more...
    
    if ( CGAffineTransformIsIdentity(tr) && (col==5) && (r>0) )
    {
        aw = aw + 12;
    }
    
    if ( CGAffineTransformIsIdentity(tr) && (row==3) && (b>0) )
    {
        ah = ah + 10;
    }
    
    
#if 0
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    CALayer *layer = [ CALayer layer ];
    layer.masksToBounds = NO;
    layer.frame = CGRectMake(0,0,aw,ah);
    layer.cornerRadius = 10;
    layer.backgroundColor = [ UIColor redColor ].CGColor;
    layer.borderColor = [ UIColor blueColor].CGColor;
    layer.borderWidth = 5;
    layer.shadowOpacity = 0.5;
    layer.shadowOffset = CGSizeMake(3.0,3.0); 
    [ v.layer addSublayer:layer];
#else
    UIView *v = nil;
    if ( CGAffineTransformIsIdentity(tr) ) // design elements bring their own drop shadow...
    {
        v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    }
    else
    {
        v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    }
    v.clipsToBounds = NO;
    //[ v setBackgroundColor:[ UIColor whiteColor ] ];
#endif
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        //UIImage *p = nil;
        
        UIView *pp = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        //[ v addSubview:iv ];
        [pp addSubview:iv ];
        iv.clipsToBounds = YES;
        
        iv.transform = tr;
        
        if ( CGAffineTransformIsIdentity(tr) ) // make imageview same size as parent...
        {
            iv.contentMode = UIViewContentModeScaleToFill;
            iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        }
        else
        {
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        }
        
        //iv.clipsToBounds = YES;
        //v.clipsToBounds = NO;
#if 0
        v.clipsToBounds = clip;
        
        if (!v.clipsToBounds)  // draw a debug rect...
        {
            UIView *t = [ [ UIView alloc ] initWithFrame:
                         CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
            [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
            [ v addSubview:t];  
            
        }
#endif

    }
    
    //  gesture...
    UITapGestureRecognizer *stap = 
    [[UITapGestureRecognizer alloc] 
                        initWithTarget:self action:@selector(oneFingerOneTap:)];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ v addGestureRecognizer:stap ];
    
    UIPinchGestureRecognizer *pinch = [ [ UIPinchGestureRecognizer alloc ] 
                                       initWithTarget:self action:@selector(oneFingerOneTap:) ];
    //[ztap setNumberOfTapsRequired:1];
    //[ztap setNumberOfTouchesRequired:1];
    [v addGestureRecognizer:pinch ];
    
    //  map view to section...
    v.tag = sct;
    //NSNumber *num = [ NSNumber numberWithInt:sct ];
    //[ self.objSection setObject:num forKey:num ];
    
    if (fullimg)
    {
        long vint = (long)v;
        [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
    }
    
    return v;
}


-(UIView *) twoByOnePic: (int)sr: (int)sc: (int)row: (int)col:
    (NSString *)img: 
    (NSString *)fullimg:
    (CGAffineTransform)tr: (BOOL)clip:
    (float) l:(float)t:(float)r:(float)b:
    (enum Section)sct
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
    
    //  adjust coords for bleeding...
    {
        x = x - l;
        y = y - t;
        aw = aw + l + r;
        ah = ah + t + b;
    }
    
    //UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    v.clipsToBounds = NO;
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        //UIImage *p = nil;
        
        UIView *pp = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        //[ v addSubview:iv ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        //iv.transform = tr;
        iv.transform = tr;
        
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        
        
#if 0
        v.clipsToBounds = clip;
        if (!v.clipsToBounds)
        {
            UIView *t = [ [ UIView alloc ] initWithFrame:
                         CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
            [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
            [ v addSubview:t];  
            
        }
#endif
    }
    
    //  gesture...
    UITapGestureRecognizer *stap = 
    [[UITapGestureRecognizer alloc] 
     initWithTarget:self action:@selector(oneFingerOneTap:)];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ v addGestureRecognizer:stap ];
    
    //  map view to section...
    v.tag = sct;
    //NSNumber *num = [ NSNumber numberWithInt:sct ];
    //[ self.objSection setObject:num forKey:num ];
    
    if (fullimg)
    {
        long vint = (long)v;
        [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
    }
    
    return v;
}


-(UIView *) fourByTwoPic: (int)sr: (int)sc: (int)row: (int)col: 
    (BOOL)movie: 
    (NSString *)path:
    (NSString *)fullimg:
    (CGAffineTransform)tr: (BOOL)clip:
    (float) l:(float)t:(float)r:(float)b:
    (enum Section)sct
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
    
    //  adjust coords for bleeding...
    {
        x = x - l;
        y = y - t;
        aw = aw + l + r;
        ah = ah + t + b;
    }

    //UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    v.clipsToBounds = NO;
    if (movie)
    {
        [ v setBackgroundColor:[ UIColor blackColor ] ];
    }
    else
    {
        [ v setBackgroundColor:[ UIColor whiteColor ] ];
    }
    
    [ self.top_view addSubview:v ];
    
    if (movie && path)
    {
        //
        //  movie...
        //
        self.fmv = [ [ MyMovieView alloc ] 
                    initWithFrame:
                    CGRectMake(x, y, aw, ah):path:2 ];
        self.fmv.section = sct;
        self.fmv.del = self;
        
        //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
        //self.fmv.section = Film;
        //self.fmv.delegate = self;
        //self.fmv.vparent = (id *)self;
        [ self.top_view addSubview:self.fmv ];
    }
    else if (path)
    {
        UIImage *p = [ UIImage imageNamed:path ];
            //UIImage *p = nil;
            
        UIView *pp = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        //[ v addSubview:iv ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
            
            //iv.transform = tr;
        iv.transform = tr;
        
        if ( CGAffineTransformIsIdentity(tr) )
        {
            iv.contentMode = UIViewContentModeScaleToFill;
            iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        }
        else
        {
            iv.contentMode = UIViewContentModeScaleAspectFill;
            iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        }
        
#if 0
        v.clipsToBounds = clip;
        if (!v.clipsToBounds)
            {
                UIView *t = [ [ UIView alloc ] initWithFrame:
                             CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
                [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
                [ v addSubview:t];  
                
            }
#endif
        
    }
     
    if (!movie)
    {
        //  gesture...
        UITapGestureRecognizer *stap = 
        [[UITapGestureRecognizer alloc] 
         initWithTarget:self action:@selector(oneFingerOneTap:)];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
        //NSNumber *num = [ NSNumber numberWithInt:sct ];
        //[ self.objSection setObject:num forKey:num ];
        
        if (fullimg)
        {
            long vint = (long)v;
            [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
        }
    }
    
    return v;
}


-(UIView *) sixByTwoPic: (int)sr: (int)sc: (int)row: (int)col:
    (NSString *)img: (CGAffineTransform)tr: (BOOL)clip:
    (float) l:(float)t:(float)r:(float)b:
    (enum Section)sct
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
    
    
    //  adjust coords for bleeding...
    {
        x = x - l;
        y = y - t;
        aw = aw + l + r;
        ah = ah + t + b;
    }
    
    //UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    v.clipsToBounds = NO;
    [ v setBackgroundColor:[ UIColor blackColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        //UIImage *p = nil;
        
        UIView *pp = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        //[ v addSubview:iv ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        //iv.transform = tr;
        iv.transform = tr;
        
#if 0
        v.clipsToBounds = clip;
        if (!v.clipsToBounds)
        {
            UIView *t = [ [ UIView alloc ] initWithFrame:
                         CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
            [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
            [ v addSubview:t];  
            
        }
#endif
        
        //  gesture...
        UITapGestureRecognizer *stap = 
        [[UITapGestureRecognizer alloc] 
         initWithTarget:self action:@selector(oneFingerOneTap:)];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
        //NSNumber *num = [ NSNumber numberWithInt:sct ];
        //[ self.objSection setObject:num forKey:num ];
    }
    else
    {
        //
        //  movie...
        //
        self.fmv2 = [ [ MyMovieView alloc ] 
                initWithFrame:
                CGRectMake(x, y, aw, ah):@"Animation_Reel":2 ];
        self.fmv2.section = sct;
        self.fmv2.del = self;
        
        //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
        //self.fmv2.section = Film;
        //self.fmv2.delegate = self;
        //self.fmv2.vparent = (id *)self;
        [ self.top_view addSubview:self.fmv2 ];
    
    }
    
    
    return v;
}



-(UIView *) sixByThreePic: (int)sr: (int)sc: (int)row: (int)col:
    (NSString *)img: (CGAffineTransform)tr: (BOOL)clip:
    (float) l:(float)t:(float)r:(float)b:
    (enum Section)sct
{
    float aw = (1024.0/6.0)*6;
    float ah = (768/4.0)*3;
    if (row>0) ah = ah - (SPACING/2.0);
    
    float coordx = (1024.0/6.0)*col;
    float coordy = (768/4.0)*row;
    
    float x = sc * 1024 + coordx;
    float y = sr * 768 + coordy;
    if (row>0) y = y + SPACING/2.0;
    
    //
    //  adjust coords for bleeding...
    //
    {
        x = x - l;
        y = y - t;
        aw = aw + l + r;
        ah = ah + t + b;
    }
    
    //UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    v.clipsToBounds = NO;
    [ v setBackgroundColor:[ UIColor blackColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        //UIImage *p = nil;
        
        UIView *pp = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ UIImageView alloc ] initWithImage:p ];
        //[ v addSubview:iv ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        //iv.transform = tr;
        iv.transform = tr;
        
#if 0
        v.clipsToBounds = clip;
        if (!v.clipsToBounds)
        {
            UIView *t = [ [ UIView alloc ] initWithFrame:
                         CGRectMake(0, 0, v.frame.size.width, v.frame.size.height) ];
            [ t setBackgroundColor:[ UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5 ] ];
            [ v addSubview:t];  
            
        }
#endif
        
        
        //  gesture...
        UITapGestureRecognizer *stap = 
        [[UITapGestureRecognizer alloc] 
         initWithTarget:self action:@selector(oneFingerOneTap:)];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
        //NSNumber *num = [ NSNumber numberWithInt:sct ];
        //[ self.objSection setObject:num forKey:num ];
        

    }
    else
    {
        
        //
        //  movie...
        //
        self.fmv3 = [ [ MyMovieView alloc ] 
               initWithFrame:
                CGRectMake(x, y, aw, ah):@"FILM_REEL":2 ];
        self.fmv3.section = sct;
        self.fmv3.del = self;
        
                //CGRectMake(xoff, 43, 1024, 768):@"FILM_REEL":2 ];
    
        //self.fmv3.section = Film;
        //self.fmv3.delegate = self;
        //self.fmv3.vparent = (id *)self;
        [ self.top_view addSubview:self.fmv3 ];

    }
        
    return v;
}


#pragma mark - init each section...

//  TOP ROW...

-(void) initPeople
{
    UIView *people = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, 1024, 768) ];
    [ people setBackgroundColor: [ UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5 ] ];
    //[ self.top_view addSubview:people ];
    
    float l = 120.0f;
    float t = 120.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile1Aboutus.png" ];
    [ iv setImage:img ];
        
    img = [ UIImage imageNamed:@"Tile1Text.png" ];
    iv = [ [ UIImageView alloc ] initWithImage:img ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    [ iv setImage:img ];
    iv.frame = CGRectMake(150, 175, iv.frame.size.width, iv.frame.size.height );
    
    [ self singlePic:0 :0 :0 :3 :@"Box.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0 ];
    [ self singlePic:0 :0 :1 :4 :@"Boxdottedbig.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :2 :3 :@"Box.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :2 :4 :@"Box.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :2 :5 :@"Box2.png": nil: CGAffineTransformIdentity: YES:0:0:EXTEND:0 :0];
    [ self singlePic:0 :0 :3 :0 :@"Boxdottedbig.png": nil: CGAffineTransformIdentity: YES:0:0:0:EXTEND :0];
    [ self singlePic:0 :0 :3 :2 :@"Box.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :3 :4 :@"Box.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :3 :5 :@"Box2.png": nil: CGAffineTransformIdentity: YES:0:0:EXTEND:0 :0];
}


-(void) initIllustration
{
    UIView *parent= [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 0, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 1024.0 + 350.0f;
    float t = 580.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile2Illustration.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:0 :1 :0 :0 :@"Boxdottedbig2.png": nil:CGAffineTransformIdentity: YES :EXTEND:0:0:0 :1];
    [ self singlePic:0 :1 :0 :5 :@"Tile2Dudecropped.png":@"illustration14.jpg":
        //CGAffineTransformMakeTranslation(-60,-130): 
        CGAffineTransformMakeTranslation(0.01,0.01): 
        YES :0:0:EXTEND:0 :1];
    [ self singlePic:0 :1 :1 :2 :@"Tile2Boatcropped.png":@"illustration06.jpg": 
        //CGAffineTransformMakeTranslation(-50, -215): 
                 CGAffineTransformMakeTranslation(0.01,0.01):
                 YES:0:0:0:0  :1];
    [ self singlePic:0 :1 :1 :3 :@"Tile2Clockcropped.png":@"illustration04.jpg": 
            //CGAffineTransformMakeTranslation(-130, -170): 
                CGAffineTransformMakeTranslation(0.01,0.01):
                 YES:0:0:0:0 :1];
    [ self singlePic:0 :1 :2 :4 :@"Tile2Classroomcropped.png":@"illustration03.jpg":
                //CGAffineTransformMakeTranslation(-750,-120): 
                CGAffineTransformMakeTranslation(0.01,0.01):
                YES :0:0:0:0 :1];
    [ self singlePic:0 :1 :3 :1 :@"Tile2Mnmcropped.png":@"illustration15.jpg":
                //CGAffineTransformMakeTranslation(-100,-210): 
                CGAffineTransformMakeTranslation(0.01,0.01):
                YES:0:0:0:EXTEND :1];
}


-(void) initFilm
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 0, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5 ] ];
    //[ self.top_view addSubview:parent ];
    
    
    float l = 1024.0*2 + 100.0f;
    float t = 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile3Film.png" ];
    [ iv setImage:img ];

    
    [ self singlePic:0 :2 :0 :3  :@"Boxdottedbig.png": nil:CGAffineTransformIdentity: YES:0:0:0:0  :2];
    [ self sixByThreePic:0 :2 :1 :0: nil: CGAffineTransformIdentity: YES:  EXTEND:0:0:EXTEND :2];
}

//  MIDDLE ROW...

-(void) initDesign
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.8 green:0.0 blue:0.0 alpha:0.5 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 470.0f;
    float t = 768 + 580.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile4Design.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:1 :0 :2 :3 :@"Boxdottedbig.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :3];
    
    [ self twoByOnePic:1 :0 :2 :0 :@"Tile4Bryancropped.png":@"design12.jpg": 
        //CGAffineTransformMakeTranslation(-50, -60): 
        CGAffineTransformMakeTranslation(0.01, 0.01):
            YES :0:0:0:0 :3];
    [ self twoByOnePic:1 :0 :3 :0 :@"Tile4Billiecropped.png":@"design04.jpg": 
        //CGAffineTransformMakeTranslation(-60, -80):
        CGAffineTransformMakeTranslation(0.01, 0.01):
                   YES:0:0:0:EXTEND :3];
    
    [ self fourByTwoPic:1:0:0:2:NO:@"design15.jpg":@"design15.jpg":CGAffineTransformMakeTranslation(0.01, 0.01) :YES  :0:EXTEND:EXTEND:0 :3];
    
    //fixup some bleed...
    UIView *bf = [ [ UIView alloc ] initWithFrame:CGRectMake(1024-340, 768-30, 340, 30) ];
    bf.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:bf ];
    
    bf = [ [ UIView alloc ] initWithFrame:CGRectMake(1024-665, 768-30, 150, 30) ];
    bf.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:bf ];
                  
    
}


-(void) initHome
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.8 blue:0.0 alpha:0.5 ] ];
    //[ self.top_view addSubview:parent ];
    
    float w = 300.0;
    float h = 300.0;
    float l = 1024.0/2.0- w/2;
    float t = 768.0/2.0 - h/2;
    l = l + 1024.0;
    t = t + 768.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l,t,w,h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *img = [ UIImage imageNamed:@"THESTUDIO_RED copy" ];
    [ iv setImage:img ];
    [ self.top_view addSubview:iv ];
    
    float ox = 1024.0;
    float oy = 768.0;
    //  Right arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowright.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox + 1024-img.size.width, oy + 768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ button setImage:img  forState:UIControlStateNormal ];
    [ button addTarget:self action:@selector(goright:) forControlEvents:UIControlEventTouchUpInside ];
    //iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(1024-img.size.width, 768/2.0-img.size.height/2.0, 
    //                                                      img.size.width, img.size.height)];
    //iv.contentMode = UIViewContentModeScaleAspectFit;
    //iv.image = img;
    //[ self.top_view addSubview:iv ];
    [ self.top_view addSubview:button ];
    self.rarr = button;
    
    //  Left arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowleft.png"];
    button = [UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox + 0, oy + 768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ button setImage:img  forState:UIControlStateNormal ];
    [ button addTarget:self action:@selector(goleft:) forControlEvents:UIControlEventTouchUpInside ];
    //iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0, 768/2.0-img.size.height/2.0, 
    //                                                      img.size.width, img.size.height)];
    //iv.contentMode = UIViewContentModeScaleAspectFit;
    //iv.image = img;
    //[ self.top_view addSubview:iv ];
    [ self.top_view addSubview:button ];
    self.larr = button;
    
    //  Down arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowdown.png"];
    button = [UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox + 1024/2.0-img.size.width/2.0, oy + 768-img.size.height, 
                              img.size.width, img.size.height);
    [ button setImage:img  forState:UIControlStateNormal ];
    [ button addTarget:self action:@selector(godown:) forControlEvents:UIControlEventTouchUpInside ];
    //iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(1024/2.0-img.size.width/2.0, 768-img.size.height, 
    //                                                      img.size.width, img.size.height)];
    //iv.contentMode = UIViewContentModeScaleAspectFit;
    //iv.image = img;
    //[ self.top_view addSubview:iv ];
    [ self.top_view addSubview:button ];
    self.barr = button;
    
    //  Left arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowup.png"];
    button = [UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox + 1024/2.0-img.size.width/2.0, oy + 0, 
                              img.size.width, img.size.height);
    [ button setImage:img  forState:UIControlStateNormal ];
    [ button addTarget:self action:@selector(goup:) forControlEvents:UIControlEventTouchUpInside ];
    //iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(1024/2.0-img.size.width/2.0, 0, 
    //                                                      img.size.width, img.size.height)];
    //iv.contentMode = UIViewContentModeScaleAspectFit;
    //iv.image = img;
    //[ self.top_view addSubview:iv ];
    [ self.top_view addSubview:button ];
    self.tarr = button;
}


-(void) initPreproduction
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 768, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:0.8 alpha:1.0 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 1024.0*2 + 180.0f;
    float t = 768.0 + 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile6Preproduction.png" ];
    [ iv setImage:img ];
    
    
    [ self singlePic:1 :2 :0 :4 :@"Boxdottedbig.png": nil:CGAffineTransformIdentity: YES:0:0:0:0  :5];
    [ self singlePic:1 :2 :2 :0 :@"Boxdottedbig2.png": nil:CGAffineTransformIdentity: YES:EXTEND:0:0:0  :5];
    
    [ self fourByTwoPic:1:2:1:1:YES:@"Preproduction_Reel":nil:CGAffineTransformIdentity:YES :0:0:0:0 :5];
    
}


//  BOTTOM ROW...

-(void) initCharacterDev
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(0, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.5 green:0.0 blue:0.0 alpha:1.0 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 0 + 680.0f;
    float t = 768.0*2 + 384.0f;
    float w = 250.0;
    float h = 100.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile7Characterdevelopment.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:2 :0 :0 :2 :@"Tile7Maestrocropped.png":@"charDev12.jpg":
        //CGAffineTransformMakeTranslation(-460, -110): 
        CGAffineTransformMakeTranslation(0.01, 0.01):
                 YES:0:EXTEND:0:0 :6];
    [ self singlePic:2 :0 :0 :5 :@"Boxdottedbig2.png": nil:CGAffineTransformIdentity: YES:0:EXTEND:EXTEND:0  :6];
    [ self singlePic:2 :0 :3 :1 :@"Boxdottedbig.png": nil:CGAffineTransformIdentity: YES:0:0:0:0  :6];
    [ self singlePic:2 :0 :3 :4 :@"Tile7Kimonocropped.png":@"charDev15.jpg":
        //CGAffineTransformMakeTranslation(-230, -240): 
        CGAffineTransformMakeTranslation(0.01, 0.01):
                 YES:0:0:0:0 :6];
    
    [ self fourByTwoPic:2:0:1:0:NO:@"charDev01.jpg":@"charDev01.jpg":CGAffineTransformIdentity:YES  :0:0:0:0 :6];
}


-(void) initAnimation
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.5 blue:0.0 alpha:1.0 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 1024.0*1 + 180.0f;
    float t = 768.0*2 + 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile8Animation.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:2 :1 :3 :5:@"Boxdottedbig.png": nil:CGAffineTransformIdentity: YES:0:0:(EXTEND+3.0):0 :7];
    
    [ self sixByTwoPic:2 :1 :1 :0  :nil:CGAffineTransformIdentity:YES  :EXTEND:0:EXTEND:0  :7];
}


-(void) initStoryboard
{
    UIView *parent = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2, 768*2, 1024, 768) ];
    [ parent setBackgroundColor: [ UIColor colorWithRed:0.0 green:0.0 blue:0.5 alpha:1.0 ] ];
    //[ self.top_view addSubview:parent ];
    
    float l = 1024.0*2 + 475.0f;
    float t = 768.0*2 + 389.0f;
    float w = 300.0;
    float h = 100.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile9Storyboards.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:2 :2 :0 :0 :@"Boxdottedbig2.png": nil:CGAffineTransformIdentity: YES:EXTEND:EXTEND:0:0 :8];
    [ self singlePic:2 :2 :2 :5 :@"Boxdottedbig.png": nil: CGAffineTransformIdentity: YES:0:0:0:0 :8];
    [ self twoByOnePic:2:2:0:3  :@"Tile9Redcropped.png":@"SB_Concepts04.jpg": 
        CGAffineTransformMakeTranslation(0.01,0.01): 
        YES :0:EXTEND:0:0 :8];
    [ self twoByOnePic:2:2:1:3  :@"Tile9Bikescropped.png":@"SB_Concepts08.jpg": 
        //CGAffineTransformMakeTranslation(-200,-200): 
        CGAffineTransformMakeTranslation(0.01,0.01): 
        YES :0:0:0:0 :8];
    [ self twoByOnePic:2:2:2:1  :@"Tile9Drapercropped.png":@"SB_Concepts21.jpg":
        //CGAffineTransformMakeTranslation(-160,0): 
        CGAffineTransformMakeTranslation(0.01,0.01): 
        YES :0:0:0:0 :8];
    [ self twoByOnePic:2:2:3:1  :@"Tile9Sariscropped.png":@"SB_Concepts29.jpg":
        CGAffineTransformMakeTranslation(0.01,0.01): 
        //CGAffineTransformMakeTranslation(-200,-40): 
        YES :0:0:0:0 :8];
}


-(void) initMenu
{
    UIImage *img = [ UIImage imageNamed:@"Tile5Redarrow2.png" ]; 
    UIButton *button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    [ button addTarget:self action:@selector(toggleMenu:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(1024-img.size.width+20, 768.0/2.0 - 300, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    [ self.view addSubview:button ];
    
    img = [ UIImage imageNamed:@"Tile5Menu_Background2.png" ];
    UIView *iv = [ [ UIView alloc] initWithFrame:CGRectMake(1024-img.size.width+10, 768.0/2.0 - 200, 
            img.size.width, img.size.height ) ];
    [ self.view addSubview:iv ]; 
    self.menu = iv;
    
    UIImageView *bgview = [ [ UIImageView alloc] initWithFrame:CGRectMake(0, 0, 
                    img.size.width, img.size.height ) ];
    [ bgview  setImage:img ];
    [ iv addSubview:bgview ];
    
    float ox = 45;
    float oy = 40;
    float spacing = 25.0;
    img = [ UIImage imageNamed:@"Tile5Menu_content2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    //button.backgroundColor = [ UIColor greenColor ];
    [ button setImage:img forState:UIControlStateNormal ];
    [ iv addSubview:button ];
    oy += spacing + 20 + img.size.height;
    
    ox = ox - 15;
    img = [ UIImage imageNamed:@"Tile5Menu_Thestudio2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Home;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    //button.backgroundColor = [ UIColor greenColor ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Thestudiored2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Illustration2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Illustration;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    //button.backgroundColor = [ UIColor greenColor ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Illustrationred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    
    img = [ UIImage imageNamed:@"Tile5Menu_Animation2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Animation;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Animationred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Preproduction2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Preproduction;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Preproductionred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
#if 0
    img = [ UIImage imageNamed:@"Tile5Menu_Preproduction2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Preproduction;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Preproductionred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
#endif
    
    img = [ UIImage imageNamed:@"Tile5Menu_Film2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Film;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Filmred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Characterdevelopment2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_CharacterDevelopment;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Characterdevelopmentred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Design2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    button.tag = Section_Design;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Designred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    //[ button setImage:img forState:UIControlStateHighlighted ];
    //[ self.view addSubview:button ];
    [ iv addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Aboutus2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    button.tag = Section_AboutUs;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Aboutusred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    //[ button setImage:img forState:UIControlStateHighlighted ];
    //[ self.view addSubview:button ];
    [ iv addSubview:button ];
    
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

-(void) fixBleeds
{
    UIView *v = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2 - 50,768, 50,50 ) ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
    v = [ [ UIView alloc ] initWithFrame:CGRectMake(1024,768*2-50, 50,50 ) ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
    v = [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2-50,768*2-50, 50,50 ) ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
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
    //self.top_view.backgroundColor = [ UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0 ];
    [ self.sv addSubview:self.top_view ];

    //
    //  Zoom view...
    //
    self.zoom_view = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0,0,1,1) ];
    self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
    
    UIPinchGestureRecognizer *pinch = [ [ UIPinchGestureRecognizer alloc ] 
                                    initWithTarget:self action:@selector(zoom_view_tapped) ];
    //[ztap setNumberOfTapsRequired:1];
    //[ztap setNumberOfTouchesRequired:1];
    [self.zoom_view addGestureRecognizer:pinch ];
    
    UITapGestureRecognizer *ztap = [ [ UITapGestureRecognizer alloc ] 
                                    initWithTarget:self action:@selector(zoom_view_tapped) ];
    [ztap setNumberOfTapsRequired:1];
    [ztap setNumberOfTouchesRequired:1];
    self.zoom_view.userInteractionEnabled = YES;
    [self.zoom_view addGestureRecognizer:ztap];
    [ self.sv addSubview:self.zoom_view ];
    [ self.sv bringSubviewToFront:self.zoom_view ];
    
    self.objSection = [ [ NSMutableDictionary alloc ] initWithCapacity: 0 ];
    
    self.fullPathDCT = [ [ NSMutableDictionary alloc ] initWithCapacity: 0 ];
    
    //
    //  Init each section...
    //
    
    //  Top row..
    [ self initIllustration ];
    
    //  Middle row...
    [ self initDesign ];
    [ self initHome ];
    [ self initPreproduction ];
    
    //  Bottom row...
    [ self initCharacterDev ];
    [ self initAnimation ];
    [ self initStoryboard ];
    
    //  ON TOP
    [ self initPeople ];
    [ self initFilm ];

    //  Menu...
    [ self initMenu ];
    
    //  Fix some bleed overs...
    [ self fixBleeds ];
}



- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //  hide status bar...
    [ [ UIApplication sharedApplication ] setStatusBarHidden:YES ];
    
    //  start in home section...
    self.section = 4;
    self.sv.contentOffset = CGPointMake(1024.0, 768.0);
    
    //  menu is off...
    self.menu_state = 0;
    self.menu.frame = CGRectMake(1024, self.menu.frame.origin.y, 
                                 self.menu.frame.size.width, self.menu.frame.size.height);
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

    // Return YES for supported orientations
    //return YES;
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

- (CGPoint) getCenter: (enum Section)sct
{
    float fx = 1024.0;
    float fy = 768.0;
    float hx = 1024/2.0f;
    float hy = 768/2.0f;
    switch (sct)
    {
        case Section_AboutUs:
            return CGPointMake( 0 + hx, 0 + hy );
        case Section_Illustration:
            return CGPointMake( fx + hx, 0 + hy );
        case Section_Film:
            return CGPointMake( fx*2 + hx, 0 + hy );
        case Section_Design:
            return CGPointMake( 0 + hx, fy + hy );
        case Section_Home:
            return CGPointMake( fx + hx, fy + hy );
        case Section_Preproduction:   
            return CGPointMake( fx*2 + hx, fy +hy );   
        case Section_CharacterDevelopment:
            return CGPointMake( 0 + hx, fy*2 + hy );
        case Section_Animation:
            return CGPointMake( fx + hx, fy*2 + +hy );
        case Section_Storyboarding: 
            return CGPointMake( fx*2 + hx, fy*2 + hy ); 
    }
}


-(void) stopMovies
{
    [ self.fmv stop ];
    [ self.fmv2 stop ];
    [ self.fmv3 stop ];    
}

-(void) arrowState: (BOOL)show
{
    if (show)
    {
        self.larr.hidden = NO;
        self.rarr.hidden = NO;
        self.barr.hidden = NO;
        self.tarr.hidden = NO;
    }
    else
    {
        self.larr.hidden = YES;
        self.rarr.hidden = YES;
        self.barr.hidden = YES;
        self.tarr.hidden = YES;
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //  Stop any movies...
    [ self stopMovies ]; 
    
    //enum Section lastSection = self.section;
    
    //  Figure out the section we are in...
    for ( int i=Section_AboutUs;i<=Section_Storyboarding;i++)
    {
        CGRect rect = CGRectMake(self.sv.contentOffset.x, self.sv.contentOffset.y, self.sv.frame.size.width, self.sv.frame.size.height);
        CGPoint pt = [self getCenter:i];
        if ( CGRectContainsPoint(rect,pt ) )
        {
            self.section = i;
            break;
        }
    }
    
    if (self.section == Section_Home )
    {
        [ self arrowState:YES ];
    }
    else
    {
        [ self arrowState:NO ];
    }
    
    //[ self togglePage:lastSection :NO ];
    //[ self togglePage:self.section :YES ];

}

#pragma mark - movieview del...

-(BOOL) movieHandleBleed:(enum Section)sct
{
    enum Section osct = self.section;
    if ( osct != sct )
    {
        [ self gotoSection:sct :YES ];
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark - button callback...

-(void) goright: (id)sender
{
    [ self gotoSection:Section_Preproduction:YES ];
}

-(void) goleft: (id)sender
{
    [ self gotoSection:Section_Design:YES ];
}

-(void) goup: (id)sender
{
    [ self gotoSection:Section_Illustration:YES ];
}

-(void) godown: (id)sender
{
    [ self gotoSection:Section_Animation:YES ];
}

-(void) toggleMenu: (id)sender
{
    if ( self.menu_animating ) return;
    
    self.menu_animating = YES;
    
    if (self.menu_state)
    {
        [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.menu.frame = CGRectMake(1024, self.menu.frame.origin.y, 
                                                          self.menu.frame.size.width, self.menu.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.menu.frame = CGRectMake(1024, self.menu.frame.origin.y, 
                                                          self.menu.frame.size.width, self.menu.frame.size.height);
                             self.menu_animating = NO;
                             self.menu_state = 0;
                         }
         ];
    }
    else
    {
        [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.menu.frame = CGRectMake(1024 - self.menu.frame.size.width + 10, self.menu.frame.origin.y, 
                                                          self.menu.frame.size.width, self.menu.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.menu.frame = CGRectMake(1024 - self.menu.frame.size.width + 10, self.menu.frame.origin.y, 
                                                          self.menu.frame.size.width, self.menu.frame.size.height);
                             self.menu_animating = NO;
                             self.menu_state = 1;
                         }
         ];
    }
}


-(void) menuClicked: (id)sender
{
    UIButton *btn = (UIButton *)sender;
    
    enum Section tag = btn.tag;
    [ self gotoSection:tag:YES];
}

@end
