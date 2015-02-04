//
//  Player.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Player.h"

@implementation Player

- (id) initWithGame:(Game *)theGame mario:(Mario *)theMario
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        mario = theMario;
       
    }
    return self;
}


- (void) reset {}
@end
