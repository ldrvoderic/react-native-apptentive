//
//  RNApptentive.m
//  RNApptentive
//
//  Created by Luka Drvoderic on 25.07.17.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNApptentive.h"
#import "Apptentive.h"

@implementation RNApptentive

RCT_EXPORT_MODULE();

RCT_EXPORT_METHOD(engage:(NSString*)eventLabel) {
  UIViewController *controller = [UIApplication sharedApplication].keyWindow.rootViewController;
  [[Apptentive sharedConnection] engage:eventLabel fromViewController:controller];
}
@end
