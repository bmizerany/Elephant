//
//  ElephantPreferenceController.m
//  Elephant
//
//  Created by blake on 6/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ElephantPreferenceController.h"


@implementation ElephantPreferenceController

-(NSString *)category { return @"Logging"; }
-(NSString *)label { return @"Elephant"; }
-(NSString *)nibName { return @""; }
-(NSImage *)image {
  NSURL *url = [NSURL URLWithString:@"http://www.treehugger.com/happy-elephant-01.jpg"];
  return [[NSImage alloc] initWithContentsOfURL:url];
}

@end
