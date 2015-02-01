//
//  PhysicsEngine.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "Namespace.KuharBine.classes.h"

@interface PhysicsEngine : GameComponent {
    // Level
    Level *level;
}

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end