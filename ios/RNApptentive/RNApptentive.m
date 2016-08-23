//
//  RNApptentive.m
//  RNApptentive
//
//  Created by Denis Stepanov on 22.08.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

//
//  ApptentiveBridge.m
//  Aptentive
//
//  Created by Denis Stepanov on 22.08.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNApptentive.h"
#import "Apptentive.h"

@implementation RNApptentive


// The React Native bridge needs to know our module
RCT_EXPORT_MODULE()

- (NSDictionary*)parseDictionaryFromString:(id)value {
  NSDictionary *data;
  if ([value isKindOfClass:[NSDictionary class]]) {
    data = value;
  }
  else {
    //custom data needs to be parsed to NSDictionary - assuming json was passed
    NSData* data = [value dataUsingEncoding:NSUTF8StringEncoding];
    NSError *localError = nil;
    data = [NSJSONSerialization JSONObjectWithData:data options:0 error:&localError];
  }
  if (data != nil) {
    return data;
  }
  else
    return nil;
}

RCT_EXPORT_METHOD(squareMe:(int)number:(RCTResponseSenderBlock)callback) {
  callback(@[[NSNull null], [NSNumber numberWithInt:(number*number)]]);
}

RCT_EXPORT_METHOD(engage:(NSString*)eventLabel:(RCTResponseSenderBlock)callback) {
  UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;

  //    NSString* eventLabel = [arguments objectAtIndex:1];
  if([eventLabel isEqual:[NSNull null]]) {
    NSLog(@"Insufficient arguments to call engage - label is null");
    return;
  }
  BOOL shown = false;
  //    if (arguments.count == 2) {
  shown = [[Apptentive sharedConnection] engage:eventLabel fromViewController:controller];
  //    }
  //    else if (arguments.count == 3) {
  //      NSDictionary *customData = [self parseDictionaryFromString:[arguments objectAtIndex:2]];
  //      if (customData == nil) {
  //        NSLog(@"Improperly formed json or object for engage custom data");
  //        return;
  //      }
  //      shown = [[Apptentive sharedConnection] engage:eventLabel withCustomData:customData fromViewController:sampleViewController];
  //    }
  if (shown) {
    callback(@[[NSNumber numberWithBool:shown], [NSNull null]]);
  } else {
    callback(@[[NSNull null], [NSNumber numberWithBool:shown]]);
  }
  
  //  [[Apptentive sharedConnection] engage:@"completed_level" fromViewController:@"completed_level"];
  //  callback(@[[NSNull null], [NSNumber numberWithInt:(number*number)]]);
}
@end
