//
//  IMoveToTarget.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IMoveToTarget <NSObject>

@property (nonatomic, retain) Vector2 *targetPosition;

- (void) snapToTarget;
@end
