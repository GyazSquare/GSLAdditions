//
//  NSTimerGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSTimerGSLAdditions.h"

@implementation NSTimer (GSLAdditions)

+ (void)gsl_invokeBlock:(NSTimer *)timer {
    void (^block)(NSTimer *) = timer.userInfo;
    block(timer);
}

+ (NSTimer *)gsl_timerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [NSTimer timerWithTimeInterval:ti target:self selector:@selector(gsl_invokeBlock:) userInfo:block repeats:yesOrNo];
}

+ (NSTimer *)gsl_scheduledTimerWithTimeInterval:(NSTimeInterval)ti block:(void (^)(NSTimer *))block repeats:(BOOL)yesOrNo {
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(gsl_invokeBlock:) userInfo:block  repeats:yesOrNo];
}

@end
