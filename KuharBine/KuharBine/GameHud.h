//
//  GameHud.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//


#import <Foundation/Foundation.h>

#import "Retronator.Xni.Framework.Content.h"
#import "Artificial.Mirage.h"
#import "Express.Scene.h"
#import "Namespace.KuharBine.classes.h"

@interface GameHud : GameComponent {
    SimpleScene *scene;
    
    Label *playerScore;
    SpriteFont *retrotype;
    Color *playerColor;
    //float playerOpacity;
    Button *back;
    BOOL goBack;
}

@property (nonatomic, readonly) id<IScene> scene;
@property BOOL goBack;
- (void) changePlayerScoreFor:(int)value;
- (BOOL) getBackStatus;
@end
