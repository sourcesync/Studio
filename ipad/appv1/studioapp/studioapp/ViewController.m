//
//  ViewController.m
//  studioapp
//∂gsv

//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "DropShadowView.h"
#import "AppDelegate.h"

@implementation ViewController

@synthesize top_view=_top_view;
@synthesize sv=_sv;
@synthesize section=_section;
@synthesize gotoing=_gotoing;
@synthesize menu_state=_menu_state;
@synthesize menu_animating=_menu_animating;
@synthesize menu = _menu;
@synthesize menu_tag=_menu_tag;
@synthesize fullPathDCT=_fullPathDCT;
@synthesize larr=_larr;
@synthesize rarr=_rarr;
@synthesize barr=_barr;
@synthesize tarr=_tarr;
@synthesize blinking=_blinking;

#ifdef DO_ZOOM
@synthesize zoom_view=_zoom_view;
@synthesize cur_zoom=_cur_zoom;
@synthesize zooming=_zooming;
@synthesize zoom_img=_zoom_img;
#endif

#ifdef DO_MOVIES
@synthesize fmv=_fmv;
@synthesize fmv2=_fmv2;
@synthesize fmv3=_fmv3;
#endif

#ifdef FATBOY
@synthesize flipanimation=_flipanimation;
@synthesize fatboy=_fatboy;
@synthesize fatboys=_fatboys;
@synthesize fatboyimgs=_fatboyimgs;
@synthesize anim_index=_anim_index;
#endif

#ifdef DO_GALLERY
@synthesize galleryImage=_galleryImage;
@synthesize cur_gallery=_cur_gallery;
@synthesize arrow_scrolling=_arrow_scrolling;
@synthesize lastrct=_lastrct;
@synthesize new_page=_new_page;
@synthesize gsv=_gsv;
@synthesize gtv=_gtv;
@synthesize pc=_pc;
@synthesize grarrow=_grarrow;
@synthesize glarrow=_glarrow;
@synthesize ivs=_ivs;
@synthesize gtap=_gtap;
@synthesize galleryDCT=_galleryDCT;
#endif

#define SPACING 10.0
#define EXTEND 20.0

#ifdef DO_ZOOM
CGRect lastZoomPicRect;
#endif


- (UIImage *) loadImage: (NSString *)path
{
    NSArray * parts = [ path  componentsSeparatedByString:@"."];
    NSString *p = [ parts objectAtIndex:0];
    NSString *ext = [ parts objectAtIndex:1 ];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:p ofType:ext];  
    NSData *myData = [NSData dataWithContentsOfFile:filePath]; 
    UIImage *img = [ [ UIImage alloc ] initWithData:myData ];
    [ img autorelease ];
    return img;
}


-(void) report_memory {
    struct task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kerr = task_info(mach_task_self(),
                                   TASK_BASIC_INFO,
                                   (task_info_t)&info,
                                   &size);
    if( kerr == KERN_SUCCESS ) {
        NSLog(@"Memory in use (in bytes): %u", info.resident_size);
    } else {
        NSLog(@"Error with task_info(): %s", mach_error_string(kerr));
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    [ self report_memory ];
    
#ifdef SHOW_DEBUG
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Low Memory" 
                                                    message:@"Low Memory" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
#endif
}


#pragma mark - zoom...

#ifdef DO_ZOOM
#pragma mark - gallery stuff...

#ifdef DO_GALLERY

-(void) scrollToPage:(int)page
{
    
    if (self.arrow_scrolling) return;
    self.arrow_scrolling = YES;
    
    CGRect rct = CGRectMake(1024.0*page, 0, 1024, 768); 
    self.lastrct = rct;
    self.new_page = page;
    //[self.gsv scrollRectToVisible:rct animated:YES];
    [UIView animateWithDuration:0.4
                          delay: 0.03
                        options: UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.gsv.contentOffset = CGPointMake(self.lastrct.origin.x, self.lastrct.origin.y);
                     }
                     completion:^(BOOL finished)
     {
         self.gsv.contentOffset = CGPointMake(self.lastrct.origin.x, self.lastrct.origin.y);
         self.arrow_scrolling = NO;
         self.pc.currentPage = self.new_page;
         self.glarrow.hidden = NO;
         self.grarrow.hidden = NO;
         if ( self.pc.currentPage == 0 )
         {
             self.glarrow.hidden = YES;
         }
         else if (self.pc.currentPage == ( self.pc.numberOfPages-1 ) )
         {
             self.grarrow.hidden = YES;
         }
         [ self loadPage ];
     }
     ];
}

-(void) nextPage
{
    if (self.arrow_scrolling) return;
    int cur_page = self.pc.currentPage;
    
    if (cur_page<( self.pc.numberOfPages - 1 ))
    {
        //[ self.pc setCurrentPage:(cur_page+1) ];
        [ self scrollToPage:(cur_page+1)];
    }
    
    
}


-(void) prevPage
{
    
    if (self.arrow_scrolling) return;
    int cur_page = self.pc.currentPage;
    
    if (cur_page>0)
    {
        [ self.pc setCurrentPage:(cur_page-1) ];
        [ self scrollToPage:(cur_page-1)];
    }
}

-(void) changePage: (id)sender
{
    int cur_page = self.pc.currentPage;
    
    [ self scrollToPage:cur_page ];
    
    //CGRect rct = CGRectMake(1024.0*cur_page, 0, 1024, 768); 
    //[self.gsv scrollRectToVisible:rct animated:YES];
    //self.gsv.contentOffset = CGPointMake(1024*cur_page,0);
}




-(void) hideGallery
{
    [ self.gtv removeFromSuperview ];
    [ self.gsv removeFromSuperview ];
    [ self.larr removeFromSuperview ];
    [ self.rarr removeFromSuperview ];
}

-(void) galleryTap:(id)sender
{
    [ self freeGallery ];
    
    [ self hideZoom ];
    
    [ self showBoard ];
    
}

-(void) gallerygoright:(id)sender
{
    [ self nextPage ];
}


-(void) gallerygoleft:(id)sender
{
    [ self prevPage ];
}



-(void)loadPage
{
    //return;  // load no images...
    
    //
    //  Figure out which images to show and remove...
    //
    
    self.gsv.scrollEnabled = NO;
    int page = self.pc.currentPage;
    int num_items = self.pc.numberOfPages;  
    
    UIImageView *iv = [ self.ivs objectAtIndex:page ];
    
    int left = page-1;
    UIImageView *leftiv= nil;
    if (left>=0)
    {
        leftiv = [ self.ivs objectAtIndex:left ];
    }
    //if ( leftiv != nil ) leftiv = leftiv;
    
    int right = page+1;
    UIImageView *rightiv= nil;
    if (right<num_items)
    {
        rightiv = [ self.ivs objectAtIndex:right ];
    }
    
    for (int i=0;i<num_items;i++)
    {
        // left...
        if ( LOAD_NEIGHBORS && (i==left) )
        {
            if ( (leftiv) && (!leftiv.image ) )
            {
                NSString *path = [ self.cur_gallery objectAtIndex:left ];
                //UIImage *img = [ UIImage imageNamed:path ];
                UIImage *img = [ self loadImage:path ];
                leftiv.image = img;
            }
        }
        else if ( i==page ) // load cur page ?
        {
            if (!iv.image) 
            {
                NSString *path = [ self.cur_gallery objectAtIndex:page ];
                //UIImage *img = [ UIImage imageNamed:path ];
                UIImage *img = [ self loadImage:path ];
                iv.image = img;
            }
        }
        else if ( LOAD_NEIGHBORS && (i==right) ) // load right of cur page ?
        {
            if ( (rightiv) && (!rightiv.image) )
            {
                NSString *path = [ self.cur_gallery objectAtIndex:right ];
                //UIImage *img = [ UIImage imageNamed:path ];
                UIImage *img = [ self loadImage:path ];
                rightiv.image = img;
            }
        }
        else // everything else clear the image...
        {
            UIImageView *cv = [ self.ivs objectAtIndex:i ];
            UIImage *img = cv.image;
            if (img)
            {
                //[ img release ];
                cv.image = nil;
            }
        }
    }
    
    self.gsv.scrollEnabled = YES;
}


-(void) freeGallery
{
    if (self.ivs)
    {
        for (int i=0;i<[ self.ivs count ];i++)
        {
            UIImageView *iv = [ self.ivs objectAtIndex:i ];
            [ iv removeFromSuperview ];
            iv.image = nil;
        }
        //[ self.ivs release ];
        self.ivs = nil;
    }
    [ self.glarrow removeFromSuperview ];
    //[ self.glarrow release ];
    self.glarrow = nil;
    [ self.grarrow removeFromSuperview ];
    //[ self.grarrow release ];
    self.grarrow = nil;
    [ self.gtv removeFromSuperview ];
    //[ self.gtv release ];
    self.gtv = nil;
    [ self.pc removeFromSuperview ];
    //[ self.pc release ];
    self.pc = nil;
    [ self.gsv removeFromSuperview ];
    //[ self.gsv release ];
    self.gsv = nil;
}

- (void) createGallery:(int)num_items
{
    //
    //  Create gallery scroll view...
    //
    self.gsv = [ [ [ MyScrollView alloc ] initWithFrame:CGRectMake(0,0,1024,768) ] autorelease ];
    self.gsv.delegate = self;
    //self.gsv.backgroundColor = [ UIColor greenColor ];
    self.gsv.contentSize = CGSizeMake(1024*num_items, 768);
    self.gsv.contentOffset = CGPointMake(0,0);
    self.gsv.multipleTouchEnabled = YES;
    self.gsv.directionalLockEnabled = YES;
    self.gsv.contentOffset = CGPointMake(0,0);
    self.gsv.pagingEnabled = YES;
    self.gsv.scrollEnabled = YES;
    self.gsv.showsVerticalScrollIndicator = YES;
    self.gsv.showsHorizontalScrollIndicator = YES;
    
    //
    //  top view...
    //
    self.gtv = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0,0,1024*num_items,768) ] autorelease ];
    //self.gtv.backgroundColor = [ UIColor blueColor ];
    [ self.gsv addSubview:self.gtv ];
    self.gtv.userInteractionEnabled = YES;
    
    //
    //  gesture...
    //
    self.gtap = 
        [ [[UITapGestureRecognizer alloc] 
           initWithTarget:self action:@selector(galleryTap:)] autorelease ];
    [ self.gtap setNumberOfTapsRequired:1];
    [ self.gtap setNumberOfTouchesRequired:1];
    [ self.gtv addGestureRecognizer:self.gtap ];
    
    //
    //  Right arrow...
    //
    UIImage *img = [ UIImage imageNamed:@"Tile5Arrowrightred2.png"]; //[ self loadImage:@"Tile5Arrowrightred2":@"png"]; 
    self.grarrow = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.grarrow.frame = CGRectMake( 1024-img.size.width,  768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ self.grarrow setImage:img  forState:UIControlStateNormal ];
    [ self.grarrow addTarget:self action:@selector(gallerygoright:) forControlEvents:UIControlEventTouchUpInside ];
    
    
    //
    //  Left arrow...
    //
    img = [ UIImage imageNamed:@"Tile5Arrowleftred2.png"]; //[ self loadImage:@"Tile5Arrowleftred2":@"png"]; //  
    self.glarrow = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.glarrow.frame = CGRectMake( 0, 768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ self.glarrow setImage:img  forState:UIControlStateNormal ];
    [ self.glarrow addTarget:self action:@selector(gallerygoleft:) forControlEvents:UIControlEventTouchUpInside ];
    
    //
    //  page control...
    //
    self.pc = [ [ [ UIPageControl alloc ] initWithFrame:CGRectMake(0, 768 - 100, 1024, 100) ] autorelease ];
    self.pc.backgroundColor = [ UIColor darkGrayColor ];
    self.pc.numberOfPages = 10;
    self.pc.userInteractionEnabled = YES;
    self.pc.enabled = YES;
    [ self.pc addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged ];
    self.pc.numberOfPages = num_items;
    self.pc.currentPage = 0;
    [ self.pc sizeToFit ];
    self.pc.frame = CGRectMake( 0, //1024/2.0-self.pc.frame.size.width/2.0, 
                               768-self.pc.frame.size.height-20, 
                               1024, //self.pc.frame.size.width, 
                               self.pc.frame.size.height);

}

-(void) showGallery
{
    [ self.view addSubview:self.gsv ];
    [ self.view bringSubviewToFront:self.gsv];
    [ self.gsv addSubview:self.gtv ];
    [ self.gsv bringSubviewToFront:self.gtv ];
    [ self.view addSubview:self.pc ];
    [ self.view bringSubviewToFront:self.pc];
    [ self.view addSubview:self.grarrow];
    [ self.view bringSubviewToFront:self.grarrow ];
    [ self.view addSubview:self.glarrow];
    [ self.view bringSubviewToFront:self.glarrow ];
    
}

- (void) setupGallery: (NSMutableArray *)arr
{
    int num_items = [ arr count ];
    self.ivs = [ [[ NSMutableArray alloc ] initWithCapacity:num_items ] autorelease ];
    
    for (int i=0;i<num_items;i++)
    {
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(i*1024+20, 20, 1024-40, 768-100) ] autorelease ];
        iv.backgroundColor = [ UIColor whiteColor ];
        iv.contentMode = UIViewContentModeScaleAspectFit;
        [ self.gtv addSubview:iv ];
        [ self.ivs addObject:iv ];
    }
    
}


-(void) doGallery: (UIView *)v
{
    //  Get the gallery image array for this section via hash table...
    enum Section sct = v.tag;
    NSMutableArray *arr = [ self.galleryDCT objectForKey:[ NSNumber numberWithInt:sct ] ];
    self.cur_gallery = arr;
    if (arr)
    {
        int num_items = [ arr count ];
        
        [ self freeGallery ];
        
        [ self createGallery: num_items ];
        
        [ self setupGallery:arr ];
        
        [ self showGallery ];
        
        [ self hideBoard ];
        
        //  Set initial page...
        int vint = (int)v;
        NSString *fullimg = [ self.fullPathDCT objectForKey:[ NSNumber numberWithInt:vint ] ];
        if (fullimg)
        {
            int page = [ arr indexOfObject:fullimg ];
            if ((page>=0)&&(page< num_items))
            {
                self.pc.currentPage = page;
                CGRect rct = CGRectMake(1024*page, 0, 1024, 768);
                [ self.gsv scrollRectToVisible:rct animated:NO ];
            }
            else
            {
                self.pc.currentPage = page;
            }
        }
        
        [ self loadPage ];
        
    }
}
#endif

#pragma mark - fatboy stuff...

#ifdef DO_FATBOY

-(void) createFlipAnimation
{
    //  Flip animation...
    self.flipanimation = [ [ UIImageView alloc ] initWithFrame:CGRectMake(0, 0, 1024, 768) ];
    self.flipanimation.userInteractionEnabled = YES;
    [ self.view addSubview:self.flipanimation ];
    self.flipanimation.hidden = YES;
    self.flipanimation.contentMode = UIViewContentModeScaleAspectFit;
    UITapGestureRecognizer *stap = [[UITapGestureRecognizer alloc] 
            initWithTarget:self action:@selector(animTap:)];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ self.flipanimation addGestureRecognizer:stap ];

}


-(void) animation:(id)obj
{
    if (self.anim_index<0) return;
    
    UIImage *img = [ self.fatboyimgs objectAtIndex:self.anim_index];
    self.flipanimation.image = img;
    self.anim_index += 1;
    if (self.anim_index>=[ self.fatboyimgs count])
    {
        self.anim_index = 0;
    }
    
    [ self performSelector:@selector(animation:) withObject:self afterDelay:0.05 ];
}


-(void) hideFatBoy
{
    self.flipanimation.image = nil;
    self.fatboyimgs = nil;
    [ self.flipanimation removeFromSuperview ];
    self.anim_index = -1;
}

-(void) animTap: (id)sender
{
    [self hideFatBoy];
    
    [ self showBoard ];
}

#endif

#pragma mark - zoom stuff...

#ifdef DO_ZOOM


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
                             self.zoom_view.image = nil;
                             self.zoom_img = nil;
                         }
         ];
        
    }
}


- (void) zoom:(UIView *)gallery_view
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
        
        CGRect rct = CGRectMake(self.sv.contentOffset.x+20, 
                                self.sv.contentOffset.y+20, 
                                1024-40,768-100);
        
        [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.zoom_view.frame = rct;
                             self.top_view.alpha = 0.2;
                         }
                         completion:^(BOOL finished)
         {                                 
             self.zoom_view.frame = rct;
             self.zooming = NO;
             self.sv.scrollEnabled = NO;
             self.top_view.alpha = 0.2;
             
             
#ifdef DO_GALLERY
             if (gallery_view) [ self doGallery:gallery_view ];
#endif
             
         }
         ];
    }
}
#endif


-(void) createZoom
{
    //
    //  Zoom view...
    //
    self.zoom_view = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(0,0,1,1) ] autorelease ];
    self.zoom_view.contentMode = UIViewContentModeScaleAspectFit;
    
    UITapGestureRecognizer *ztap = [ [ [ UITapGestureRecognizer alloc ] 
                                      initWithTarget:self action:@selector(zoom_view_tapped) ] autorelease ];
    [ztap setNumberOfTapsRequired:1];
    [ztap setNumberOfTouchesRequired:1];
    self.zoom_view.userInteractionEnabled = YES;
    [self.zoom_view addGestureRecognizer:ztap];
    [ self.sv addSubview:self.zoom_view ];
    [ self.sv bringSubviewToFront:self.zoom_view ];
}


-(void) zoom_tapped
{
    [ self unzoom ];
}

-(void) hideZoom
{
    self.cur_zoom = nil;
    self.zoom_view.image = nil;
    self.zoom_img = nil;
    self.zoom_view.hidden = YES;
    self.top_view.alpha = 1.0;
    self.sv.scrollEnabled = YES;
}


-(void) doZoom: (UIView *)v: (BOOL)gallery
{
    //  zoom...
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
        [ self zoom:v];
    }
    
}
-(void) zoom_view_tapped
{
    if ( self.cur_zoom != nil )
    {
        [ self unzoom ];
    }
}

#endif

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
    
    //  adjust for dude with tie...
    if ( (sr==0) && (sc==1) && (row==0) && (col== 4))
    {
        x = x + 60;
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
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        
        UIView *pp = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)] autorelease ];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithImage:p ] autorelease ];
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
    }
    
    //  gesture...
    UITapGestureRecognizer *stap = 
        [ [[UITapGestureRecognizer alloc] 
           initWithTarget:self action:@selector(oneFingerOneTap:)] autorelease ];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ v addGestureRecognizer:stap ];
    
    //  map view to section...
    v.tag = sct;    
    if (fullimg)
    {
        long vint = (long)v;
        [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
    }
    
    [ v autorelease ];
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
    
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    [ v setBackgroundColor:[ UIColor whiteColor ] ];
    v.clipsToBounds = NO;
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
               
        UIView *pp = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)] autorelease ];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithImage:p ] autorelease ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        iv.transform = tr;
        
        iv.contentMode = UIViewContentModeScaleAspectFill;
        iv.frame = CGRectMake(0, 0, v.frame.size.width, v.frame.size.height);
        
    }
    
    //  gesture...
    UITapGestureRecognizer *stap = 
     [ [[UITapGestureRecognizer alloc] 
        initWithTarget:self action:@selector(oneFingerOneTap:)] autorelease ];
    [ stap setNumberOfTapsRequired:1];
    [ stap setNumberOfTouchesRequired:1];
    [ v addGestureRecognizer:stap ];
    
    //  map view to section...
    v.tag = sct;
    
    if (fullimg)
    {
        long vint = (long)v;
        [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
    }
    
    [ v autorelease ];
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
#ifdef DO_MOVIES
        //
        //  movie...
        //
        self.fmv = [ [ [ MyMovieView alloc ] 
                    initWithFrame:
                      CGRectMake(x, y, aw, ah):path:2 ] autorelease ];
        self.fmv.section = sct;
        self.fmv.del = self;
        [ self.top_view addSubview:self.fmv ];
#endif
    }
    else if (path)
    {
        UIImage *p = [ UIImage imageNamed:path ];
        
        UIView *pp = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)] autorelease];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithImage:p ] autorelease ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
            
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
        
    }
     
    if (!movie)
    {
        //  gesture...
        UITapGestureRecognizer *stap = 
         [ [[UITapGestureRecognizer alloc] 
            initWithTarget:self action:@selector(oneFingerOneTap:)] autorelease ];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
        if (fullimg)
        {
            long vint = (long)v;
            [ self.fullPathDCT setObject:fullimg forKey:[ NSNumber numberWithLong:vint] ];
        }
    }
    
    [ v autorelease ];
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
    
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    v.clipsToBounds = NO;
    [ v setBackgroundColor:[ UIColor blackColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        
        UIView *pp = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)] autorelease ];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithImage:p ] autorelease ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        iv.transform = tr;
        
        //  gesture...
        UITapGestureRecognizer *stap = 
            [ [[UITapGestureRecognizer alloc] 
               initWithTarget:self action:@selector(oneFingerOneTap:)] autorelease ];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
    }
    else
    {
#ifdef DO_MOVIES
        //
        //  movie...
        //
        self.fmv2 = [ [ [ MyMovieView alloc ] 
                initWithFrame:
                       CGRectMake(x, y, aw, ah):@"Animation_Reel":2 ] autorelease ];
        self.fmv2.section = sct;
        self.fmv2.del = self;
        
        [ self.top_view addSubview:self.fmv2 ];
#endif
    
    }
    
    [ v autorelease ];
    
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
    
    UIView *v = [ [ DropShadowView alloc ] initWithFrame:CGRectMake(x,y,aw,ah) ];
    v.clipsToBounds = NO;
    [ v setBackgroundColor:[ UIColor blackColor ] ];
    
    [ self.top_view addSubview:v ];
    
    if (img)
    {
        UIImage *p = [ UIImage imageNamed:img ];
        
        UIView *pp = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0, 0, v.frame.size.width, v.frame.size.height)] autorelease ];
        [ v addSubview:pp ];
        pp.clipsToBounds = YES;
        
        UIImageView *iv = [ [ [ UIImageView alloc ] initWithImage:p ] autorelease ];
        [ pp addSubview:iv];
        iv.clipsToBounds = YES;
        
        iv.transform = tr;
        
        //  gesture...
        UITapGestureRecognizer *stap = 
         [ [[UITapGestureRecognizer alloc] 
            initWithTarget:self action:@selector(oneFingerOneTap:)] autorelease ];
        [ stap setNumberOfTapsRequired:1];
        [ stap setNumberOfTouchesRequired:1];
        [ v addGestureRecognizer:stap ];
        
        //  map view to section...
        v.tag = sct;
    }
    else
    {
#ifdef DO_MOVIES
        //
        //  movie...
        //
        self.fmv3 = [ [ [ MyMovieView alloc ] 
               initWithFrame:
                       CGRectMake(x, y, aw, ah):@"1new":2 ] autorelease ];
        self.fmv3.section = sct;
        self.fmv3.del = self;
        [ self.top_view addSubview:self.fmv3 ];
#endif

    }
     
    [ v autorelease ];
    
    return v;
}


#pragma mark - init each section...

//  TOP ROW...

-(void) initPeople
{
    float l = 120.0f;
    float t = 120.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile1Aboutus.png" ];
    [ iv setImage:img ];
        
    img = [ UIImage imageNamed:@"Tile1Text5.png" ];
    iv = [ [ UIImageView alloc ] initWithImage:img ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    [ iv setImage:img ];
    iv.frame = CGRectMake(150, 175, iv.frame.size.width, iv.frame.size.height );
    
    [ self singlePic:0 :0 :0 :3 :@"aboutUs01cropped.jpg": @"aboutUs01.jpg":CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:0:0 :0 ];
    [ self singlePic:0 :0 :2 :3 :@"aboutUs08cropped.jpg": @"aboutUs08.jpg": CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :2 :4 :@"aboutUs19cropped.jpg": @"aboutUs19.jpg": CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :2 :5 :@"aboutUs04cropped.jpg": @"aboutUs04.jpg": 
        CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:EXTEND:0 :0];
    [ self singlePic:0 :0 :3 :2 :@"aboutUs02cropped.jpg": @"aboutUs02.jpg": CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :3 :4 :@"aboutUs24cropped.jpg": @"aboutUs24.jpg": CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:0:0 :0];
    [ self singlePic:0 :0 :3 :5 :@"aboutUs15cropped.jpg": @"aboutUs15.jpg": CGAffineTransformMakeTranslation(0.01, 0.01): YES:0:0:EXTEND:0 :0];
    
#ifdef DO_GALLERY
    NSMutableArray *arr = [ [ NSMutableArray alloc ] initWithCapacity: 0 ];
    int max = 27;
    if (MAX_GALLERY>0) max = MAX_GALLERY;
    
    int prefix[7] = {1,8,19,4,2,24,15};
    for (int i=0;i<7;i++)
    {
        NSString *path = [ NSString stringWithFormat:@"aboutUs%02d.jpg", prefix[i] ];
        [ arr addObject:path ];
    }
    
    for (int i=1;i<=max;i++) //27
    {
        NSString *path = [ NSString stringWithFormat:@"aboutUs%02d.jpg", i ];
        if (! [ arr containsObject:path] )
        {
            [ arr addObject:path ];
        }
    }
    [ self.galleryDCT setObject:arr forKey:[ NSNumber numberWithInt:Section_AboutUs ]];
#endif
}


-(void) initIllustration
{
    
    float l = 1024.0 + 350.0f;
    float t = 580.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile2Illustration.png" ];
    [ iv setImage:img ];
    
    /*1.21.2012*/
    //[ self singlePic:0 :1 :0 :4 :@"Tile2Dudecropped.png":@"illustration14.jpg":
    //    CGAffineTransformMakeTranslation(0.01,0.01):
    //    YES :0:0:EXTEND:0 :1];
    [ self singlePic:0 :1 :0 :4 :@"PersonOfInterest1.png":@"bookcover.jpg":
        CGAffineTransformMakeTranslation(0.01,0.01):
                YES :0:0:EXTEND:0 :1];
    
    [ self singlePic:0 :1 :1 :2 :@"Tile2Boatcropped.png":@"illustration06.jpg": 
        CGAffineTransformMakeTranslation(0.01,0.01):
                 YES:0:0:0:0  :1];
    
    /*1.21.2012*/
    //[ self singlePic:0 :1 :1 :3 :@"Tile2Clockcropped.png":@"illustration04.jpg":
    //    CGAffineTransformMakeTranslation(0.01,0.01):
    //             YES:0:0:0:0 :1];
    [ self singlePic:0 :1 :1 :3 :@"Bacardi1.png":@"bacardi_comp.jpg":
        CGAffineTransformMakeTranslation(0.01,0.01):
                 YES:0:0:0:0 :1];
    
    [ self singlePic:0 :1 :2 :4 :@"Tile2Classroomcropped.png":@"illustration03.jpg":
        CGAffineTransformMakeTranslation(0.01,0.01):
                YES :0:0:0:0 :1];
    [ self singlePic:0 :1 :3 :1 :@"Tile2Mnmcropped.png":@"illustration15.jpg":
        CGAffineTransformMakeTranslation(0.01,0.01):
                YES:0:0:0:EXTEND :1];
    
#ifdef DO_GALLERY
    NSMutableArray *arr = [ [ NSMutableArray alloc ] initWithCapacity:0 ];
    int max = 30;
    
    
    /*10.18.2012 */
    max = 17-4;
    
    if (MAX_GALLERY>0) max = MAX_GALLERY;
    
    /* 10.18.2012 */
    [ arr addObject:@"3panelcomic.jpg"];
    [ arr addObject:@"30lympians.jpg"];
    [ arr addObject:@"b&wportrait.jpg"];
    [ arr addObject:@"b&wportrait2.jpg"];
    [ arr addObject:@"babysitter.jpg"];
    [ arr addObject:@"bacardi_comp.jpg"];
    [ arr addObject:@"bookcover.jpg"];
    [ arr addObject:@"hairmagazinespread.jpg"];
    [ arr addObject:@"paperlandscape1.jpg"];
    [ arr addObject:@"paperlandscape2.jpg"];
    [ arr addObject:@"psychomother.jpg"];
    [ arr addObject:@"rain clouds.jpg"];
    [ arr addObject:@"strollerderby.jpg"];
    [ arr addObject:@"Suitcase.jpg"];
    [ arr addObject:@"TullamoreYeats_rev.jpg"];
    [ arr addObject:@"umbrella.jpg"];
    [ arr addObject:@"yellowcomic.jpg"];
    
    
    int prefix[5] = {14,6,4,3,15};
    for (int i=0;i<5;i++)
    {
        NSString *path = [ NSString stringWithFormat:@"illustration%02d.jpg", prefix[i] ];
        [ arr addObject:path ];
    }
    
    for (int i=1;i<=max;i++) //30
    {
        NSString *path = [ NSString stringWithFormat:@"illustration%02d.jpg", i ];
        if (!([arr containsObject:path]))
        {
            [ arr addObject:path ];
        }
    }
    
    /* 10.18.2012 */
    if ( [ arr containsObject:@"illustration11.jpg" ] )
        [ arr removeObject:@"illustration11.jpg" ];
    if ( [ arr containsObject:@"illustration14.jpg" ] )
        [ arr removeObject:@"illustration14.jpg" ];
    if ( [ arr containsObject:@"illustration16.jpg" ] )
        [ arr removeObject:@"illustration16.jpg" ];
    if ( [ arr containsObject:@"illustration22.jpg" ] )
        [ arr removeObject:@"illustration22.jpg" ];
    
    [ self.galleryDCT
        setObject:arr forKey:[ NSNumber numberWithInt:Section_Illustration ] ];
    
    
    
#endif
    
}


-(void) initFilm
{    
    float l = 1024.0*2 + 100.0f;
    float t = 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ] autorelease ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile3Film.png" ];
    [ iv setImage:img ];

    [ self sixByThreePic:0 :2 :1 :0: nil: CGAffineTransformIdentity: YES:  EXTEND:0:0:EXTEND :2];
}

//  MIDDLE ROW...

-(void) initDesign
{
    
    float l = 470.0f;
    float t = 768 + 580.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile4Design.png" ];
    [ iv setImage:img ];
    
    /*1.21.2013*/
    //[ self twoByOnePic:1 :0 :2 :0 :@"Tile4Bryancropped.png":@"design12.jpg":
    //    CGAffineTransformMakeTranslation(0.01, 0.01):
    //        YES :0:0:0:0 :3];
    [ self twoByOnePic:1 :0 :2 :0 :@"AICP1.png":@"AICP_poster_sarah2.jpg":
     CGAffineTransformMakeTranslation(0.01, 0.01):
                  YES :0:0:0:0 :3];
    
    [ self twoByOnePic:1 :0 :3 :0 :@"Tile4Wonderthrillscropped.jpg":@"design06.jpg":
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
                  
#ifdef DO_GALLERY
    //  create the gallery dct...
    NSMutableArray *arr = [ [ NSMutableArray alloc ] initWithCapacity:0 ];
    
    int max = 18;
    /* 10.18.2012 adjustments */
    max = max + 9 - 3;
    
    
    if (MAX_GALLERY>0) max = MAX_GALLERY;
    
    
    [ arr addObject:@"100YSS_posters5_1.jpg"];
    [ arr addObject:@"100YSS_posters7_1.jpg"];
    [ arr addObject:@"100YSS_posters10_1.jpg"];
    [ arr addObject:@"100YSS_posters13_1.jpg"];
    [ arr addObject:@"AICP_poster_sarah2.jpg"];
    [ arr addObject:@"brainspace_infograph_rev2.jpg"];
    [ arr addObject:@"coffee_break.jpg" ];
    [ arr addObject:@"METHDOLODYrev2.jpg" ];
    [ arr addObject:@"track_Record_infograph.jpg" ];
    
    int prefix[3] = {15,12,6};
    for (int i=0;i<3;i++)
    {
        NSString *path = [ NSString stringWithFormat:@"design%02d.jpg", prefix[i] ];
        [ arr addObject:path ];
    }
    
    for (int i=1;i<=18;i++) //18
    {
        NSString *path = nil;
        if (i==7)
            path = [ NSString stringWithFormat:@"design%02d.png", i ];
        else
            path = [ NSString stringWithFormat:@"design%02d.jpg", i ];
        if (!([arr containsObject:path]))
        {
            [ arr addObject:path ];
        }
    }
    
    
    /* adjustments 10.18.2012 */
    if ( [ arr containsObject:@"design02.jpg" ] )
        [ arr removeObject:@"design02.jpg" ];
    if ( [ arr containsObject:@"design03.jpg" ] )
        [ arr removeObject:@"design03.jpg" ];
    if ( [ arr containsObject:@"design06.jpg" ] )
        [ arr removeObject:@"design06.jpg" ];
    
    [ self.galleryDCT setObject:arr forKey:[ NSNumber numberWithInt:Section_Design ] ];
#endif
}


-(void) initHome
{
    
    float w = 300.0;
    float h = 300.0;
    float l = 1024.0/2.0- w/2;
    float t = 768.0/2.0 - h/2;
    l = l + 1024.0;
    t = t + 768.0;
    UIImageView *iv = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(l,t,w,h) ] autorelease ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *img = [ UIImage imageNamed:@"THESTUDIO_with_logo_RED_withman.png" ];
    [ iv setImage:img ];
    [ self.top_view addSubview:iv ];
    
    float ox = 1024.0;
    float oy = 768.0;
    
    //  Right arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowrightred2.png"];
    self.rarr = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.rarr.frame = CGRectMake(ox + 1024-img.size.width, oy + 768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ self.rarr setImage:img  forState:UIControlStateNormal ];
    [ self.rarr addTarget:self action:@selector(goright:) forControlEvents:UIControlEventTouchUpInside ];
    [ self.top_view addSubview:self.rarr ];
    
    //  Left arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowleftred2.png"];
    self.larr = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.larr.frame = CGRectMake(ox + 0, oy + 768/2.0-img.size.height/2.0, 
                              img.size.width, img.size.height);
    [ self.larr setImage:img  forState:UIControlStateNormal ];
    [ self.larr addTarget:self action:@selector(goleft:) forControlEvents:UIControlEventTouchUpInside ];
    [ self.top_view addSubview:self.larr ];
    
    //  Down arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowdownred2.png"];
    self.barr = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.barr.frame = CGRectMake(ox + 1024/2.0-img.size.width/2.0, oy + 768-img.size.height, 
                              img.size.width, img.size.height);
    [ self.barr setImage:img  forState:UIControlStateNormal ];
    [ self.barr addTarget:self action:@selector(godown:) forControlEvents:UIControlEventTouchUpInside ];
    [ self.top_view addSubview:self.barr ];
    
    //  Left arrow...
    img = [ UIImage imageNamed:@"Tile5Arrowupred2.png"];
    self.tarr = [UIButton buttonWithType:UIButtonTypeCustom ];
    self.tarr.frame = CGRectMake(ox + 1024/2.0-img.size.width/2.0, oy + 0, 
                              img.size.width, img.size.height);
    [ self.tarr setImage:img  forState:UIControlStateNormal ];
    [ self.tarr addTarget:self action:@selector(goup:) forControlEvents:UIControlEventTouchUpInside ];
    [ self.top_view addSubview:self.tarr ];
}


-(void) initPreproduction
{
    
    float l = 1024.0*2 + 180.0f;
    float t = 768.0 + 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ] autorelease ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile6Preproduction.png" ];
    [ iv setImage:img ];
    
    [ self fourByTwoPic:1:2:1:1:YES:@"Cinematic.AnimaticReel":nil:CGAffineTransformIdentity:YES :0:0:0:0 :5];
    
}



//  BOTTOM ROW...

-(void) initCharacterDev
{
    
    float l = 0 + 680.0f;
    float t = 768.0*2 + 384.0f;
    float w = 250.0;
    float h = 100.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile7Characterdevelopment.png" ];
    [ iv setImage:img ];
    
    [ self singlePic:2 :0 :0 :2 :@"Tile7Maestrocropped2.jpg":@"charDev12.jpg":
        CGAffineTransformMakeTranslation(0.01, 0.01):
                 YES:0:EXTEND:0:0 :6];
    [ self singlePic:2 :0 :3 :4 :@"Tile7Kimonocropped.png":@"charDev15.jpg":
        CGAffineTransformMakeTranslation(0.01, 0.01):
                 YES:0:0:0:0 :6];
#ifdef FATBOY
    self.fatboy =  
#else
    /*1.21.2013*/
    //[ self fourByTwoPic:2:0:1:0:NO:@"charDev01.jpg":@"charDev01.jpg":CGAffineTransformMakeTranslation(0.01, 0.01):YES  :0:0:0:0 :6];
    [ self fourByTwoPic:2:0:1:0:NO:@"Ransom_cast1.png":@"Ransom_cast.jpg":CGAffineTransformMakeTranslation(0.01, 0.01):YES  :0:0:0:0 :6];
    
#endif
    
#ifdef DO_GALLERY
    NSMutableArray *arr = [ [ NSMutableArray alloc ] initWithCapacity:0 ];
    int max = 22;
    if (MAX_GALLERY>0) max = MAX_GALLERY;
    
    /* adjustments 10.18.2012 */
    [ arr addObject:@"Ransom_cast.jpg" ];
    [ arr addObject:@"tech_girl.jpg" ];
    
    
#ifdef FATBOY
    int prefix[2] = {12,15};
    for (int i=0;i<2;i++)
    {
#else
    int prefix[3] = {12,1,15};
    for (int i=0;i<3;i++)
    { 
#endif
        NSString *path = [ NSString stringWithFormat:@"charDev%02d.jpg", prefix[i] ];
        [ arr addObject:path ];
    }
    
    for (int i=1;i<=max;i++) //22
    { 
        NSString *path = [ NSString stringWithFormat:@"charDev%02d.jpg", i ];
        if (!([arr containsObject:path]))
        {
            [ arr addObject:path ];
        }
    }
    
    /* adjustments 10.18.2012 */
    if ( [ arr containsObject:@"charDev04.jpg" ] )
        [ arr removeObject:@"charDev04.jpg" ];
    if ( [ arr containsObject:@"charDev09.jpg" ] )
            [ arr removeObject:@"charDev09.jpg" ];
    
    
    [ self.galleryDCT setObject:arr forKey:[ NSNumber numberWithInt:Section_CharacterDevelopment ] ];
#endif
    
}


-(void) initAnimation
{
    
    float l = 1024.0*1 + 180.0f;
    float t = 768.0*2 + 130.0f;
    float w = 200.0;
    float h = 50.0;
    UIImageView *iv = [ [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ] autorelease ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile8Animation.png" ];
    [ iv setImage:img ];
    
    [ self sixByTwoPic:2 :1 :1 :0  :nil:CGAffineTransformIdentity:YES  :EXTEND:0:EXTEND:0  :7];
}


-(void) initStoryboard
{    
    float l = 1024.0*2 + 475.0f;
    float t = 768.0*2 + 389.0f;
    float w = 300.0;
    float h = 100.0;
    UIImageView *iv = [ [ UIImageView alloc ] initWithFrame:CGRectMake(l, t, w, h) ];
    iv.contentMode = UIViewContentModeScaleAspectFit;
    [ self.top_view addSubview:iv ];
    UIImage *img = [ UIImage imageNamed:@"Tile9Storyboards.png" ];
    [ iv setImage:img ];
    
    /*1.21.2013*/
    //[ self twoByOnePic:2:2:0:3  :@"Tile9Redcropped.png":@"SB_Concepts04.jpg":
    //    CGAffineTransformMakeTranslation(0.01,0.01):
    //    YES :0:EXTEND:0:0 :8];
    [ self twoByOnePic:2:2:0:3  :@"Chase1.png":@"OverdraftFees05.jpg":
     CGAffineTransformMakeTranslation(0.01,0.01):
                  YES :0:EXTEND:0:0 :8];
    
    [ self twoByOnePic:2:2:1:3  :@"Tile9Bikescropped.png":@"SB_Concepts08.jpg": 
     CGAffineTransformMakeTranslation(0.01,0.01): 
        YES :0:0:0:0 :8];
    
    /*1.21.2013*/
    //[ self twoByOnePic:2:2:2:1  :@"Tile9Drapercropped.png":@"SB_Concepts21.jpg":
    //    CGAffineTransformMakeTranslation(0.01,0.01):
    //    YES :0:0:0:0 :8];
    [ self twoByOnePic:2:2:2:1  :@"Ted1.png":@"ted.jpg":
     CGAffineTransformMakeTranslation(0.01,0.01):
                  YES :0:0:0:0 :8];
    
    /*1.21.2013*/
    //[ self twoByOnePic:2:2:3:1  :@"Tile9Sariscropped.png":@"SB_Concepts29.jpg":
    //    CGAffineTransformMakeTranslation(0.01,0.01):
    //    YES :0:0:0:0 :8];
    [ self twoByOnePic:2:2:3:1  :@"Verizon1.png":@"ring_family_rev2.jpg":
     CGAffineTransformMakeTranslation(0.01,0.01):
                  YES :0:0:0:0 :8];
    
#ifdef DO_GALLERY
    NSMutableArray *arr = [ [ NSMutableArray alloc ] initWithCapacity: 0 ];
    int max = 29;
    
    /*10.18.2012*/
    max = max + 14;
    
    if (MAX_GALLERY>0) max = MAX_GALLERY;
    
    
    /*10.18.2012*/
    [ arr addObject:@"airplane.jpg"];
    [ arr addObject:@"comedyclub.jpg"];
    [ arr addObject:@"director.jpg"];
    [ arr addObject:@"forest.jpg"];
    [ arr addObject:@"greenscreen.jpg"];
    [ arr addObject:@"HeyMS15.jpg"];
    [ arr addObject:@"holidays05_rev.jpg"];
    [ arr addObject:@"ifweleavenow04.jpg"];
    [ arr addObject:@"ifweleavenow09.jpg"];
    [ arr addObject:@"OverdraftFees05.jpg"];
    [ arr addObject:@"ring_family_rev2.jpg"];
    [ arr addObject:@"tank_woman.jpg"];
    [ arr addObject:@"ted.jpg"];
    [ arr addObject:@"womanbeach.jpg"];
    
    int prefix[4] = {4,8,21,29};
    for (int i=0;i<4;i++)
    {
        NSString *path = [ NSString stringWithFormat:@"SB_Concepts%02d.jpg", prefix[i] ];
        [ arr addObject:path ];
    }
    
    for (int i=1;i<=45;i++) //29
    {
        NSString *path = [ NSString stringWithFormat:@"SB_Concepts%02d.jpg", i ];
        if (!([arr containsObject:path]))
        {
            [ arr addObject:path ];
        }
    }
    [ self.galleryDCT
        setObject:arr forKey:[ NSNumber numberWithInt:Section_Storyboarding ] ];
    
#endif
}


-(void) initMenu
{
    UIImage *img = [ UIImage imageNamed:@"Tile5Redarrow2.png" ]; 
    self.menu_tag = [ UIButton buttonWithType:UIButtonTypeCustom ];
    [ self.menu_tag addTarget:self action:@selector(toggleMenu:) forControlEvents:UIControlEventTouchUpInside ];
    self.menu_tag.frame = CGRectMake(1024-img.size.width+28, 768.0/2.0 - 350, img.size.width, img.size.height );
    [ self.menu_tag setImage:img forState:UIControlStateNormal ];
    [ self.view addSubview:self.menu_tag ];
    
    
    img = [ UIImage imageNamed:@"Tile5Menu_Background2.png" ];
    self.menu = [ [ [ UIView alloc] initWithFrame:CGRectMake(1024-img.size.width+8, 768.0/2.0 - 200, 
                                                              img.size.width, img.size.height ) ] autorelease ];
    [ self.view addSubview:self.menu ]; 
    
    
    UIImageView *bgview = [ [ [ UIImageView alloc] 
                             initWithFrame:CGRectMake(0, 0, 
                        img.size.width, img.size.height ) ] autorelease ];
    [ bgview  setImage:img ];
    [ self.menu addSubview:bgview ];
    
    float ox = 45;
    float oy = 40;
    float spacing = 25.0;
    img = [ UIImage imageNamed:@"Tile5Menu_content2.png" ];
    UIButton *button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    [ self.menu addSubview:button ];
    oy += spacing + 20 + img.size.height;
    
    ox = ox - 22;
    img = [ UIImage imageNamed:@"Tile5Menu_Thestudio2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Home;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Thestudiored2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Illustration2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Illustration;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Illustrationred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    
    img = [ UIImage imageNamed:@"Tile5Menu_Animation2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Animation;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Animationred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Preproduction2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Preproduction;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Preproductionred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Film2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_Film;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Filmred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Characterdevelopment2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.tag = Section_CharacterDevelopment;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Characterdevelopmentred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Design2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    button.tag = Section_Design;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Designred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Aboutus2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    button.tag = Section_AboutUs;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Aboutusred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    oy += spacing + img.size.height;
    
    img = [ UIImage imageNamed:@"Tile5Menu_Storyboards2.png" ];
    button = [ UIButton buttonWithType:UIButtonTypeCustom ];
    button.frame = CGRectMake(ox, oy, img.size.width, img.size.height );
    button.tag = Section_Storyboarding;
    [ button addTarget:self action:@selector(menuClicked:) forControlEvents:UIControlEventTouchUpInside ];
    [ button setImage:img forState:UIControlStateNormal ];
    img = [ UIImage imageNamed:@"Tile5Menu_Storyboardsred2.png" ];
    [ button setImage:img forState:UIControlStateHighlighted ];
    [ self.menu addSubview:button ];
    
    self.menu.hidden = YES;
}

#pragma mark - View lifecycle

-(void)viewDidUnload
{
    [ super viewDidUnload ];
    
#ifdef SHOW_DEBUG
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"UnLoad Warning" 
                                                    message:@"View Unloaded" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
#endif
}

#pragma mark - board stuff...


-(void) handleBleed: (enum Section)sct
{
    [ self gotoSection:sct :YES ];
}

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
                             self.menu.hidden = YES;
                         }
         ];
    }
    else
    {
        self.menu.hidden = NO;
        [UIView animateWithDuration:0.3
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseIn
                         animations:^{
                             self.menu.frame = CGRectMake(1024 - self.menu.frame.size.width + 8, self.menu.frame.origin.y, 
                                                          self.menu.frame.size.width, self.menu.frame.size.height);
                         }
                         completion:^(BOOL finished){
                             self.menu.frame = CGRectMake(1024 - self.menu.frame.size.width + 8, self.menu.frame.origin.y, 
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
    [ self toggleMenu:nil ];
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
    if (scrollView==self.sv)
    {
#ifdef DO_MOVIES
        //  Stop any movies...
        [ self stopMovies ]; 
#endif
        //
        //  Figure out the section we are in...
        //
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
        
        //  
        //  Show arrows if in home section...
        //
        if (self.section == Section_Home )
        {
            [ self arrowState:YES ];
        }
        else
        {
            [ self arrowState:NO ];
        }
    }
#ifdef DO_GALLERY
    else if (scrollView==self.gsv)
    {
        //
        //  Figure out the gallery page we are in...
        //
        int which_page = 0;
        CGPoint pt = CGPointMake(self.gsv.contentOffset.x + 1024/2.0, 768/2.0);
        for ( int i=0;i<self.pc.numberOfPages; i++)
        {
            CGRect rect = CGRectMake(1024*i, 0, 1024, 768 );
            
            if ( CGRectContainsPoint(rect,pt ) )
            {
                which_page = i;
                self.pc.currentPage =which_page;
                break;
            }
        }
     
        
        //  Load the right images...
        [ self loadPage ];
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

-(void) oneFingerOneTap: (UIGestureRecognizer *)g
{
    UIView *v = g.view;
    
    //  See if we need to handle bleed...
    enum Section nsct= v.tag;
    enum Section osct = self.section;
    //int vint = (int)v;
    if ( osct != nsct)
    {
        [ self handleBleed:nsct ];
    }
#ifdef FATBOY
    else if ( vint == (int)self.fatboy ) // fatboy anim...
    {
        if ( !self.fatboyimgs )
        {
            self.fatboyimgs = [ [ NSMutableArray alloc ] initWithCapacity:0 ];
            for (int i=0;i< ([ self.fatboys count ]);i++)
            {
                NSString *path = [ self.fatboys objectAtIndex:i] ;
                NSLog(@"path=%@",path);
                UIImage *img = [ UIImage imageNamed:path ];
                [ self.fatboyimgs addObject:img ];
            }
        }
        self.anim_index = 0;
        self.flipanimation.hidden = NO;
        [ self.view addSubview:self.flipanimation ];
        
        [ self.sv removeFromSuperview ];
        [ self.menu removeFromSuperview ];
        [ self.menu_tag removeFromSuperview ];
        
        [ self animation: nil];
    }
#endif
    else
    {
#ifdef DO_ZOOM
        [ self doZoom:v:YES ];
#else
#ifdef DO_GALLERY
        [ self doGallery:v ];
#endif
#endif
    }
}




-(void) blink: (BOOL)again
{
    self.blinking = YES;
#if 1
    [UIView animateWithDuration:0.3
                          delay: 1.0
                        options: UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.larr.alpha = 0.0;
                         self.barr.alpha = 0.0;
                         self.rarr.alpha = 0.0;
                         self.tarr.alpha = 0.0;
                     }
                     completion:^(BOOL finished)
     {
         self.larr.alpha = 1.0;
         self.barr.alpha = 1.0;
         self.rarr.alpha = 1.0;
         self.tarr.alpha = 1.0;
         
         if (again)
         {
             [ self blink: NO];
         }
         else
         {
             self.blinking = NO;
         }
     }
     ];
#endif
}


-(void) hideBoard
{
    //  remove app views...
    [ self.sv removeFromSuperview ];
    [ self.menu removeFromSuperview ];
    [ self.menu_tag removeFromSuperview ];
}


-(void) showBoard
{
    //  Add board back...
    [ self.view addSubview:self.sv ];
    [ self.view addSubview:self.menu ];
    [ self.view addSubview:self.menu_tag ];
}


-(void) gotoSection:(enum Section)sct:(BOOL)anim
{
    if ( self.gotoing )
    {
        return;
    }
    else
    {
#ifdef DO_MOVIES
        [ self stopMovies ];
#endif
        
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


-(void) fixBleeds
{
    UIView *v = [ [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2 - 50,768, 50,50 ) ] autorelease ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
    v = [ [ [ UIView alloc ] initWithFrame:CGRectMake(1024,768*2-50, 50,50 ) ] autorelease ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
    v = [ [ [ UIView alloc ] initWithFrame:CGRectMake(1024*2-50,768*2-50, 50,50 ) ] autorelease ];
    v.backgroundColor = [ UIColor whiteColor ];
    [ self.top_view addSubview:v ];
    
}


- (void) createBoard
{
    //
    //  Create scroll view...
    //
    self.sv = [ [ [ MyScrollView alloc ] initWithFrame:CGRectMake(0,0,1024,768) ] autorelease ];
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
    self.top_view = [ [ [ UIView alloc ] initWithFrame:CGRectMake(0,0,1024*3,768*3) ] autorelease ];
    //self.top_view.backgroundColor = [ UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0 ];
    [ self.sv addSubview:self.top_view ];
    

    
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



#pragma mark - movie stuff...

#ifdef DO_MOVIES

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

-(void) stopMovies
{
    [ self.fmv stop ];
    [ self.fmv2 stop ];
    [ self.fmv3 stop ];    
}
#endif

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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate *app = ( AppDelegate *) [ [ UIApplication sharedApplication ] delegate ];
    [ app SetMainVC:self ];
    
    //  Some mapping dcts...
    self.fullPathDCT = [ [ [ NSMutableDictionary alloc ] initWithCapacity: 0 ] autorelease ];
    
#ifdef DO_GALLERY
    self.galleryDCT = [ [ [ NSMutableDictionary alloc ] initWithCapacity: 0 ] autorelease ];
#endif
    
    //  Create the board...
    [ self createBoard ];
    
#ifdef DO_ZOOM
    //  Create the zoom...
    [ self createZoom ];
#endif
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
 
    if (!self.blinking)
    {
        [ self blink: YES];
    }
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

}


@end
