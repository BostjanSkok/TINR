//
//  Enemy.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy

- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        targetPosition = [[Vector2 alloc] init];
        width = 30;
        height = 30;
        enemyType = arc4random_uniform(4);
        
    }
    return self;
}
@synthesize position, velocity,width,height,enemyType,over,under;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}
-(void) collidedWithItem:(id)item{
    if(under== nil){
        [self resetVelocity];
        under = item;
    }else if(over == nil)
    {
        over= item;
    }
}


@end
