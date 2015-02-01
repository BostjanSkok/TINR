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

@interface Enemy : NSObject <IRectParticle , IEnemy,ICustomCollider>{
    Vector2 *position;
    Vector2 *velocity;
    //If true colision detection active
    int enemyType;
    bool isTop;
    float width;
    float height;
    
    NSObject *under;
    NSObject *over;
    
    Vector2 *targetPosition;
}


@end
