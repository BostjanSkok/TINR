//
//  Player.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Express.Scene.h"

#import "Namespace.KuharBine.classes.h"

@interface Player : GameComponent {
   Mario *mario;
   
}

- (id) initWithGame:(Game *)theGame mario:(Mario*)theMario;

- (void) reset;
//@property (nonatomic, readonly) Mario *mario;
@end
