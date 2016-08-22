

#import "AptentiveBridge.h"

@implementation AptentiveBridge


// The React Native bridge needs to know our module
RCT_EXPORT_MODULE()

- (NSDictionary *)constantsToExport {
  return @{@"greeting": @"Welcome to the DevDactic\n React Native Tutorial!"};
}

RCT_EXPORT_METHOD(squareMe:(int)number:(RCTResponseSenderBlock)callback) {
  callback(@[[NSNull null], [NSNumber numberWithInt:(number*number)]]);
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