//
//  HumanPlayer.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "HumanPlayer.h"


#import "Retronator.Xni.Framework.Input.Touch.h"
#import "Artificial.Control.h"
#import "Namespace.KuharBine.h"

@implementation HumanPlayer

- (id) initWithGame:(Game *)theGame mario:(Mario *)theMario
{
    self = [super initWithGame:theGame mario:theMario ];
    if (self != nil) {
       TouchPanel *touchPanel = [TouchPanel getInstance];
        //touchPanel.enabledGestures= GestureTypeHorizontalDrag;
        inputArea = [[Rectangle alloc] initWithX:0 y:0 width:touchPanel.displayWidth height:touchPanel.displayHeight];
    
        UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
        swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
        [theGame.window addGestureRecognizer:swipeLeft];
        
        UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
        [theGame.window addGestureRecognizer:swipeRight];        /*	if (position == PlayerPositionBottom) {
         inputArea.y = inputArea.height;
         }*/
       // touchOffset = [[Vector2 alloc] initWithX:0 y:position ==  -40];
    }
    return self;
}

- (void) setCamera:(Matrix *)camera {
    [inverseView release];
    inverseView = [[Matrix invert:camera] retain];
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"Swipe Left");
      //  Mario *m = super.mario;
        [mario GoLeft];
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"Swipe Right");
       Mario *m = self;
        [mario GoRight];
     
    }/* else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
    NSLog(@"Swipe Up");
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        NSLog(@"Swipe Down");
    }*/
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [TouchPanelHelper getState];
 /*   if (touchPanel.isGestureAvailable)
    {
        GestureSample *gesture = touchPanel.readGesture;
        
        if (gesture.gestureType == GestureTypeHorizontalDrag)
        {
            mario.velocity.x = 5;
        }
    }*/
    BOOL touchesInInputArea = NO;
    for (TouchLocation *touch in touches) {
       // Vector2* touchInScene = [Vector2 transform:touch.position with:inverseView];
        
        //if ([inputArea containsVector:touchInScene]) {
          //  touchesInInputArea = YES;
            
          /*  if (!grabbed && touch.state == TouchLocationStatePressed || grabbing) {
                grabbing = YES;
                
                float distanceToMallet = [[[Vector2 subtract:touchInScene by:mallet.position] add:touchOffset] length];
                if (distanceToMallet < 50) {
                    grabbed = YES;
                }
            }
            
            if (grabbed) {
                [[mallet.position set:touchInScene] add:touchOffset];
                
            }*/
       //}
    }
    
 /*   if (!touchesInInputArea) {
        grabbed = NO;
    }*/
}

- (void) reset {
    grabbed = NO;
    grabbing = NO;
}

- (void) dealloc
{
    [inputArea release];
    [TouchPanel release];
    [super dealloc];
}



@end
