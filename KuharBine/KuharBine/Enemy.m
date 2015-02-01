//
//  Enemy.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Enemy.h"
#import "Namespace.KuharBine.h"

@implementation Enemy

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        targetPosition = [[Vector2 alloc] init];
        width = 10;
        height =30;
        enemyType = arc4random_uniform(4);
        isMoving=false;
        
    }
    return self;
}
@synthesize position, velocity,width,height,enemyType,over,under,rail,targetPosition;

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
    if(item==self || isMoving)
        return;
    if(under== nil){
        [self resetVelocity];
        isTop=true;
        under = item;
        over =nil;
    }else if(isTop && over == nil)
    {
        isTop=false;
        over= item;
    }
}


@end
