//
//  MyScrollView.m
//  studioapp
//
//  Created by George Williams on 12/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

//@synthesize del=_del; 

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) 
    {
        // Initialization code
    }
    return self;
}

/*
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSSet *allTouches = [event allTouches]; 
    //NSInteger count = [ allTouches count ];
    
    for (UITouch *touch in touches) 
    {
        //if (touch.tapCount >= 2) 
        //{
        if (self.del!=nil)
        {
            [ self.del TouchBegan:touch.tapCount ];
        }
        //}
    }
    
    
#if 0
    for (int i=0;i< [event allTouches];i++)
    {
        
        if (self.del!=nil)
        {
            [ self.del TouchBegan:count ];
        }
    if ( [ allTouches count] >= 2 )
    {
        self.pagingEnabled = YES;
    }
    else
    {
        self.pagingEnabled = NO;
    }
#endif
}
*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
