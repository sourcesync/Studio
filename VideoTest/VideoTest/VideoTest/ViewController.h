//
//  ViewController.h
//  VideoTest
//
//  Created by George Williams on 1/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

#import "PlayerView.h"

//@class PlayerView;

@interface ViewController : UIViewController 
{
}

@property (nonatomic, retain) AVPlayer *player;
@property (retain) AVPlayerItem *playerItem;
@property (nonatomic, retain) IBOutlet PlayerView *playerView;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *loadButton;
@property (nonatomic, retain) IBOutlet UIButton *stopButton;
- (IBAction)loadAssetFromFile:sender;
- (IBAction)play:sender;
- (IBAction)stop:sender;
- (void)syncUI;

@end
