//
//  Level.h
//  friHockey
//
//  Created by Matej Jan on 19.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Namespace.KuharBine.classes.h"
#import "Express.Scene.h"

@interface Level : GameComponent {
	SimpleScene *scene;
	/*Mallet *topMallet;
	Mallet *bottomMallet;
	Puck *puck;
	
	Vector2 *topMalletSpawn;
	Vector2 *bottomMalletSpawn;
	Vector2 *topPuckSpawn;
	Vector2 *bottomPuckSpawn;
	
	NSMutableArray *defenseSpots;
	NSMutableArray *offenseSpots;*/
}

@property (nonatomic, readonly) id<IScene> scene;
/*@property (nonatomic, readonly) Mallet *topMallet;
@property (nonatomic, readonly) Mallet *bottomMallet;
@property (nonatomic, readonly) Puck *puck;

@property (nonatomic, readonly) NSMutableArray *defenseSpots;
@property (nonatomic, readonly) NSMutableArray *offenseSpots;*/

@end
