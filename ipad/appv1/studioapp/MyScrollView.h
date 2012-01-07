//
//  MyScrollView.h
//  studioapp
//
//  Created by George Williams on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MyScrollView.h"

@protocol MyScrollViewDelegate <NSObject>

-(void) TouchBegan: (int)num;

@end

@interface MyScrollView : UIScrollView

//@property (strong, nonatomic) id<MyScrollViewDelegate> del;

@end
