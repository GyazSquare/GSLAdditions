//
//  NSValueGSLAdditions.h
//  FoundationGSLAdditions
//

@import CoreGraphics.CGBase;
@import Foundation.NSValue;

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (GSLAdditions)

- (NSNumber *)gsl_initWithCGFloat:(CGFloat)value;
+ (NSNumber *)gsl_numberWithCGFloat:(CGFloat)value;

@property (readonly) CGFloat gsl_CGFloatValue;

@end

NS_ASSUME_NONNULL_END
