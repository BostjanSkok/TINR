//
//  GuiRenderer.h
//  friHockey
//
//  Created by Matej Jan on 20.12.10.
//  Copyright 2010 Retronator. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Express.Scene.h"

#import "Namespace.KuharBine.classes.h"

@interface GuiRenderer : DrawableGameComponent {
	SpriteBatch *spriteBatch;
	
	id<IScene> scene;
    
    // Camera
    Matrix *camera;
}

@property (nonatomic, readonly) Matrix *camera;

- (id) initWithGame:(Game*)theGame scene:(id<IScene>)theScene;

@end
