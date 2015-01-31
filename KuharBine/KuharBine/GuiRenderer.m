//
//  GuiRenderer.m
//  friHockey
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "GuiRenderer.h"

#import "Namespace.KuharBine.h"

@implementation GuiRenderer

@synthesize camera;

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene
{
	self = [super initWithGame:theGame];
	if (self != nil) {
		scene = theScene;
	}
	return self;
}

- (void) initialize {
    float scaleX = (float)self.game.gameWindow.clientBounds.width / 320;
    float scaleY = (float)self.game.gameWindow.clientBounds.height / 480;
	camera = [[Matrix createScale:[Vector3 vectorWithX:scaleX y:scaleY z:1]] retain];
	[super initialize];
}

- (void) loadContent {
	spriteBatch = [[SpriteBatch alloc] initWithGraphicsDevice:self.graphicsDevice];
}

- (void) drawWithGameTime:(GameTime *)gameTime {
    Matrix *inverseView = [Matrix invert:camera];
    [spriteBatch beginWithSortMode:SpriteSortModeDeffered
						BlendState:nil
					  SamplerState:[SamplerState pointClamp]
				 DepthStencilState:nil
				   RasterizerState:nil
                            Effect:nil
                   TransformMatrix:camera];
	
	for (id item in scene) {
		Label *label = [item isKindOfClass:[Label class]] ? item : nil;
		Image *image = [item isKindOfClass:[Image class]] ? item : nil;
        Button *button = [item isKindOfClass:[Button class]] ? item : nil;
        
		if (label) {
			[spriteBatch drawStringWithSpriteFont:label.font text:label.text to:label.position tintWithColor:label.color
										 rotation:label.rotation origin:label.origin scale:label.scale effects:SpriteEffectsNone layerDepth:label.layerDepth];
		}
		
		if (image) {
			[spriteBatch draw:image.texture to:image.position fromRectangle:image.sourceRectangle tintWithColor:image.color
					 rotation:image.rotation origin:image.origin scale:image.scale effects:SpriteEffectsNone layerDepth:image.layerDepth];
		}
        if (button) {
            [button updateWithInverseView:inverseView];
        }
	}
	
	[spriteBatch end];
}


- (void) unloadContent {
	[spriteBatch release];
}

@end
