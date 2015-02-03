//
//  Enemy.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Express.Scene.Objects.h"
#import "Namespace.KuharBine.classes.h"
#import "IEnemy.h"

@interface EnemyStacked : NSObject <IRectParticle ,IMoveToTarget ,IEnemy,IStacked,ICustomCollider>{
    Vector2 *position;
    Vector2 *velocity;
    //If true colision detection active
    int enemyType;
    bool isTop;
    float width;
    float height;
    BOOL isMoving;
    NSObject *under;
    NSObject *over;
    bool toRemoveWithPoints;
    Vector2 *targetPosition;
    int enemyTypeToAdd;
    int step;
    
}


@end
