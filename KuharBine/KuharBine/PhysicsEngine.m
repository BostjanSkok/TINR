//
//  PhysicsEngine.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "PhysicsEngine.h"
#import "Express.Physics.h"
#import "Namespace.KuharBine.h"

@implementation PhysicsEngine


- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
    if (self = [super initWithGame:theGame]) {
        level = theLevel;
    }
    return self;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    // First we apply friction to the puck and move it.
   /* 	float puckSpeed = [level.puck.velocity length];
     if (puckSpeed) {
     float newSpeed = puckSpeed * (1 - [Constants puckFriction]);
     float maxSpeed = [Constants puckMaximumSpeed];
     if (newSpeed > maxSpeed) {
     newSpeed = maxSpeed;
     }
     [[level.puck.velocity normalize] multiplyBy:newSpeed];
     /}
    if(level.puck.velocity.y==0 && level.puck.position.y<261)
     level.puck.velocity.y=60;
     if(level.puck.position.y>261 && level.puck.velocity.y!=0)
     {
     level.puck.velocity.y=0;
     // [level.puck soundDef ];
     }*/
    for (id item1 in level.scene) {
        if ([item1 isKindOfClass:[EnemyStacked class]] || [item1 isKindOfClass:[Mario class]] ||
            [item1 isKindOfClass:[Plate class]]  ||  [item1 isKindOfClass:[Enemy class]])
        {
            [MovementPhysics simulateMovementOn:item1 withElapsed:gameTime.elapsedGameTime];
        }
    }
    
    // Now we do collision detection. We compare puck and mallets with all other items.
    for (id item1 in level.scene) {
        if ([item1 isKindOfClass:[Enemy class]] ) {
            for (id item2 in level.scene) {
                if ((item1!=item2) && ([item2 isKindOfClass:[Plate class]] || [item2 isKindOfClass:[EnemyStacked class]])) {
					[Collision collisionBetween:item1 and:item2];
                }
            }
        }
     }
}

@end


