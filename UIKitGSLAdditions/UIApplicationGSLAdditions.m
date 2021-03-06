//
//  UIApplicationGSLAdditions.m
//  UIKitGSLAdditions
//

@import UIKit;

#import "UIApplicationGSLAdditions.h"

@implementation UIApplication (GSLAdditions)

static NSUInteger sDisableIdleTimerCount = 0;

- (void)gsl_enableIdleTimer {
    NSAssert1(NSThread.isMainThread, @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    NSAssert1(sDisableIdleTimerCount > 0, @"*** %s: sDisableIdleTimerCount is 0", __PRETTY_FUNCTION__);
    sDisableIdleTimerCount--;
    if (sDisableIdleTimerCount == 0) {
        self.idleTimerDisabled = NO;
    }
}

- (void)gsl_disableIdleTimer {
    NSAssert1(NSThread.isMainThread, @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    sDisableIdleTimerCount++;
    if (sDisableIdleTimerCount == 1) {
        self.idleTimerDisabled = YES;
    }
}

#if !TARGET_OS_TV
static NSUInteger sEnableNetworkActivityIndicatorCount = 0;

- (void)gsl_enableNetworkActivityIndicator {
    NSAssert1(NSThread.isMainThread, @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    sEnableNetworkActivityIndicatorCount++;
    if (sEnableNetworkActivityIndicatorCount == 1) {
        self.networkActivityIndicatorVisible = YES;
    }
}

- (void)gsl_disableNetworkActivityIndicator {
    NSAssert1(NSThread.isMainThread, @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    NSAssert1(sEnableNetworkActivityIndicatorCount > 0, @"*** %s: sEnableNetworkActivityIndicatorCount is 0", __PRETTY_FUNCTION__);
    sEnableNetworkActivityIndicatorCount--;
    if (sEnableNetworkActivityIndicatorCount == 0) {
        self.networkActivityIndicatorVisible = NO;
    }
}

- (void)gsl_clearAllNotifications {
    NSAssert1(NSThread.isMainThread, @"*** %s: must be called on the main thread", __PRETTY_FUNCTION__);
    self.applicationIconBadgeNumber = 1;
    self.applicationIconBadgeNumber = 0;
}
#endif

@end
