//
//  UIApplicationGSLAdditions.h
//  UIKitGSLAdditions
//

@import UIKit.UIApplication;

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (GSLAdditions)

- (void)gsl_enableIdleTimer;
- (void)gsl_disableIdleTimer;

#if !TARGET_OS_TV
- (void)gsl_enableNetworkActivityIndicator;
- (void)gsl_disableNetworkActivityIndicator;

- (void)gsl_clearAllNotifications;
#endif

@end

NS_ASSUME_NONNULL_END
