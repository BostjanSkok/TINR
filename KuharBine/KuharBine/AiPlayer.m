//
//  AiPlayer.m
//  KuharBine
//
//  Created by SKOK, BOŠTJAN on 03/02/15.
//  Copyright (c) 2015 fri. All rights reserved.
//

#import "AiPlayer.h"
#import "Namespace.KuharBine.h"
@implementation AIPlayer

/*+ (void) initialize {
    if (!quotes) {
        quotes = [[NSMutableArray alloc] init];
    }
}*/

- (id) initWithGame:(Game *)theGame mario:(Mario *)theMario level:(Level *)theLevel
{
    self = [super initWithGame:theGame mario:theMario];
    if (self != nil) {
        level = theLevel;
        movesToDo = [[NSMutableArray alloc] init];
        waitForRemoval=nil;
    }
    return self;
}

@synthesize level;



// Action execution
- (void) updateWithGameTime:(GameTime *)gameTime {
    //when player busy move on
   if(mario.isMoving || mario.toFlip || mario.platesMoving!=0 )
       return;
    if([movesToDo count]!=0){
        NSNumber *anumber = [movesToDo firstObject];
        
        int move = [anumber intValue];
        if(move==-1)
        {[mario GoLeft];}
        else if(move==0 ){
            [mario flip];
        }
        else if(move==1){
            [mario GoRight ];
        }
        [movesToDo removeObjectAtIndex:0];
        return;
    }
    
    Enemy *enemy1 =nil;
    Enemy *enemy2 = nil;
    NSInteger tops[4];
    
    NSInteger FromRail=-1;
    NSInteger toRail=-1;
    bool wasEnemyRemoved=true;
    for (id item in level.scene) {
        if(item==waitForRemoval)
        {wasEnemyRemoved=false;}
        if ([item isKindOfClass:[Enemy class]] && !((Enemy*)item).remove) {
            if(enemy1 == nil)
            {
                enemy1 =(Enemy*) item;
            }else if (enemy2==nil){
                enemy2 = (Enemy* ) item;
            
            }
        }else{
            id<IStacked> stackItem = [item conformsToProtocol:@protocol(IStacked)] ? item : nil;
            if(stackItem!= nil && stackItem.isTop){
                if([stackItem isKindOfClass:[EnemyStacked class]] ){
                    tops[stackItem.rail] = ((EnemyStacked *)stackItem).enemyType;
                }else  if([stackItem isKindOfClass:[Plate class]] ){
                    tops[stackItem.rail]=-1;
                    }
         
                
            }
        }
        
       
    }
    
    if(!wasEnemyRemoved){
        return;
    }
    waitForRemoval=nil;
    if(enemy1==nil)
        return;
    for (int a=0; a<4;a++) {
        if(enemy1!=nil && tops[a] == enemy1.enemyType)
        {
            FromRail = a ;
            toRail= enemy1.rail;
            waitForRemoval=enemy1;
            break;
        }else if (enemy2!=nil &&  tops[a] == enemy2.enemyType){
            FromRail = a ;
            toRail= enemy2.rail;
            waitForRemoval=enemy2;
            break;
        }
    }
    
    //Make path
    if(FromRail!=-1){
        
        int diff =toRail-FromRail;
        if (diff<0) {
        //Move column from right to left
       //Position right hand to source  rail Mario current position == FromRaill-1
            int movesToStart = (FromRail-1)-mario.currentRail;
            if(movesToStart>0){
                for ( movesToStart;movesToStart>0 ;movesToStart--) {
                    if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                    [movesToDo addObject:@1]; //mario go to right
                }
            }else if(movesToStart < 0){
                for ( movesToStart;movesToStart<0 ;movesToStart++) {
                    if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                    [movesToDo addObject:@-1]; //mario go to left
                }
            }
            //Now player is set we need to turn and move column to target
            for ( diff; diff<0;diff++) {
                if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                 [movesToDo addObject:@0]; //Mario flip
                if(diff!=-1 ){
                    [movesToDo addObject:@-1];} // mario left
            }
            
        }else if(diff>0){
        //Move from left to right
            int movesToStart = FromRail-mario.currentRail;
            if(movesToStart>0){
                for ( movesToStart;movesToStart>0 ;movesToStart--) {
                    if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                    [movesToDo addObject:@1]; //mario go to right
                }
            }else if(movesToStart < 0){
                for ( movesToStart;movesToStart<0 ;movesToStart++) {
                    if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                    [movesToDo addObject:@-1]; //mario go to left
                }
            }
            //Now player is set we need to turn and move column to target
            for ( diff; diff>0;diff--) {
                if ([movesToDo count]>30){[NSException raise:@"Ai path to long"];}
                [movesToDo addObject:@0];
                if(diff!=0){//Mario flip
                    [movesToDo addObject:@1];} // mario right
            }
        }
        
    
    }
    
    // Movement action.
  /*  if (target) {
        Vector2 *difference = [Vector2 subtract:target by:mallet.position];
        float distance = [difference length];
        float maxMove = (attack ? attackSpeed : speed) * gameTime.elapsedGameTime;
        
        if (distance < maxMove) {
            [mallet.position set:target];
            [target release];
            target = nil;
        } else {
            [[difference normalize] multiplyBy:maxMove];
            [mallet.position add:difference];
        }
    }*/
}

- (void) dealloc
{
    [super dealloc];
}

@end
