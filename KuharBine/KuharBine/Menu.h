//
//  Menu.h
//  friHockey
//
//  Created by Matej Jan on 22.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Artificial.Mirage.h"

#import "Express.Scene.h"

#import "Namespace.KuharBine.classes.h"

#import "GameState.h"

@interface Menu : GameState {
	SimpleScene *scene;	
	GuiRenderer *renderer;
	
	SpriteFont *retrotype, *fivexfive;
	Texture2D *buttonBackground;
	
	Button *back;
}

@end
