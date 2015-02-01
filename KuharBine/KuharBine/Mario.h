//
//  Mario.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Express.Scene.Objects.h"
#import "Namespace.KuharBine.classes.h"

@interface Mario : NSObject<IParticle, ICustomUpdate,NSCoding> {
    Vector2 *position;
    Vector2 *velocity;
    float radius;
    float mass;
    
    // We store previous position for velocity calculation.
   // Vector2 *previousPosition;
}

+ (Mario *) loadProgress;
- (void) saveProgress;

- (void) resetVelocity;
- (void) updateWithGameTime:(GameTime*)gameTime;

@end
