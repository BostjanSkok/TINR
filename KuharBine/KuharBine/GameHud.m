//
//  GameHud.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "GameHud.h"
#import "Retronator.Xni.Framework.Graphics.h"
#import "Retronator.Xni.Framework.Content.Pipeline.Processors.h"
#import "Button.h"
@implementation GameHud


- (id) initWithGame:(Game *)theGame
{
    self = [super initWithGame:theGame];
    if (self != nil) {
        scene = [[SimpleScene alloc] initWithGame:self.game];
        [self.game.components addComponent:scene];
    }
    return self;
}

@synthesize scene,goBack;

- (void) initialize {
    FontTextureProcessor *fontProcessor = [[[FontTextureProcessor alloc] init] autorelease];
    SpriteFont *font = [[self.game.content load:@"Retrotype" processor:fontProcessor] autorelease];
    retrotype = [self.game.content load:@"Retrotype" processor:fontProcessor];
    
    playerScore= [[Label alloc] initWithFont:font text:@"0" position:[Vector2 vectorWithX:260 y:410]];
    
    
        playerColor = [[Color white] retain];
        playerScore.color = playerColor;
        playerScore.horizontalAlign = HorizontalAlignCenter;
        playerScore.verticalAlign = VerticalAlignMiddle;
        [playerScore setScaleUniform:2];
        [scene addItem:playerScore];
    
    
    back = [[Button alloc] initWithInputArea:[Rectangle rectangleWithX:120 y:450
                                                                 width:160 height:32]
                                  background:nil font:retrotype text:@"Back"];
    back.labelColor = [Color white];
    back.backgroundColor = [Color black];
    back.labelHoverColor = [Color gray];
    
    back.label.position.x = 160;
    back.label.horizontalAlign = HorizontalAlignCenter;
    [scene addItem:back];
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    float change = gameTime.elapsedGameTime / 5;
    float sizeChange = gameTime.elapsedGameTime * 2;
    
    if (back.wasReleased) {
        //newState = [[[LevelSelection alloc] initWithGame:self.game] autorelease];
        goBack=true;
        
    }
    
  
    
    /*if (playerScore.scale.x > 0) {
        playerScore.scale.x -= sizeChange;
        playerScore.scale.y -= sizeChange;
    }*/
    
}
-(BOOL) getBackStatus{
    return goBack;
}
- (void) changePlayerScoreFor:(int)value {
  
    
    playerScore.text = [NSString stringWithFormat:@"%i", value];
   
 //   [playerColor set:[Color green]];
  //  [playerScore setScaleUniform:4];
    
}

- (void) dealloc
{
   
[playerScore release];
    
    [super dealloc];
}


@end
