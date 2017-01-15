//
//  NSStringGSLAdditions.h
//  FoundationGSLAdditions
//

@import CoreGraphics.CGBase;
@import Foundation.NSString;

NS_ASSUME_NONNULL_BEGIN

@interface NSString (GSLAdditions)

- (BOOL)gsl_isEqualToStringCaseInsensitive:(nullable NSString *)aString;
- (BOOL)gsl_hasPrefixCaseInsensitive:(nullable NSString *)aString;
- (BOOL)gsl_hasSuffixCaseInsensitive:(nullable NSString *)aString;

@property (readonly) CGFloat gsl_CGFloatValue;

@end

NS_ASSUME_NONNULL_END
