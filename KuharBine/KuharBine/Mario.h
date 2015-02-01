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

@interface Mario : NSObject<IMovable,IPosition,IMoveToTarget, ICustomUpdate,NSCoding> {
    Vector2 *position;
    Vector2 *velocity;
    int currentRails;
    int rails[3];
    bool isFliping;
    bool toFlip;

    //int railL;
    //int railR;
    BOOL isMoving;// We store previous position for velocity calculation.
    Vector2 *targetPosition;
}
@property (nonatomic) BOOL isMoving, isFliping,toFlip;
//zero no flip  -1 left 1 right flip
@property (nonatomic) int currentRail;
+ (Mario *) loadProgress;
- (void) saveProgress;

- (void) resetVelocity;
- (void) GoLeft;
- (void) GoRight;
- (void) flip;
- (void) updateWithGameTime:(GameTime*)gameTime;
- (void) snapToTarget;

@end
