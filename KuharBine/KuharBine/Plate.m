//
//  Plate.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Plate.h"
#import "Namespace.KuharBine.h"

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
        isTop =true;
        isMoving=false;
    }
    return self;
}

@synthesize position, velocity,width,height,over, under,rail,targetPosition;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}


- (void) snapToTarget {
    if(!isMoving)
        return;
    if( ABS(position.x - targetPosition.x) < [Constants deltaX] ){
        if( ABS( position.y - targetPosition.y) < [Constants deltaY] ){
            [velocity set:[Vector2 zero]];
            [position set:targetPosition];
            [targetPosition set:[Vector2 zero]];
            isMoving=false;
        }
    }
    
}

-(void) collidedWithItem:(id)item{
   // [self resetVelocity];

    if(isTop && !isMoving){
        isTop=false;
    over = item;
    }
}

@end
