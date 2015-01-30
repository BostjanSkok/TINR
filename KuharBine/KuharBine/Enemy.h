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

@interface Enemy : NSObject <IParticle>{
    Vector2 *position;
    Vector2 *velocity;
    //If true colision detection active
    bool isTop;
    float radius;
    float mass;
}


@end
