//
//  Plate.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Express.Scene.Objects.h"
#import "IStacked.h"
#import "Namespace.KuharBine.classes.h"

@interface Plate : NSObject <IRectParticle,IMoveToTarget,ICustomCollider,IStacked>
{
    Vector2 *position;
    Vector2 *velocity;
    float width;
    float height;
    int rail;
    bool isTop;
    NSObject *under;
    NSObject *over;
    //int railL;
    //int railR;
    BOOL isMoving;
    Vector2 *targetPosition;
}


@end
