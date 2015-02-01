//
//  HumanPlayer.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Player.h"
#import "Retronator.Xni.Framework.classes.h"
#import "Retronator.Xni.Framework.Input.Touch.classes.h"

@interface HumanPlayer : Player{

    Rectangle *inputArea;
  //  BOOL grabbing;
  //  BOOL grabbed;
    BOOL pressed;

    Vector2 *touchOffset;
 
    Matrix *inverseView;
}

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe;
- (void) setCamera:(Matrix *)camera;
- (BOOL) rectContainsVector:(Rectangle*) rect value:(Vector2*) value ;

@end
