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
    
    int counter ;
    NSInteger rails[4] ;
	/*Plate *plate1;
	Plate *plate2;
    Plate *plate3;
    Plate *plate4;*/
    NSMutableArray *plates;
    Mario* mario;
	/*Puck *puck;
     
	Vector2 *topMalletSpawn;
	Vector2 *bottomMalletSpawn;
	Vector2 *topPuckSpawn;
	Vector2 *bottomPuckSpawn;
	
	NSMutableArray *defenseSpots;
	NSMutableArray *offenseSpots;*/
    
    NSMutableArray *addedEnemies;
}

@property (nonatomic, readonly) id<IScene> scene;
@property (nonatomic, readonly) Mario *mario;
/*@property (nonatomic, readonly) Plate *plate1;
@property (nonatomic, readonly) Plate *plate2;
@property (nonatomic, readonly) Plate *plate3;
@property (nonatomic, readonly) Plate *plate4;*/
/*@property (nonatomic, readonly) Puck *puck;

@property (nonatomic, readonly) NSMutableArray *defenseSpots;
@property (nonatomic, readonly) NSMutableArray *offenseSpots;*/

@property (nonatomic, readonly) NSMutableArray *addedEnemies;
@property (nonatomic, readonly) NSMutableArray *plates;
@end
