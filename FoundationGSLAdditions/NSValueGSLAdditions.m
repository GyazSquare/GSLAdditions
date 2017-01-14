//
//  NSValueGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSValueGSLAdditions.h"

@implementation NSNumber (GSLAdditions)

- (NSNumber *)gsl_initWithCGFloat:(CGFloat)value {
#if CGFLOAT_IS_DOUBLE
    return [self initWithDouble:value];
#else
    return [self initWithFloat:value];
#endif
}

+ (NSNumber *)gsl_numberWithCGFloat:(CGFloat)value {
    return [[self alloc] gsl_initWithCGFloat:value];
}

- (CGFloat)gsl_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return self.doubleValue;
#else
    return self.floatValue;
#endif
}

@end
