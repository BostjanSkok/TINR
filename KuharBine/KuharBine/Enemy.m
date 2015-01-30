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
        mass = 20;
        radius = 30;
    }
    return self;
}
@synthesize position, velocity;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}


@end
