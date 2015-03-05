//
//  ViewController.m
//  SparkData
//
//  Created by Jude Murphy on 3/5/15.
//  Copyright (c) 2015 Spark Apps, LLC. All rights reserved.
//

#import "SparkData.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //INITIALIZES SPARKDATA
    [SparkData initialize];
    
    //SETS KEYS AND VALUES USING 1:1 CORRELATION IN MEMORY
    NSLog(@"********** MEMORY WITH NEW KEY/VALUE PAIRS ADDED **********");
    [SparkData setValue:@"Best Username Ever" forKey:@"Username"];
    [SparkData setValue:@"Best Password Ever" forKey:@"Password"];
    [SparkData printUsedMemory];
    
    //CLEARS THE VALUES ASSOCIATED WITH YOUR KEYS IN MEMORY
    NSLog(@"********** MEMORY WITH VALUES REMOVED **********");
    [SparkData clearSparkDataValues];
    [SparkData printUsedMemory];
    
    //REMOVES A KEY FROM YOUR CURRENT MEMORY MAPPING
    NSLog(@"********** MEMORY WITH USERNAME KEY REMOVED **********");
    [SparkData removeKey:@"Username"];
    [SparkData printUsedMemory];
    
    //SEARCHES A VALUE BASED ON A KEY FROM YOUR CURRENT MEMORY MAPPING
    NSLog(@"********** MEMORY WITH KEY SEARCHED **********");
    [SparkData setValue:@"Best Password Ever" forKey:@"Password"];
    NSLog(@"FOUND VALUE: %@ FOR KEY: %@", [SparkData getValueForKey: @"Password"], @"Password");
    [SparkData printUsedMemory];
    
    //ERASES ALL DATA IN MEMORY, BOTH KEYS AND VALUES
    NSLog(@"********** COMPLETELY CLEARED MEMORY **********");
    [SparkData dumpSparkData];
    [SparkData printUsedMemory];
    
    //METHOD SHOULD BE USED TO CHECK THE VALIDITY OF A VALUE PER KEY
    BOOL flag = [SparkData isValueNilForKey:@"Username"];
    NSLog(flag ? @"Yes" : @"No");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
