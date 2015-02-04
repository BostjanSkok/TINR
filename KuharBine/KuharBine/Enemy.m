//
//  Enemy.m
//  KuharBine
//
//  Created by TestM on 2/3/15.
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
        width = 10;
        height =30;
        enemyType = arc4random_uniform(4);
        rail=-1;
        
        
    }
    return self;
}
@synthesize position, velocity,width,height,enemyType,remove,rail;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}

-(void) collidedWithItem:(id)item{
    remove=true;
  /*  if(item==self || isMoving)
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
