//
//  ViewController.m
//  VideoTest
//
//  Created by George Williams on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#import <mach/mach.h>

@implementation ViewController

@synthesize player=_player;
@synthesize playerItem=_playerItem;
@synthesize playButton=_playButton;
@synthesize playerView=_playerView;
@synthesize loadButton=_loadButton;
@synthesize stopButton=_stopButton;


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
    // Release any cached data, images, etc that aren't in use.
    
    [ self report_memory ];
}

- (void)syncUI 
{
#if 0
    if ((self.player.currentItem != nil) &&
        ([self.player.currentItem status] == AVPlayerItemStatusReadyToPlay)) {
        self.playButton.enabled = YES;
    }
    else {
        self.playButton.enabled = NO;
    }
#endif
}

- (IBAction)loadAssetFromFile:sender {
    
    NSString *internalPath = [[NSBundle mainBundle] 
                              pathForResource:@"FILM_REEL" ofType: @"mov"];
    NSURL *internalURL = [NSURL fileURLWithPath: internalPath];
    
    self.playerItem = [[AVPlayerItem alloc] initWithURL:internalURL];
    
#if 0
    self.player = [[AVPlayer alloc] initWithPlayerItem:self.playerItem];
#endif
    
#if 0
    self.playerView = [ [PlayerView alloc ] initWithFrame:
                       CGRectMake(0,200, 320,280) ];
    [ self.view addSubview:self.playerView ];
    [ self.playerView setPlayer:self.player ];
#endif
}

- (IBAction)play:sender {
    [self.player play];
}


- (IBAction)stop:sender {
#if 0
    [ self.player pause ];
#endif
#if 0
    [ self.playerView removeFromSuperview ];
    [ self.playerView setPlayer:nil];
#endif
    [ self.playerItem release ];
#if 0
    [ self.player release ];
#endif
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self syncUI];
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
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
