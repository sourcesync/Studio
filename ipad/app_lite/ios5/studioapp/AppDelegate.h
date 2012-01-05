//
//  AppDelegate.h
//  studioapp
//
//  Created by George Williams on 12/3/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (assign) BOOL gotohome;
@property (strong, nonatomic) IBOutlet UIStoryboard *stb;
@property (strong, nonatomic) ViewController *vc;

@end
