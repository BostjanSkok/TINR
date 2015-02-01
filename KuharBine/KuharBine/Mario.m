//
//  Mario.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 31/01/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "Mario.h"
#import "Namespace.KuharBine.h"

@implementation Mario
- (id) init
{
    self = [super init];
    if (self != nil) {
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
        targetPosition = [[Vector2 alloc] init];
        isMoving=false;
    }
    return self;
}

@synthesize position, velocity, isMoving;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}

- (void) GoLeft {
    Vector2 *leftSpeed = [[Vector2 alloc] init];
    leftSpeed.x=-30;
   [velocity set: leftSpeed];
}

- (void) GoRight {
    Vector2 *leftSpeed = [[Vector2 alloc] init];
    leftSpeed.x=30;
    [velocity set: leftSpeed];
}
- (void) updateWithGameTime:(GameTime *)gameTime {
  
}


- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil){
        position = [[Vector2 alloc] init];
        velocity = [[Vector2 alloc] init];
     
        self.position.x = [aDecoder decodeFloatForKey:[NSString stringWithFormat:@"MarioX"]];
        self.position.y = [aDecoder decodeFloatForKey:[NSString stringWithFormat:@"MarioY"]];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeFloat:position.x forKey:[NSString stringWithFormat:@"MarioX"]];
    [aCoder encodeFloat:position.y forKey:[NSString stringWithFormat:@"MarioY"]];
}

+ (Mario *) loadProgress {
    // Load game progress from file.
    Mario *progress =nil ;
    
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants MarioFilePath]];
    progress = [NSKeyedUnarchiver unarchiveObjectWithFile:archivePath];
    
    
    
    
    return progress;
}
- (void) saveProgress {
    // Save game progress to file.
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *archivePath = [rootPath stringByAppendingPathComponent:[Constants MarioFilePath]];
    [NSKeyedArchiver archiveRootObject:self toFile:archivePath];
}


- (void) dealloc
{
    [velocity release];
    [position release];
    [super dealloc];
}
@end
