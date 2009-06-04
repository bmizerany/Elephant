//
//  Elephant.m
//  Elephant
//
//  Created by blake on 6/3/09.
//  Copyright 2009 Heroku Inc. All rights reserved.
//

#import "Elephant.h"

@implementation Elephant

-(void)installPlugin
{
  URL = [[NSUserDefaults standardUserDefaults] stringForKey:@"url"];
  
  if(!URL)
  {
    NSRunAlertPanel(
      @"Information Needed",
      @"You'll need to specify a URL in Preferences -> Advanced -> Elephant",
      @"OK",
      nil,
      nil
    );
  }

  [[ElephantPreferenceController preferencePaneForPlugin:self] retain];
  
  [[adium chatController] registerChatObserver:self];
}

-(NSSet *)updateChat:(AIChat *)inChat keys:(NSSet *)inModifiedKeys silent:(BOOL)silent
{
  NSString *post = @"key1=val1&key2=val2";
  NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

  NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

  NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
  [request setURL:[NSURL URLWithString:@"http://localhost:4567"]];
  [request setHTTPMethod:@"POST"];
  [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
  [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  [request setHTTPBody:postData];
  
  NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:request delegate:self];
  if(!connectionResponse)
  {
    NSLog(@"connection didn't make it");
  }
  
  return inModifiedKeys;
}

@end
