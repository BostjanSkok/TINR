//
//  MainMenu.m
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "MainMenu.h"

#import "Retronator.Xni.Framework.Content.h"

#import "Namespace.KuharBine.h"

@implementation MainMenu

- (void) initialize {
	[super initialize];
	
	// Background
	Texture2D *tableTexture = [[self.game.content load:@"StartMenu"] autorelease];
	table = [[Image alloc] initWithTexture:tableTexture position:[Vector2 vectorWithX:0 y:0]];
	[table setScaleUniform: 1];
	[scene addItem:table];
	
	/*Texture2D *dukeTexture = [[self.game.content load:@"TheDuke"] autorelease];
	duke = [[Image alloc] initWithTexture:dukeTexture position:[Vector2 vectorWithX:0 y:0]];	
	[duke setScaleUniform: 2];
	[scene addItem:duke];
	
	// Text
	title = [[Label alloc] initWithFont:retrotype text:@"friHockey" position:[Vector2 vectorWithX:160 y:10]];
	title.horizontalAlign = HorizontalAlignCenter;
	[scene addItem:title];
	
	subtitle = [[Label alloc] initWithFont:fivexfive text:@"by Matej Jan" position:[Vector2 vectorWithX:320 y:50]];
	subtitle.horizontalAlign = HorizontalAlignRight;
	[scene addItem:subtitle];
	
	copyright = [[Label alloc] initWithFont:fivexfive text:@""
				 "3D modeling by\n"
				 "Matjaz Lamut\n"
				 "Published by GameTeam, Fri\n"
				 "Copyright 2011 Razum d.o.o.\n"
				 "All Rights Reserved v0.4" position:[Vector2 vectorWithX:4 y:462]];
	copyright.verticalAlign = VerticalAlignBottom;
	[scene addItem:copyright];
     */
	
	// Buttons
	singleplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:130 y:300 width:120 height:64]
                                          background:nil font:retrotype text:@"Start"];
//	[singleplayer.backgroundImage setScaleUniform:2];
	[scene addItem:singleplayer];
	
	multiplayer = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:130 y:350 width:120 height:64]
										 background:nil font:retrotype text:@"Scores"];
	//[multiplayer.backgroundImage setScaleUniform:2];
	[scene addItem:multiplayer];
	
	options = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:130 y:400 width:120 height:64]
									 background:buttonBackground font:retrotype text:@"Options"];
	//[options.backgroundImage setScaleUniform:2];
	[scene addItem:options];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	[super updateWithGameTime:gameTime];
	
	GameState *newState = nil;
	
	if (singleplayer.wasReleased) {
        
           // Class levelClass = [kuharBine getLevelClass];
        Gameplay *gameplay = [[[Gameplay alloc] initSinglePlayerWithGame:self.game ] autorelease];
        [kuharBine pushState:gameplay];
	} else if (multiplayer.wasReleased) {	
		//newState = [[[LevelSelection alloc] initWithGame:self.game] autorelease];
        exit(0);
	} else if (options.wasReleased) {
		//newState = [[[Options alloc] initWithGame:self.game] autorelease];
	}
	
	if (newState) {
		[kuharBine pushState:newState];
	}
}

- (void) dealloc
{
	[table release];
	[duke release];
	
	[title release];
	[subtitle release];
	[copyright release];
	
	[singleplayer release];
	[multiplayer release];
	[options release];
	
	[super dealloc];
}


@end
