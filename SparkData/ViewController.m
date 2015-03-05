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
    [SparkData setKey: @"Username" withValue: nil];
    [SparkData setKey: @"Password" withValue: @"Chewymax12"];
    [SparkData printUsedMemory];
    
    //CLEARS THE VALUES ASSOCIATED WITH YOUR KEYS IN MEMORY
    NSLog(@"********** MEMORY WITH VALUES REMOVED **********");
    [SparkData clearSparkDataValues];
    [SparkData printUsedMemory];
    
    //REMOVES A KEY FROM YOUR CURRENT MEMORY MAPPING
    NSLog(@"********** MEMORY WITH KEY REMOVED **********");
    [SparkData removeKey:@"Username"];
    [SparkData printUsedMemory];
    
    //SEARCHES A VALUE BASED ON A KEY FROM YOUR CURRENT MEMORY MAPPING
    NSLog(@"********** MEMORY WITH KEY SEARCHED **********");
    NSLog(@"FOUND VALUE: %@ FOR KEY: %@", [SparkData getValueForKey: @"Password"], @"Password");
    [SparkData printUsedMemory];
    
    //ERASES ALL DATA IN MEMORY, BOTH KEYS AND VALUES
    NSLog(@"********** COMPLETELY CLEARED MEMORY **********");
    [SparkData dumpSparkData];
    [SparkData printUsedMemory];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
