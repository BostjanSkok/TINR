//
//  AiPlayer.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Player.h"
#import "Namespace.KuharBine.classes.h"
@interface AIPlayer : Player {
    Level *level;
    NSMutableArray *movesToDo;
    Enemy *waitForRemoval ;
/*    // AI player properties
    float speed;
    float attackSpeed;
    
@private
    BOOL attack;
    Vector2 *target;*/
}

- (id) initWithGame:(Game *)theGame mario:(Mario *)theMario level:(Level*)theLevel;

@property (nonatomic, readonly) Level *level;
/*@property (nonatomic, readonly) Vector2 *target;

+ (NSString*) name;
+ (NSMutableArray*) getQuotes;
+ (NSString*) portraitPath;
+ (NSString*) hiddenPortraitPath;
+ (NSString*) fullPortraitPath;

// Percepts
- (NSArray*) getDefenseDangers;
- (NSArray*) getOffenseWeaknesses;

// Actions
- (void) moveTowards:(Vector2*)theTarget;
- (void) attackTowards:(Vector2*)theTarget;*/

@end