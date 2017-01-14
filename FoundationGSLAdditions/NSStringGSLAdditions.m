//
//  NSStringGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSStringGSLAdditions.h"

@implementation NSString (GSLAdditions)

- (BOOL)gsl_isEqualToStringCaseInsensitive:(nullable NSString *)aString {
    return (aString && [self compare:aString options:(NSCaseInsensitiveSearch | NSLiteralSearch)] == NSOrderedSame);
}

- (BOOL)gsl_hasPrefixCaseInsensitive:(nullable NSString *)aString {
    return (aString && ([self rangeOfString:aString options:(NSCaseInsensitiveSearch | NSAnchoredSearch)].length > 0));
}

- (BOOL)gsl_hasSuffixCaseInsensitive:(nullable NSString *)aString {
    return (aString && ([self rangeOfString:aString options:(NSCaseInsensitiveSearch | NSBackwardsSearch | NSAnchoredSearch)].length > 0));
}

- (CGFloat)gsl_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return self.doubleValue;
#else
    return self.floatValue;
#endif
}

@end
