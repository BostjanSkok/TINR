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
    enemies[0]= [[Sprite alloc] init];
	enemies[0].texture = [self.game.content load:@"Obj1Static"];
	enemies[0].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
	enemies[0].origin = [Vector2 vectorWithX:1 y:1];
    
    enemies[1]= [[Sprite alloc] init];
    enemies[1].texture = [self.game.content load:@"Obj2Static"];
    enemies[1].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
    enemies[1].origin = [Vector2 vectorWithX:1 y:1];
    
    enemies[2]= [[Sprite alloc] init];
    enemies[2].texture = [self.game.content load:@"Obj3Static"];
    enemies[2].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
    enemies[2].origin = [Vector2 vectorWithX:1 y:1];
    
    enemies[3]= [[Sprite alloc] init];
    enemies[3].texture = [self.game.content load:@"Obj4Static"];
    enemies[3].sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:64];
    enemies[3].origin = [Vector2 vectorWithX:1 y:1];
    
   // AnimatedSprite *marioSprite = [[AnimatedSprite alloc] init];
    //[marioSprite addFrame://<#(AnimatedSpriteFrame *)#>]*/
    // create animated explosion sprite
    enemieAT[0] = [[self.game.content load:@"Obj1Animation32x32Tiles"] autorelease];
    enemieAT[1] = [[self.game.content load:@"Obj2Animated32x32Tiles"] autorelease];
    enemieAT[2] = [[self.game.content load:@"Obj3Animation32x32Tiles"] autorelease];
    enemieAT[3] = [[self.game.content load:@"Obj4Animation32x32Tiles"] autorelease];
    for (int k=1; k<5; k++)
    {
    
    enemieSpriteAnimation[k-1] = [[AnimatedSprite alloc] initWithDuration:1];
    enemieSpriteAnimation[k-1].looping = YES;
    for (int i = 0; i < 2; i++) {
        Sprite *sprite = [[[Sprite alloc] init] autorelease];
        sprite.texture = enemieAT[k-1];
        sprite.sourceRectangle = [Rectangle rectangleWithX:i*32 y:0 width:32 height:32];
        sprite.origin = [Vector2 vectorWithX:1 y:1];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:enemieSpriteAnimation[k-1].duration * (float)i / 2];
        [enemieSpriteAnimation[k-1] addFrame:frame];
    }
    }
    marioASpriteT = [[self.game.content load:@"P1Animation32x64Tiles"] autorelease];
    marioASprite = [[AnimatedSprite alloc] initWithDuration:1];
    marioASprite.looping = NO;
    for (int i = 0; i < 5; i++) {

        Sprite *sprite = [[[Sprite alloc] init] autorelease];
        sprite.texture = marioASpriteT;
        sprite.sourceRectangle = [Rectangle rectangleWithX:0 y:i * 32 width:64 height:32];
        sprite.origin = [Vector2 vectorWithX:1 y:1];
        
        AnimatedSpriteFrame *frame = [AnimatedSpriteFrame frameWithSprite:sprite start:marioASprite.duration * (float)i / 4];
        [marioASprite addFrame:frame];
    }
   /* marioSprite= [[Sprite alloc] init];
    marioSprite.texture = [self.game.content load:@"P1Animation32x64Tiles"];
    marioSprite.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:64 height:32];
    marioSprite.origin = [Vector2 vectorWithX:64 y:32];*/
  
    plateDebug =[[Sprite alloc] init];
    plateDebug.texture = [[Texture2D alloc] init];
    plateDebug.sourceRectangle = [Rectangle rectangleWithX:0 y:0 width:5 height:5];
    plateDebug.origin = [Vector2 vectorWithX:1 y:1];    /*malletShadow = [[Sprite alloc] init];
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

	for (id item in level.scene) {
		
		id<IPosition> itemWithPosition = [item conformsToProtocol:@protocol(IPosition)] ? item : nil;
		
		
		Sprite *sprite = nil;
		SpriteEffects effects = SpriteEffectsNone;
        if([item isKindOfClass:[Enemy class]]){
            // get the appropriate sprite from animation
            Enemy *enemy = (Enemy*)item;
            sprite = [enemieSpriteAnimation[enemy.enemyType] spriteAtTime:gameTime.totalGameTime];

        }
		else if ([item isKindOfClass:[EnemyStacked class]]  ) {
            EnemyStacked *enemy = (EnemyStacked*)item;
            sprite = (Sprite*)enemies[enemy.enemyType];
			
		} else if ([item isKindOfClass:[Mario class]]) {
            sprite = [marioASprite spriteAtTime:gameTime.totalGameTime];
			
		}
      /*  else if ([item isKindOfClass:[Plate class]]) {
            sprite = plateDebug;
            
        }*/
		
      /*  if (itemWithPosition && shadowSprite) {
			Vector2 *shadowPosition = [[[Vector2 subtract:lightPosition by:itemWithPosition.position] multiplyBy:-0.02] add:itemWithPosition.position];
			
			spriteBatch draw:shadowSprite.texture to:shadowPosition fromRectangle:shadowSprite.sourceRectangle tintWithColor:[[Color white] multiply:0.5]
					 rotation:0 origin:shadowSprite.origin scaleUniform:1 effects:SpriteEffectsNone layerDepth:0.5f];
		}*/
	
		if (itemWithPosition && sprite) {
			[spriteBatch draw:sprite.texture to:itemWithPosition.position fromRectangle:sprite.sourceRectangle tintWithColor:[Color white]
					 rotation:0 origin:sprite.origin scaleUniform:2 effects:effects layerDepth:0.1];
		}
      
				
	}
	
	[spriteBatch end];
}

- (void) unloadContent {
//	[content unload];
}

- (void) dealloc
{
	[enemies[4] release];

	[content release];
	[spriteBatch release];
	[super dealloc];
}

@end
