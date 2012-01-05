//
//  ZoomPicViewDelegate.h
//  studioapp
//
//  Created by George Williams on 12/5/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


enum Section 
{
    AboutUs = 0,
    Illustration,
    Film,
    Design,
    Home,
    Preproduction,
    CharacterDevelopment,
    Animation,
    Storyboarding
};

@protocol ZoomPicViewDelegate <NSObject>

-(void) section_goto:(enum Section)sct;

@end
