//
//  ApptentiveBridge.m
//  Aptentive
//
//  Created by Denis Stepanov on 22.08.16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "ApptentiveBridge.h"
#import "Apptentive.h"

@implementation ApptentiveBridge


// The React Native bridge needs to know our module
RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport {
  return @{@"greeting": @"Welcome to the DevDactic\n React Native Tutorial!"};
}

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
  UIViewController *sampleViewController = [UIViewController new];
//    NSString* eventLabel = [arguments objectAtIndex:1];
    if([eventLabel isEqual:[NSNull null]]) {
      NSLog(@"Insufficient arguments to call engage - label is null");
      return;
    }
    BOOL shown = false;
//    if (arguments.count == 2) {
      shown = [[Apptentive sharedConnection] engage:eventLabel fromViewController:sampleViewController];
//    }
//    else if (arguments.count == 3) {
//      NSDictionary *customData = [self parseDictionaryFromString:[arguments objectAtIndex:2]];
//      if (customData == nil) {
//        NSLog(@"Improperly formed json or object for engage custom data");
//        return;
//      }
//      shown = [[Apptentive sharedConnection] engage:eventLabel withCustomData:customData fromViewController:sampleViewController];
//    }
  callback(@[[NSNull null], [NSNumber numberWithBool:shown]]);
  
//  [[Apptentive sharedConnection] engage:@"completed_level" fromViewController:@"completed_level"];
//  callback(@[[NSNull null], [NSNumber numberWithInt:(number*number)]]);
}





//- (NSInteger)customAlert:(int)number {
//  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Test Message"
//                                                  message:@"This is a sample"
//                                                 delegate:nil
//                                        cancelButtonTitle:@"OK"
//                                        otherButtonTitles:nil];
//  [alert show];
//  [alert release];
//}

//RCT_EXPORT_METHOD(greet:(NSString *)name)
//{
//  NSLog(@"Hi, %@!", name);
//  [_bridge.eventDispatcher sendAppEventWithName:@"greeted"
//                                           body:@{ @"name": name }];
//}

@end