//
//  ElephantPlugin.h
//  Elephant
//
//  Created by blake on 6/3/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Adium/AIPlugin.h>


@interface ElephantPlugin : AIPlugin {

-(void)installPlugin
{
  
}

- (NSSet *)updateChat:(AIChat *)inChat keys:(NSSet *)inModifiedKeys silent:(BOOL)silent
{
  
}

}

@end
