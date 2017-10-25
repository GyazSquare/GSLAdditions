//
//  NSTimerGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSTimerGSLAdditions.h"

@implementation NSTimer (GSLAdditions)

#pragma mark - NSTimer (GSLAdditions)

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block {
    if (@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)) {
        return [self timerWithTimeInterval:interval repeats:repeats block:block];
    } else {
        return [self timerWithTimeInterval:interval target:self selector:@selector(gsl_invokeBlock:) userInfo:block repeats:repeats];
    }
}

+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *))block {
    if (@available(macOS 10.12, iOS 10.0, watchOS 3.0, tvOS 10.0, *)) {
        return [self scheduledTimerWithTimeInterval:interval repeats:repeats block:block];
    } else {
        return [self scheduledTimerWithTimeInterval:interval target:self selector:@selector(gsl_invokeBlock:) userInfo:block repeats:repeats];
    }
}

#pragma mark - Class extensions

+ (void)gsl_invokeBlock:(NSTimer *)timer {
    void (^block)(NSTimer *) = timer.userInfo;
    block(timer);
}

@end

@implementation NSTimer (GSLDeprecated)

#pragma mark - NSTimer (GSLDeprecated)

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [self gsl_timerWithTimeInterval:ti repeats:yesOrNo block:block];
}

+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [self gsl_scheduledTimerWithTimeInterval:ti repeats:yesOrNo block:block];
}

@end
