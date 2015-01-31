//
//  KuharBine.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "KuharBine.h"
#import "Artificial.Control.h"

@implementation KuharBine

-(instancetype)init{
    self =[super init];
    if(self){
        graphics = [[GraphicsDeviceManager alloc] initWithGame:self];

        self.isFixedTimeStep = NO;
        
       [self.components addComponent:[[[TouchPanelHelper alloc] initWithGame:self] autorelease]];
        
        stateStack = [[NSMutableArray alloc] init];
        
        //[SoundEngine initializeWithGame:self];
        
        //progress = [[GameProgress loadProgress] retain];
    }
    return self;
}

- (void) initialize {
    // Add all level classes.
  //  levelClasses[LevelTypeHockey] = [HockeyLevel class];
    
    
    // Add all opponents.
   // opponentClasses[OpponentTypeIceman] = [Iceman class];
   
    
    // Start in main menu.
    MainMenu *mainMenu = [[[MainMenu alloc] initWithGame:self] autorelease];
    [self pushState:mainMenu];
    
    /*
     //Debug start in gameplay
     Gameplay *gameplay = [[[Gameplay alloc] initSinglePlayerWithGame:self
     levelClass:[HockeyLevel class]
     aiClass:[Iceman class]] autorelease];
     [self pushState:gameplay];
     */
    
    // Initialize all components.
    [super initialize];
}



-(void) pushState:(GameState *)gameState {
    GameState *currentActiveState = [stateStack lastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    [stateStack addObject:gameState];
    [self.components addComponent:gameState];
    [gameState activate];
}

- (void) popState {
    GameState *currentActiveState = [stateStack lastObject];
    [stateStack removeLastObject];
    [currentActiveState deactivate];
    [self.components removeComponent:currentActiveState];
    
    currentActiveState = [stateStack lastObject];
    [self.components addComponent:currentActiveState];
    [currentActiveState activate];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    [super updateWithGameTime:gameTime];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    [self.graphicsDevice clearWithColor:[Color black]];
    [super drawWithGameTime:gameTime];
}

- (void) dealloc
{
    [stateStack release];
    [graphics release];
    [super dealloc];
}


@end
