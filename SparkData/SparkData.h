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

#import <Foundation/Foundation.h>

@interface SparkData : NSObject

//________________________________________________________________
//SPARKDATA INITIALIZATION METHODS
//USED TO HANDLE INITIALIZATION OF THE SPARK DATA.
//SETS UP THE KEY AND VALUE DICTIONARY IN NSUSERDEFAULTS
+(void) initialize;
+(BOOL) isSparkDataInitialized;

//________________________________________________________________
//SPARKDATA GETTER METHODS
//SEARCHES THROUGH SPARKDATA FOR VALUE OF CORRESPONDING KEY
+(NSString *) getValueForKey: (NSString *) key;
+(NSDictionary *) getDictionaryForKey: (NSString *) key;

//________________________________________________________________
//SPARKDATA SETTER METHODS
//REPLACES A VALUE FOR A SPECIFIED KEY
+(void) setValue: (NSString *) newValue forKey: (NSString *) key;
+(void) setDictionary: (NSDictionary *) newDictionary forKey: (NSString *) key;
+(void) setKeyPairInNestedDictionaryNamed: (NSString *) name withValue: (NSString *) nestedValue andKey: (NSString *) nestedKey;

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

//USED TO CHECK TO SEE IF A KEY'S VALUE IS SET TO ANYTHING
+(BOOL) isValueNilForKey: (NSString *) key;

@end