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
        counter=0;
        rails[0] = [Constants rail1X];
        rails[1] = [Constants rail2X];
        rails[2] = [Constants rail3X];
        rails[3] = [Constants rail4X];
        plates = [[NSMutableArray alloc] init];
        Plate *plate1 = [[Plate alloc] init];
        plate1.position.y = [Constants bottomY] + 15;
        plate1.position.x =rails[0];
        [plates addObject:plate1];
        [scene addItem:plate1];
        Plate *plate2 = [[Plate alloc] init];
        plate2.position.y = [Constants bottomY] + 15;
        plate2.position.x =rails[1];
        [plates addObject:plate2];
        [scene addItem:plate2];
        Plate *plate3 = [[Plate alloc] init];
        plate3.position.y = [Constants bottomY] + 15;
        plate3.position.x =rails[2];
        [plates addObject:plate3];
        [scene addItem:plate3];
        Plate *plate4 = [[Plate alloc] init];
        plate4.position.y = [Constants bottomY] + 15;
        plate4.position.x =rails[3];
        [plates addObject:plate4];
        [scene addItem:plate4];
        mario = [[Mario alloc] init];
        mario.position.y=[Constants bottomY]+32;
        mario.position.x = [Constants rail1X]-4;
        [scene addItem:mario];
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
        addedEnemies = [[NSMutableArray alloc] init];
    }
	return self;
}

@synthesize scene , addedEnemies ,plates,mario;//, topMallet, bottomMallet, puck, defenseSpots, offenseSpots;

- (void) initialize {
	[super initialize];
    counter=0;
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
    if(counter>[Constants spawnDelay]){
        Enemy *enemyToAdd = [[Enemy alloc] init];
        enemyToAdd.position.x = rails[arc4random_uniform(4)];
        enemyToAdd.position.y = [Constants topY];
        enemyToAdd.velocity.x=0;
        enemyToAdd.velocity.y=[Constants gravity];
        [addedEnemies addObject:enemyToAdd];
        [scene addItem:enemyToAdd];
        counter=0;
    }
    for (id item in scene) {
		id<ICustomUpdate> updatable = [item conformsToProtocol:@protocol(ICustomUpdate)] ? item : nil;
		
		if (updatable) {
			[updatable updateWithGameTime:gameTime];
		}	
	}
    counter++;
}

- (void) dealloc
{
	[self.game.components removeComponent:scene];
    [addedEnemies release];
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
