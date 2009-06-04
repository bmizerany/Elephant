//
//  Elephant.h
//  Elephant
//
//  Created by blake on 6/3/09.
//  Copyright 2009 Heroku Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import <Adium/AIPlugin.h>
#import <Adium/AIChat.h>
#import <Adium/AIChatControllerProtocol.h>
#import <Adium/AISharedAdium.h>
#import <Adium/AIPreferencePane.h>
#import <Adium/AIPreferenceControllerProtocol.h>

#import "ElephantPreferencePane.h"

@interface Elephant : AIPlugin < AIChatObserver >
{
  NSString *URL;
}

-(NSString *)askForUrl;

@end
