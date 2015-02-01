//
//  GamePlay.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Gameplay.h"

#import "Namespace.KuharBine.h"

@interface Gameplay ()

- (void) startInitWithLevelClass;
- (void) finishInit;
- (void) playerScores;

@end
@implementation Gameplay

- (id) initSinglePlayerWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
       // level =  [[Level alloc] initWithGame:self.game];
        [self startInitWithLevelClass];
        
        // Create two human players.
        player =  [[HumanPlayer alloc] initWithGame:self.game mario:level.mario];
       
        
        [self finishInit];
    }
    return self;
}

- (id) initDemoGame:(Game *)theGame  aiClass:(Class)aiClass
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        //[self startInitWithLevelClass:levelClass];
        
        // Create an ai and a human player.
       // player[PlayerPositionTop] = [[aiClass alloc] initWithGame:self.game mallet:level.topMallet level:level position:PlayerPositionTop];
        
        
        [self finishInit];
    }
    return self;
}

- (void) startInitWithLevelClass
{
    // Allocate and initialize a new level and add it to components.
    level = [[Level alloc] initWithGame:self.game];
}
- (void) finishInit
{
    // Create a physics engine and add it to components.
    physics = [[PhysicsEngine alloc] initWithGame:self.game level:level];
   // physics.updateOrder = 20;
    
    // Create a new renderer for the new level and add it to components.
    renderer = [[GameRenderer alloc] initWithGame:self.game level:level];
    
    // Create a hud and a renderer for the hud.
  //  hud = [[GameHud alloc] initWithGame:self.game];
    
   // hudRenderer = [[GuiRenderer alloc] initWithGame:self.game scene:hud.scene];
   // hudRenderer.drawOrder = 1;
    
    /*
     // Create a debug renderer for physics debugging.
     DebugRenderer *debugRenderer = [[[DebugRenderer alloc] initWithGame:self.game scene:level.scene] autorelease];
     debugRenderer.itemColor = [Color red];
     debugRenderer.movementColor = [Color gray];
     [self.game.components addComponent:debugRenderer];
     */
    
    // Setup correct update order.
    player.updateOrder = 0;
    physics.updateOrder = 1;
    level.updateOrder = 2;
    level.scene.updateOrder = 3;
    self.updateOrder = 4;
}
- (void) activate {
    [self.game.components addComponent:level];
 //   [self.game.components addComponent:hud];
   // [self.game.components addComponent:hudRenderer];
    [self.game.components addComponent:renderer];
    [self.game.components addComponent:physics];
    [self.game.components addComponent:player];
  
}

- (void) deactivate {
  //  [self.game.components removeComponent:hud];
    //[self.game.components removeComponent:hudRenderer];
    [self.game.components removeComponent:level];
    [self.game.components removeComponent:renderer];
    [self.game.components removeComponent:physics];
    [self.game.components removeComponent:player];

}


- (void) playerScores {

      //  [kuharBine popState];
    
}
- (void) dealloc
{
 //   [hud release];
    [hudRenderer release];
    [level release];
    [renderer release];
    [physics release];

    [player release];
    [super dealloc];
}
@end
