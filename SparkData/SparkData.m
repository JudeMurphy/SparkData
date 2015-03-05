//
//  SparkData.m
//  SparkData
//
//  Created by Jude Murphy on 3/5/15.
//  Copyright (c) 2015 Spark Apps, LLC. All rights reserved.
//

#import "SparkData.h"

#define SPARKDATAKEY @"KeyForMemorySlotUsedBySparkData"

@implementation SparkData

//CONSTRUCTOR METHODS
+ (void) initialize
{
    if(![SparkData isSparkDataInitialized])
    {
        [[NSUserDefaults standardUserDefaults] setObject: [[NSDictionary alloc] init] forKey: SPARKDATAKEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (BOOL) isSparkDataInitialized
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY] == nil)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (void) printUsedMemory
{
    NSLog(@"CURRENT SPARK DATA: %@", [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY]);
}

//SEARCHING METHODS
+ (BOOL) searchForKey: (NSString *) key
{
    BOOL isFound = NO;
    NSArray *allKeys = [[[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY] allKeys];
    for (NSString *keyInMemory in allKeys)
    {
        if ([keyInMemory isEqualToString: key])
        {
            isFound = YES;
            break;
        }
    }
    
    return isFound;
}

+ (void) setKey: (NSString *) key withValue: (NSString *) newValue
{
    if (newValue == nil)
    {
        newValue = @"";
    }
    
    NSDictionary *localMemoryStorage = [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY];
    NSMutableDictionary *mutableMemoryDictionary = [localMemoryStorage mutableCopy];
    [mutableMemoryDictionary setObject: newValue forKey: key];
    
    localMemoryStorage = mutableMemoryDictionary;
    [[NSUserDefaults standardUserDefaults] setObject: localMemoryStorage forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) removeKey: (NSString *) key
{
    NSDictionary *localMemoryStorage = [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY];
    NSMutableDictionary *mutableMemoryDictionary = [localMemoryStorage mutableCopy];
    
    [mutableMemoryDictionary removeObjectForKey: key];
    localMemoryStorage = mutableMemoryDictionary;
    
    [[NSUserDefaults standardUserDefaults] setObject: localMemoryStorage forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) removeValuefromKey: (NSString *) key
{
    if ([SparkData searchForKey: key])
    {
        NSDictionary *localMemoryStorage = [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY];
        NSMutableDictionary *mutableMemoryDictionary = [localMemoryStorage mutableCopy];
        [mutableMemoryDictionary setObject: @"" forKey: key];
        localMemoryStorage = mutableMemoryDictionary;
        [[NSUserDefaults standardUserDefaults] setObject: localMemoryStorage forKey: SPARKDATAKEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void) clearSparkDataValues
{
    NSDictionary *localMemoryStorage = [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY];
    NSMutableDictionary *mutableMemoryDictionary = [localMemoryStorage mutableCopy];
    
    NSArray *allKeys = [mutableMemoryDictionary allKeys];
    for (NSString *keyInMemory in allKeys)
    {
        [mutableMemoryDictionary setObject: @"" forKey: keyInMemory];
    }
    
    localMemoryStorage = mutableMemoryDictionary;
    [[NSUserDefaults standardUserDefaults] setObject: localMemoryStorage forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) dumpSparkData
{
    [[NSUserDefaults standardUserDefaults] setObject: nil forKey: SPARKDATAKEY];
    [SparkData initialize];
}

+ (NSString *) getValueForKey: (NSString *) key
{
    NSString *value = nil;
    
    NSDictionary *localMemoryStorage = [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY];
    NSMutableDictionary *mutableMemoryDictionary = [localMemoryStorage mutableCopy];

    NSArray *allKeys = [mutableMemoryDictionary allKeys];
    for (NSString *keyInMemory in allKeys)
    {
        if ([keyInMemory isEqualToString: key])
        {
            value = [mutableMemoryDictionary objectForKey: keyInMemory];
            break;
        }
    }
    
    return value;
}

@end
