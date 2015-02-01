//
//  Level.m
//  friHockey
//
//  Created by Matej Jan on 19.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "Level.h"

#import "Namespace.KuharBine.h"

@interface Level ()

- (void) reset;

@end


@implementation Level

- (id) initWithGame:(Game *)theGame
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = [[SimpleScene alloc] initWithGame:self.game];
		
	/*	topMallet = [[Mallet alloc] init];
		bottomMallet =[[Mallet loadProgress] retain];
		puck = [[Puck alloc] init];
		
		//[scene addItem:topMallet];
		[scene addItem:bottomMallet];
		//[scene addItem:puck];
		
		topMalletSpawn = [[Vector2 alloc] init];
		bottomMalletSpawn = [[Vector2 alloc] init];
		topPuckSpawn = [[Vector2 alloc] init];
		bottomPuckSpawn = [[Vector2 alloc] init];
		
		defenseSpots = [[NSMutableArray alloc] init];
		offenseSpots = [[NSMutableArray alloc] init];*/
	}
	return self;
}

@synthesize scene;//, topMallet, bottomMallet, puck, defenseSpots, offenseSpots;

- (void) initialize {
	[super initialize];
	
	[self.game.components addComponent:scene];
}



- (void) reset {
//	[topMallet.position set:topMalletSpawn];
//	[topMallet resetVelocity];

	//[bottomMallet.position set:bottomMalletSpawn];
//	[bottomMallet resetVelocity];

//	puck.velocity.x = 0;
//	puck.velocity.y = 0;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	// Update all items with custom update.
	for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable) {
			[updatable updateWithGameTime:gameTime];
		}	
	}
}

- (void) dealloc
{
	[self.game.components removeComponent:scene];
/*	[defenseSpots release];
	[offenseSpots release];
	[topMalletSpawn release];
	[bottomMalletSpawn release];
	[topPuckSpawn release];
	[bottomPuckSpawn release];*/
	[scene release];
	[super dealloc];
}


@end
