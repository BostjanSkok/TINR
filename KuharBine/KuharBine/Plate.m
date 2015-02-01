//
//  Plate.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Plate.h"

@implementation Plate

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        targetPosition = [[Vector2 alloc] init];
        width = 30;
        height = 1;
        rail=-1;
    }
    return self;
}

@synthesize position, velocity,width,height,over, under,rail;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}

-(void) collidedWithItem:(id)item{
   // [self resetVelocity];
    over = item;
    
}

@end
