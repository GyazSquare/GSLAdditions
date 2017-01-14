//
//  NSTimerGSLAdditions.h
//  FoundationGSLAdditions
//

@import Foundation.NSTimer;

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (GSLAdditions)

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;
+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo;

@end

NS_ASSUME_NONNULL_END
