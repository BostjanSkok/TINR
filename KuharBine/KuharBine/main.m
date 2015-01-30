//
//  main.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Retronator.Xni.Framework.h"
int main(int argc, char * argv[]) {
    
    [GameHost load];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, @"GameHost",@"KuharBine");
    }
}
