//
//  Constants.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 30/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Constants.h"

@implementation Constants

+ (float) topY {
    return 2;
}
+ (float) bottomY {
    return 266;
}

+ (float) rail1X {
    return 38;
}

+ (float) rail2X {
    return 90;
}
+ (float) rail3X {
    return 167;
}
+ (float) rail4X {
    return 219;
}

+ (float) deltaX {
    return 5;
}
+ (float) deltaY {
    return 1;
}

+ (float) gravity {
    return 40;
}

+ (float) spawnDelay {
    return 100;
}

+ (float) playerSpeed {
    return 150;
}
+ (NSString*) MarioFilePath {
    return @"KuharBineMarioSave";
}

@end
