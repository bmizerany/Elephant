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
    URL = [self askForUrl];
    [[NSUserDefaults standardUserDefaults]
      setObject:URL
      forKey: @"url"
    ];
  }

  NSRunAlertPanel(@"url given", URL, @"OK", nil, nil);

  ElephantPreferencePane *preferences = 
    [[ElephantPreferencePane alloc] init];

  [[adium preferencePaneForPlugin:preferences] retain];
  
  [[adium chatController] registerChatObserver:self];
}

-(NSString *)askForUrl
{
  // Dialog code taken from http://kuoi.com/~kamikaze/read.php?id=178

  NSAlert *alert = [NSAlert
    alertWithMessageText:@"Please enter the URL or your Elephant Heroku App."
    defaultButton:@"OK"
    alternateButton:@"Cancel"
    otherButton:nil
    informativeTextWithFormat:@"Enter URL"
  ];
  
  NSTextField *input = [[NSTextField alloc] 
    initWithFrame:NSMakeRect(0, 0, 200, 24)
  ];
  
  [input setStringValue:@""];
  [alert setAccessoryView:input];
  
  NSInteger response = [alert runModal];
  if(response == NSAlertDefaultReturn)
  {
    [input validateEditing];
    return [input stringValue];
  }
  else if(response == NSAlertAlternateReturn)
  {
    return nil;
  }

  NSAssert1(NO, @"Invalid input dialog response %d", response);
  return nil;
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
