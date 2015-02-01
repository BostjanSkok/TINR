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
        [theGame.window addGestureRecognizer:swipeRight];
     /*
        UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionUp;
        [theGame.window addGestureRecognizer:swipeUp];
        
        UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
        swipeRight.direction = UISwipeGestureRecognizerDirectionDown;
        [theGame.window addGestureRecognizer:swipeDown];*/
        
        /*	if (position == PlayerPositionBottom) {
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
        [mario GoRight];
    }
  
}

- (void) updateWithGameTime:(GameTime *)gameTime {
    TouchCollection *touches = [TouchPanelHelper getState];

        BOOL touchesInInputArea = NO;
        for (TouchLocation *touch in touches) {
            Vector2* touchInScene = [Vector2 transform:touch.position with:inverseView];
            
            if ([self rectContainsVector:inputArea value:touchInScene]) {
                touchesInInputArea = YES;
                
                if (!pressed && touch.state == TouchLocationStatePressed ) {
                    pressed =true;
                }
                
                if (pressed && touch.state == TouchLocationStateReleased ) {
                    pressed =false;
                     [mario flip];
                    NSLog(@"flip   ");
                }
                
            }
            
            
            if (!touchesInInputArea) {
                pressed = false;
                
            }
        }
    

}

- (BOOL) rectContainsVector:(Rectangle*) rect value:(Vector2*) value {
    return (value.x >= rect.x && value.x <= rect.x + rect.width &&
            value.y >= rect.y && value.y <= rect.y + rect.height);
}
- (void) reset {
  //  grabbed = NO;
   // grabbing = NO;
    pressed= false;

}

- (void) dealloc
{
 
    [inputArea release];
    [TouchPanel release];
    [super dealloc];
}
@end
