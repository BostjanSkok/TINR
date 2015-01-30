//
//  KuharBine.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "KuharBine.h"


@implementation KuharBine

-(instancetype)init{
    self =[super init];
    if(self){
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];
    }
    return self;
}
    
    - (void)drawWithGameTime:(GameTime *)gameTime {
        [self.graphicsDevice clearWithColor:[Color cornflowerBlue]];
        
        [super drawWithGameTime:gameTime];
    }


@end
