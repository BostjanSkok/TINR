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
    int currentRail;
    int rails[3];
    int platesMoving;
    int *topScores[10];
    bool toFlip;
 int score;
    //int railL;
    //int railR;
    BOOL isMoving;// We store previous position for velocity calculation.
    Vector2 *targetPosition;
}
@property (nonatomic) BOOL isMoving,toFlip;
//zero no flip  -1 left 1 right flip
@property (nonatomic) int currentRail,platesMoving;
+ (Mario *) loadProgress;
- (void) saveProgress;
@property (nonatomic) int score;
- (void) resetVelocity;
- (void) GoLeft;
- (void) GoRight;
- (void) flip;
- (void) updateWithGameTime:(GameTime*)gameTime;
- (void) snapToTarget;

@end
