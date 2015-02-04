//
//  GamePlay.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.KuharBine.classes.h"
#import "GameState.h"

@interface Gameplay : GameState {
    Level *level;
    GameHud *hud;
    
   Player *player;
    
    GameRenderer *renderer;
    GuiRenderer *hudRenderer;
    PhysicsEngine *physics;
}

- (id) initSinglePlayerWithGame:(Game*)theGame;
- (id) initDemoGame:(Game*)theGame aiClass:(Class)aiClass;

@end
