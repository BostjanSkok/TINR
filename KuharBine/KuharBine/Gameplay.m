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

- (id) initDemoGame:(Game *)theGame  //aiClass:(Class)aiClass
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        //[self startInitWithLevelClass:levelClass];
           [self startInitWithLevelClass];
        // Create an ai  player.
        player = [[AIPlayer alloc] initWithGame:self.game mario:level.mario level:level];
        
        
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
    hud = [[GameHud alloc] initWithGame:self.game];
   
    hudRenderer = [[GuiRenderer alloc] initWithGame:self.game scene:hud.scene];
    hudRenderer.drawOrder = 1;
    
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
    [self.game.components addComponent:hud];
    [self.game.components addComponent:hudRenderer];
    [self.game.components addComponent:renderer];
    [self.game.components addComponent:physics];
    [self.game.components addComponent:player];
  
}

- (void) deactivate {
    [self.game.components removeComponent:hud];
    [self.game.components removeComponent:hudRenderer];
    [self.game.components removeComponent:level];
    [self.game.components removeComponent:renderer];
    [self.game.components removeComponent:physics];
    [self.game.components removeComponent:player];

}
- (void) initialize {
    [super initialize];
    
   
        if([player isKindOfClass:[HumanPlayer class]]){
            [(HumanPlayer*)player setCamera:renderer.camera];
        }
}
    
- (void) updateWithGameTime:(GameTime *)gameTime {
    // Game rules
    if(hud.getBackStatus){
        
       /* for (id item in level.scene) {
            if ([item isKindOfClass:[Mallet class]]) {
                [item saveProgress];
            }
        }*/
        
        [kuharBine popState];
    }
   
        
        // [addedEnemies removeObject:item];
    [self playerScores:level.mario.score];
 /*  if (level.puck.position.y < -50) {
        [self playerScores:PlayerPositionBottom];
    } else if (level.puck.position.y > 510) {
        [self playerScores:PlayerPositionTop];
    }*/
}

- (void) playerScores:(int)score {
  /*  if (position == PlayerPositionTop) {
        [SoundEngine play:SoundEffectTypeLose];
        [level resetToBottom];
    } else {
        [SoundEngine play:SoundEffectTypeWin];
        [level resetToTop];
    }
    */
 //   [player[PlayerPositionTop] reset];
  //  [player[PlayerPositionBottom] reset];
    
   
    [hud changePlayerScoreFor:score];
   /*
    if (score[position] >= [Constants winScore]) {
        AIPlayer *opponent = [player[PlayerPositionTop] isKindOfClass:[AIPlayer class]] ? (AIPlayer*)player[PlayerPositionTop] : nil;
        
        
        if (position == PlayerPositionBottom && opponent) {
            // Unlock current level.
            LevelType levelType = [[opponent class] levelType];
            [friHockey.progress unlockLevel:levelType];
            
            // Unlock next opponent.
            OpponentType opponentType = [[opponent class] opponentType] + 1;
            if (opponentType < OpponentTypes) {
                [friHockey.progress unlockOpponent:opponentType];
            }
        }
        
        [friHockey popState];
    }*/
}

    - (void) dealloc
{
    [hud release];
    [hudRenderer release];
    [level release];
    [renderer release];
    [physics release];

    [player release];
    [super dealloc];
}
@end
