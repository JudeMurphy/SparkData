//
//  SparkData.h
//  SparkData
//
//  Created by Jude Murphy on 3/5/15.
//  Copyright (c) 2015 Spark Apps, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SparkData : NSObject

//SPARKDATA INITIALIZATION METHODS
//USED TO HANDLE INITIALIZATION OF THE SPARK DATA.
//SETS UP THE KEY AND VALUE DICTIONARY IN NSUSERDEFAULTS
+(void) initialize;
+(BOOL) isSparkDataInitialized;

//________________________________________________________________
//SPARKDATA GETTER METHODS
//SEARCHES THROUGH SPARKDATA FOR VALUE OF CORRESPONDING KEY
+(NSString *) getValueForKey: (NSString *) key;

//________________________________________________________________
//SPARKDATA SETTER METHODS
//REPLACES A VALUE FOR A SPECIFIED KEY
+(void) setKey: (NSString *) key withValue: (NSString *) newValue;

//________________________________________________________________
//SPARKDATA REMOVAL METHODS
//REMOVES KEY FOR, ALONG WITH IT'S VALUE FROM SPARKDATA
+(void) removeKey: (NSString *) key;

//REMOVES THE EXISTING VALUE FROM A KEY WITHIN SPARKDATA
+(void) removeValuefromKey: (NSString *) key;

//SETS ALL VALUES IN SPARKDATA TO @""
+(void) clearSparkDataValues;

//ERASES ALL KEYS/VALUES INSIDE OF SPARKDATA
+(void) dumpSparkData;

//________________________________________________________________
//SPARKDATA DEBUGGING METHODS
//PRINT OUT YOUR CURRENTLY USED KEYS/VALUES OF SPARKDATA
+(void) printUsedMemory;

//SEARCHES TO SEE IF YOU CURRENTLY HAVE A SPECIFIED KEY IN SPARKDATA
+(BOOL) searchForKey: (NSString *) key;

@end
