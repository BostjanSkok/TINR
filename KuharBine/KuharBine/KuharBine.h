//
//  KuharBine.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Retronator.Xni.Framework.h"
#import "Retronator.Xni.Framework.Content.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Namespace.KuharBine.classes.h"

@interface KuharBine : Game{
    GraphicsDeviceManager *graphics;
    
    // Progress
   // GameProgress *progress;
    
    // Game state
    NSMutableArray *stateStack;
    

    
    // Opponents
//Class opponentClasses[OpponentTypes];
}

//@property (nonatomic, readonly) GameProgress *progress;

- (void) pushState:(GameState*)gameState;
- (void) popState;


//- (Class) getOpponentClass:(OpponentType)type;
@end
