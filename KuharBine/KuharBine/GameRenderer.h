//
//  GameRenderer.h
//  friHockey
//
//  Created by Matej Jan on 19.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Retronator.Xni.Framework.Content.h"
#import "Express.Graphics.h"
#import "Namespace.KuharBine.classes.h"

@interface GameRenderer : DrawableGameComponent {
	// Resources
	ContentManager *content;
    Sprite *enemies[4];
    Sprite *marioSprite;
	Texture2D *background;
	Vector2 *lightPosition;
    Sprite *plateDebug ;
	// Graphics objects
	SpriteBatch *spriteBatch;
    Texture2D *enemieAT[4],*marioASpriteT;
    AnimatedSprite *enemieSpriteAnimation[4] ,*marioASprite;
	// Level
	Level *level;
    
    // Camera
	Matrix *camera;
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game*)theGame level:(Level*)theLevel;

@end
