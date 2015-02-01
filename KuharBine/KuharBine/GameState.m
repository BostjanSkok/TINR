//
//  GameState.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "GameState.h"

@implementation GameState

- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        kuharBine = (KuharBine*)self.game;
    }
    return self;
}
- (void) activate {}
- (void) deactivate {}
@end
