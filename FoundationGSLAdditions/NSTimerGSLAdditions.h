//
//  NSTimerGSLAdditions.h
//  FoundationGSLAdditions
//

@import Foundation.NSTimer;

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (GSLAdditions)

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block;
+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block;

@end

@interface NSTimer (GSLDeprecated)

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo API_DEPRECATED("Use +gsl_timerWithTimeInterval:repeats:block: instead.", macos(10.6, 10.13), ios(8.0, 11.0), watchos(2.0, 4.0), tvos(9.0, 11.0));
+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo API_DEPRECATED("Use +gsl_scheduledTimerWithTimeInterval:repeats:block: instead.", macos(10.6, 10.13), ios(8.0, 11.0), watchos(2.0, 4.0), tvos(9.0, 11.0));

@end

NS_ASSUME_NONNULL_END
