//
//  AppDelegate.m
//  studioapp
//
//  Created by George Williams on 1/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize vc=_vc;

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App Low Memory" 
                                                    message:@"App Low Memory" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];

}

-(void) lowMemNotification:(id)obj
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"App Low Memory" 
                                                    message:@"App Low Memory" 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                            selector:@selector(lowMemNotification:)
                                            name: UIApplicationDidReceiveMemoryWarningNotification 
                                            object:nil];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    if ( self.vc != nil )
    {
        [ self.vc galleryTap:nil ];
        
        [ self.vc gotoSection:Section_Home :NO ];
        if ( !self.vc.blinking )
        {
            self.vc.larr.hidden = NO;
            self.vc.rarr.hidden = NO;
            self.vc.barr.hidden = NO;
            self.vc.tarr.hidden = NO;
            [ self.vc blink:YES ];
        }
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}
 

-(void) SetMainVC:(ViewController *)vc
{
    self.vc = vc;
}


@end
