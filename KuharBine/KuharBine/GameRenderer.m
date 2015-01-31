//
//  GameRenderer.m
//  friHockey
//
//  Created by Matej Jan on 19.10.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GameRenderer.h"
#import "Express.Scene.h"
#import "Express.Scene.Objects.h"
#import "Namespace.KuharBine.h"

@implementation GameRenderer

@synthesize camera;

- (id) initWithGame:(Game *)theGame level:(Level *)theLevel {
	if (self = [super initWithGame:theGame]) {
		level = theLevel;
		content = [[ContentManager alloc] initWithServiceProvider:self.game.services];
		lightPosition = [[Vector2 alloc] initWithX:160 y:230];
        
        float scaleX =(float)self.game.gameWindow.clientBounds.width / 320;
        float scaleY = (float)self.game.gameWindow.clientBounds.height / 480;
        camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
        
	}
	return self;
}



- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
	
	// Load common sprites from main game content manager.	
	/*malletSprite = [[Sprite alloc] init];
	malletSprite.texture = [self.game.content load:@"Obj1Static"];
	malletSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
	malletSprite.origin = [Vector2 vectorWithX:1 y:1];

	malletShadow = [[Sprite alloc] init];
	malletShadow.texture = [self.game.content load:@"SceneItems"];
	malletShadow.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:1 height:1];
	malletShadow.origin = [Vector2 vectorWithX:1 y:1];
	
	puckSprite = [[Sprite alloc] init];
	puckSprite.texture = [self.game.content load:@"Obj1Static"];
	puckSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
	puckSprite.origin = [Vector2 vectorWithX:0 y:0];

	puckShadow = [[Sprite alloc] init];
	puckShadow.texture = [self.game.content load:@"Obj1Static"];
	puckShadow.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:1 height:1];
	puckShadow.origin = [Vector2 vectorWithX:0 y:0];
	*/
	// Load level background from local content manager.
	background = [content load:@"GameBg"];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
	[self.graphicsDevice clearWithColor:[Color black]];
	
    [spriteBatch beginWithSortMode:SpriteSortModeBackToFront BlendState:nil SamplerState:nil
				 DepthStencilState:nil RasterizerState:nil Effect:nil TransformMatrix:camera];
	
	[spriteBatch draw:background to:[Vector2 vectorWithX:0 y:-20] fromRectangle:nil tintWithColor:[Color white]
			 rotation:0 origin:[Vector2 zero] scaleUniform:1 effects:SpriteEffectsNone layerDepth:0.9];

	/*for (id item in level.scene) {
		
		id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
		
		Sprite *shadowSprite = nil;
		Sprite *sprite = nil;		
		SpriteEffects effects = SpriteEffectsNone;
		if ([item isKindOfClass:[Mallet class]]) {
			sprite = malletSprite;
			shadowSprite = malletShadow;
			Mallet *mallet = (Mallet*)item;
			if (mallet.position.y > 230) {
				effects = SpriteEffectsFlipVertically;
			}
		} else if ([item isKindOfClass:[Puck class]]) {
			sprite = puckSprite;
			shadowSprite = puckShadow;
		}
		
		/*if (itemWithPosition && shadowSprite) {
			Vector2 *shadowPosition = [[[Vector2 subtract:lightPosition by:itemWithPosition.position] multiplyBy:-0.02] add:itemWithPosition.position];
			
			spriteBatch draw:shadowSprite.texture to:shadowPosition fromRectangle:shadowSprite.sourceRectangle tintWithColor:[[Color white] multiply:0.5]
					 rotation:0 origin:shadowSprite.origin scaleUniform:1 effects:SpriteEffectsNone layerDepth:0.5f];
		}*/
	/*
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture to:itemWithPosition.position fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
					 rotation:0 origin:sprite.origin scaleUniform:2 effects:effects layerDepth:0.1];
		}
				
	}*/
	
	[spriteBatch end];
}

- (void) unloadContent {
//	[content unload];
}

- (void) dealloc
{
	[malletSprite release];
	[malletShadow release];
	[puckSprite release];
	[puckShadow release];
	[content release];
	[spriteBatch release];
	[super dealloc];
}

@end
