//
//  MyMovieView.m
//  studioapp
//
//  Created by George Williams on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <CoreMedia/CMTime.h>

#import "MyMovieView.h"
#import "AVPlayerDemoPlaybackView.h"
#import "ViewController.h"
//#import "CoreMedia.h"

@implementation MyMovieView

//  movies...
@synthesize player=_player;
@synthesize av=_av;
@synthesize tap=_tap;
@synthesize playing=_playing;
@synthesize movie=_movie;
//@synthesize section=_section;
//@synthesize vparent=_vparent;
//@synthesize delegate=_delegate;
@synthesize offset=_offset;
@synthesize playv=_playv;
@synthesize moviePlayer=_moviePlayer;
@synthesize del=_del;
@synthesize section=_section;

- (BOOL) handleBleed
{
    if (self.del)
    {
        BOOL handled = [ self.del movieHandleBleed:self.section ];
        return handled;
    }
    else
    {
        return NO;
    }
    
#if 0
    ViewController *vc = (ViewController *)self.vparent;
    if ( self.section != vc.section )
    {
        if ( self.delegate != nil )
        {
            [ self.delegate section_goto:self.section ];
        }
        return YES;
    }
    else
    {
        return NO;
    }
#endif
}

#if 1

- (void) load
{
    //  Get splash screen resource as url...
    //NSString *internalPath = [[NSBundle mainBundle] pathForResource: @"gunhill" ofType: @"mp4"];
    NSString *internalPath = [[NSBundle mainBundle] 
                              pathForResource: self.movie ofType: @"mov"];
    NSURL *internalURL = [NSURL fileURLWithPath: internalPath];
    
    //  Create/set player...
    self.av =  [ [ AVPlayer alloc] initWithURL:internalURL ];
    //[self.av autorelease];
    
    [ self.player setPlayer:self.av ]; 
    //[ self.av play ];
    //[ self.av pause ];
    
    if (self.offset>0 )
    {
        CMTime time1 = CMTimeMake(self.offset, 4);
        [ self.av seekToTime:time1 ];
    }
}

- (void) play
{
    if (self.playing)
    {
        return;
    }
    else
    {

        [ self.av play ]; 

        
        self.playing = YES;
        self.playv.hidden = YES;
    }
}


-(void) pause
{
}

-(void) stop
{
    if (!self.playing)
    {
        return;
    }
    else
    {
        
        self.playing = NO;
   
        [ self.av pause ];
        if (self.offset>0 )
        {
            CMTime time1 = CMTimeMake(self.offset, 4);
            [ self.av seekToTime:time1 ];
        }

        
         
        self.playv.hidden = NO;
         
    }
     
}

- (void) oneFingerTwoTaps
{

    if ([ self handleBleed ])
    {
        return;
    }
    else
    {
        if (self.playing)
        {
            [self stop];
        }
        else
        {
            [self play];
        }
    }
}



- (id)initWithFrame:(CGRect)frame:(NSString *)mv:(int)offset
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        self.movie = mv;
        self.offset = offset;
        self.playing = NO;
    
        self.player = [ [ AVPlayerDemoPlaybackView alloc ] 
                       initWithFrame:                       
                       CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [ self addSubview:self.player ];

        
        
        //  Tap gesture...
        self.tap = 
            [[UITapGestureRecognizer alloc] initWithTarget:self 
                                                    action:@selector(oneFingerTwoTaps)];;
        // Set required taps and number of touches
        [self.tap setNumberOfTapsRequired:1];
        [self.tap setNumberOfTouchesRequired:1];
        //[ self addGestureRecognizer:self.tap];
        
        [ self.player addGestureRecognizer:self.tap ];
        
        [self load];
        
        //  Play button...
        UIImage *img = [ UIImage imageNamed:@"Tile8Playbutton.png" ];
        float w = img.size.width;
        float h = img.size.height;
        CGRect rect = CGRectMake( frame.size.width/2.0, frame.size.height/2.0, w, h ); //frame.size.width, frame.size.height );
        self.playv = [ [ UIImageView alloc] initWithFrame:rect ];
        [ self.playv setImage:img ];
        [ self addSubview:self.playv ];
        
        //self.backgroundColor = [ UIColor blueColor ];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#endif

@end
