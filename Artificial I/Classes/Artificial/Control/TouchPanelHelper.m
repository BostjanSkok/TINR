//
//  TouchPanelHelper.m
//  Artificial I
//
//  Created by Matej Jan on 1.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import "TouchPanelHelper.h"

static TouchCollection *touches;

@implementation TouchPanelHelper

+ (TouchCollection *) getState {
	return touches;
}

- (void) updateWithGameTime:(GameTime *)gameTime {
	touches = [TouchPanel getState];
}

@end
