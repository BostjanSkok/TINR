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
        width = 2;
        height = 1;
        rail=-1;
        isTop =true;
        isMoving=false;
        flipFinished=false;
        enemyTypeToAdd=-1;
        toRemoveWithPoints=false;
        step=0;
    }
    return self;
}

@synthesize position, velocity,width,isTop,height,over,isMoving, under,rail,targetPosition,flipFinished,enemyTypeToAdd,toRemoveWithPoints,step;

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
            
            if(isTop)
            {
                flipFinished=true;
            }
        }
    }
    
}

-(void) collidedWithItem:(id)item{
   // [self resetVelocity];
    if(isTop && [item isKindOfClass:[Enemy class]] ){
        id<IEnemy> enemyItem = [item conformsToProtocol:@protocol(IEnemy) ] ? item: nil;
            enemyTypeToAdd = enemyItem.enemyType;
        isTop=false;
    }
      /*  if(isTop && !isMoving){
        isTop=false;
    over = item;
    }*/
}

@end
