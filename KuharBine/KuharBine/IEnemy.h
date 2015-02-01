//
//  IEnemy.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IStacked.h"
@protocol IEnemy <NSObject,IStacked>

@property (nonatomic) int enemyType;

@end