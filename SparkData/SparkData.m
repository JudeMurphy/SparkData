// SparkData.h
//
// Developed by Jude Murphy
// Copyright (c) 2015 Spark Apps, LLC http://www.sparkapps.com/
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "SparkData.h"

#define SPARKDATAKEY @"KeyForMemorySlotUsedBySparkData"
#define MEMORYREFERENCE [[NSUserDefaults standardUserDefaults] objectForKey: SPARKDATAKEY]

@implementation SparkData

//CONSTRUCTOR METHODS
+ (void)initialize
{
    if (self == [SparkData self])
    {
        if(![SparkData isSparkDataInitialized])
        {
            [[NSUserDefaults standardUserDefaults] setObject: [[NSDictionary alloc] init] forKey: SPARKDATAKEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }
}

+ (BOOL) isSparkDataInitialized
{
    if (MEMORYREFERENCE == nil)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+ (BOOL) searchForKey: (NSString *) key
{
    BOOL isFound = NO;
    NSArray *allKeys = [MEMORYREFERENCE allKeys];
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

//SETTER METHODS
+ (void) setValue: (NSString *) newValue forKey: (NSString *) key
{
    if (newValue == nil)
    {
        newValue = @"";
    }
    
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    [mutableMemoryDictionary setObject: newValue forKey: key];
    [[NSUserDefaults standardUserDefaults] setObject: mutableMemoryDictionary forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) setDictionary: (NSDictionary *) newDictionary forKey: (NSString *) key
{
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    
    if (newDictionary == nil)
    {
        [mutableMemoryDictionary setObject: [[NSDictionary alloc] init] forKey: key];
    }
    else
    {
        [mutableMemoryDictionary setObject: newDictionary forKey: key];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject: mutableMemoryDictionary forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) setKeyPairInNestedDictionaryNamed: (NSString *) name withValue: (NSString *) nestedValue andKey: (NSString *) nestedKey
{
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    
    if ([SparkData searchForKey: name])
    {
        NSArray *allKeys = [mutableMemoryDictionary allKeys];
        NSMutableDictionary *nestedDictionary = [[NSMutableDictionary alloc] init];
        
        for (NSString *keyInMemory in allKeys)
        {
            if ([keyInMemory isEqualToString: name])
            {
                nestedDictionary = [[mutableMemoryDictionary objectForKey: keyInMemory] mutableCopy];
                [nestedDictionary setObject: nestedValue forKey: nestedKey];
                [SparkData setDictionary: nestedDictionary forKey: name];
                break;
            }
        }
    }
    else
    {
        [SparkData setDictionary: [[NSMutableDictionary alloc] init] forKey: name];
        [SparkData setKeyPairInNestedDictionaryNamed: name withValue: nestedValue andKey: nestedKey];
    }
}

//REMOVAL METHODS
+ (void) removeKey: (NSString *) key
{
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    [mutableMemoryDictionary removeObjectForKey: key];
    [[NSUserDefaults standardUserDefaults] setObject: mutableMemoryDictionary forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) removeValuefromKey: (NSString *) key
{
    if ([SparkData searchForKey: key])
    {
        NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
        [mutableMemoryDictionary setObject: @"" forKey: key];
        [[NSUserDefaults standardUserDefaults] setObject: mutableMemoryDictionary forKey: SPARKDATAKEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (void) clearSparkDataValues
{
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    NSArray *allKeys = [mutableMemoryDictionary allKeys];
    for (NSString *keyInMemory in allKeys)
    {
        if ([[mutableMemoryDictionary objectForKey: keyInMemory] isKindOfClass: [NSString class]])
        {
            [mutableMemoryDictionary setObject: @"" forKey: keyInMemory];
        }
        else
        {
            [mutableMemoryDictionary setObject: [[NSDictionary alloc] init] forKey: keyInMemory];
        }
    }
    
    [[NSUserDefaults standardUserDefaults] setObject: mutableMemoryDictionary forKey: SPARKDATAKEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) dumpSparkData
{
    [[NSUserDefaults standardUserDefaults] setObject: nil forKey: SPARKDATAKEY];
    [SparkData initialize];
}

//RETRIEVAL METHODS
+ (NSString *) getValueForKey: (NSString *) key
{
    NSString *value = nil;
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    
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

+ (NSDictionary *) getDictionaryForKey: (NSString *) key
{
    NSDictionary *value = nil;
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    
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

//CHECK VALUE FOR A SPECIFIED KE
+ (BOOL) isValueNilForKey: (NSString *) key
{
    BOOL isNil = NO;
    
    NSString *value = [SparkData getValueForKey: key];
    if ([value isEqualToString: @""] || value == nil)
    {
        isNil = YES;
    }
    
    return isNil;
}

//DEVELOPER DEBUGGING METHODS
+ (void) printUsedMemory
{
    NSLog(@"CURRENT SPARK DATA: %@", MEMORYREFERENCE);
}

+ (void) printNestedDictionaryNames
{    
    NSMutableDictionary *mutableMemoryDictionary = [MEMORYREFERENCE mutableCopy];
    
    NSArray *allKeys = [mutableMemoryDictionary allKeys];
    for (NSString *keyInMemory in allKeys)
    {
        id value = [mutableMemoryDictionary objectForKey: keyInMemory];
        
        if ([value isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"%@", keyInMemory);
        }
    }
}

@end
