//
//  Enemy.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "EnemyStacked.h"
#import "Namespace.KuharBine.h"

@implementation EnemyStacked

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        targetPosition = [[Vector2 alloc] init];
        width = 10;
        height =30;
        toRemoveWithPoints =false;
        isMoving=false;
        enemyTypeToAdd=-1;
        step=0;
        isTop=false;
    }
    return self;
}
@synthesize position, velocity,width,isTop,height,enemyType,over,under,rail,targetPosition,isMoving,toRemoveWithPoints,enemyTypeToAdd,step;

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
                NSObject *stackedItem = under;
                while (![stackedItem isKindOfClass:[Plate class]] || stackedItem==nil) {
                    stackedItem = ((EnemyStacked*)stackedItem).under;
                }
                if(stackedItem!=nil){
                    ((Plate*)stackedItem).flipFinished=true;
                }
            }
        }
    }
    
}

-(void) collidedWithItem:(id)item{
    if(isTop && [item isKindOfClass:[Enemy class]] ){
        id<IEnemy> enemyItem = [item conformsToProtocol:@protocol(IEnemy) ] ? item: nil;
        if(enemyItem.enemyType == enemyType){
            toRemoveWithPoints= true;
        }else{
            enemyTypeToAdd = enemyItem.enemyType;
        }
    }
   /* if(item==self || isMoving)
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
    }*/
}


@end
