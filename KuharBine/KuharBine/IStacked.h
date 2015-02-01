//
//  IStacked.h
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 01/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IStacked <NSObject>

@property (nonatomic, retain) NSObject *under;
@property (nonatomic, retain) NSObject *over;

@property (nonatomic) int rail;
@end
