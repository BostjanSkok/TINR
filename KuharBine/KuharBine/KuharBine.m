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
        
        //self.isFixedTimeStep = NO;
        
       
       // [self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
        
       // stateStack = [[NSMutableArray alloc] init];
        
        //[SoundEngine initializeWithGame:self];
        
        //progress = [[GameProgress loadProgress] retain];
    }
    return self;
}
    
    - (void)drawWithGameTime:(GameTime *)gameTime {
        [self.graphicsDevice clearWithColor:[Color cornflowerBlue]];
        
        [super drawWithGameTime:gameTime];
    }


@end
