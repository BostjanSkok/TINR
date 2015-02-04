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
        platesMoving=0;
        toFlip=false;
        currentRail=0;
        score=0;
        rails[0] = [Constants rail1X];
        rails[1] = [Constants rail2X];
        rails[2] = [Constants rail3X];
       // rails[3] = [Constants rail4X];
    }
    return self;
}

@synthesize position, velocity,targetPosition,currentRail,platesMoving,toFlip,score,isMoving;

- (void) resetVelocity {
    [velocity set:[Vector2 zero]];
}

- (void) snapToTarget {
    if(!isMoving)
        return;
    if( ABS(position.x - targetPosition.x) < [Constants deltaX]+100 ){
        if( ABS( position.y - targetPosition.y) < [Constants deltaY]+100){
             [velocity set:[Vector2 zero]];
             [position set:targetPosition];
             [targetPosition set:[Vector2 zero]];
             isMoving=false;
        }
    }
        
}

- (void) GoLeft {
    if(currentRail==0 || isMoving || platesMoving!=0)
        return;
    currentRail--;
    targetPosition.x= rails[currentRail];
    targetPosition.y = position.y;
    isMoving=true;
    Vector2 *leftSpeed = [[Vector2 alloc] init];
    leftSpeed.x= -[Constants playerSpeed];
   [velocity set: leftSpeed];
}

- (void) GoRight {
    if(currentRail==2 || isMoving || platesMoving!=0)
        return;
    currentRail++;
    targetPosition.x= rails[currentRail];
    targetPosition.y = position.y;
    isMoving=true;
    Vector2 *leftSpeed = [[Vector2 alloc] init];
    leftSpeed.x=[Constants playerSpeed];
    [velocity set: leftSpeed];
}

-(void) flip {
    if(isMoving||platesMoving!=0 || toFlip)
        return;
    toFlip=true;
    
}

- (void) updateWithGameTime:(GameTime *)gameTime {
  
}


 -(id) initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self != nil){
         [aDecoder decodeArrayOfObjCType:@encode(int) count:10 at:topScores];
        //position = [[Vector2 alloc] init];
        /*velocity = [[Vector2 alloc] init];
     
        self.position.x = [aDecoder decodeFloatForKey:[NSString stringWithFormat:@"MarioX"]];
        self.position.y = [aDecoder decodeFloatForKey:[NSString stringWithFormat:@"MarioY"]];*/
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    
    [aCoder encodeArrayOfObjCType:@encode(int) count:10 at:topScores];
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
