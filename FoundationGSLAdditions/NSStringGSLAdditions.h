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

- (BOOL)gsl_containsString:(NSString *)str;
- (BOOL)gsl_localizedCaseInsensitiveContainsString:(NSString *)str;

- (BOOL)gsl_localizedStandardContainsString:(NSString *)str;
- (NSRange)gsl_localizedStandardRangeOfString:(NSString *)str;

@property (readonly) CGFloat gsl_CGFloatValue;

@property (readonly, copy) NSString *gsl_localizedUppercaseString API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0));
@property (readonly, copy) NSString *gsl_localizedLowercaseString API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0));
@property (readonly, copy) NSString *gsl_localizedCapitalizedString API_AVAILABLE(macos(10.8), ios(6.0), watchos(2.0), tvos(9.0));

@end

NS_ASSUME_NONNULL_END
