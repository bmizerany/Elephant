//
//  ElephantPreferencePane.m
//  Elephant
//
//  Created by blake on 6/4/09.
//  Copyright 2009 Heroku. All rights reserved.
//

#import "ElephantPreferencePane.h"

@implementation ElephantPreferencePane

-(NSString *)label
{
  return @"Elephant";
}

-(NSString *)nibName
{
  return @"ElephantPreferencePane";
}

-(NSImage *)image
{
  NSURL *url = [NSURL URLWithString:@"http://www.treehugger.com/happy-elephant-01.jpg"];
  return [[NSImage alloc] initWithContentsOfURL:url];
}

-(NSString *)category
{
  return @"Search Elep";
}

@end
