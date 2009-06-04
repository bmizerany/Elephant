//
//  ElephantPreferenceController.m
//  Elephant
//
//  Created by blake on 6/4/09.
//  Copyright 2009 Heroku Inc. All rights reserved.
//

#import "ElephantPreferenceController.h"


@implementation ElephantPreferenceController

-(NSString *)category { return @"Logging"; }
-(NSString *)label { return @"Elephant"; }
-(NSString *)nibName { return @"ElephantPreferences"; }

-(NSImage *)image {
  NSURL *url = [NSURL URLWithString:@"http://www.treehugger.com/happy-elephant-01.jpg"];
  return [[NSImage alloc] initWithContentsOfURL:url];
}

@end
