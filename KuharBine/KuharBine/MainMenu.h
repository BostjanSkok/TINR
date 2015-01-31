//
//  MainMenu.h
//  friHockey
//
//  Created by Matej Jan on 21.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Menu.h"

@interface MainMenu : Menu {
	Image *table, *duke;
	
	Label *title, *subtitle, *copyright;
	
	Button *singleplayer, *multiplayer, *options;
}

@end
