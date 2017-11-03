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

- (BOOL)gsl_containsString:(NSString *)str {
    if (@available(macOS 10.10, iOS 8.0, watchOS 2.0, tvOS 9.0, *)) {
        return [self containsString:str];
    } else {
        return ([self rangeOfString:str].location != NSNotFound);
    }
}

- (BOOL)gsl_localizedCaseInsensitiveContainsString:(NSString *)str {
    if (@available(macOS 10.10, iOS 8.0, watchOS 2.0, tvOS 9.0, *)) {
        return [self localizedCaseInsensitiveContainsString:str];
    } else {
        NSRange rangeOfReceiverToSearch = NSMakeRange(0, self.length);
        return ([self rangeOfString:str options:NSCaseInsensitiveSearch range:rangeOfReceiverToSearch locale:NSLocale.currentLocale].location != NSNotFound);
    }
}

- (BOOL)gsl_localizedStandardContainsString:(NSString *)str {
    if (@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)) {
        return [self localizedStandardContainsString:str];
    } else {
        NSRange rangeOfReceiverToSearch = NSMakeRange(0, self.length);
        return ([self rangeOfString:str options:(NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch) range:rangeOfReceiverToSearch locale:NSLocale.currentLocale].location != NSNotFound);
    }
}

- (NSRange)gsl_localizedStandardRangeOfString:(NSString *)str {
    if (@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)) {
        return [self localizedStandardRangeOfString:str];
    } else {
        NSRange rangeOfReceiverToSearch = NSMakeRange(0, self.length);
        return [self rangeOfString:str options:(NSCaseInsensitiveSearch | NSDiacriticInsensitiveSearch) range:rangeOfReceiverToSearch locale:NSLocale.currentLocale];
    }
}

- (CGFloat)gsl_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    return self.doubleValue;
#else
    return self.floatValue;
#endif
}

- (NSString *)gsl_localizedUppercaseString {
    if (@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)) {
        return self.localizedUppercaseString;
    } else {
        return [self uppercaseStringWithLocale:NSLocale.currentLocale];
    }
}

- (NSString *)gsl_localizedLowercaseString {
    if (@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)) {
        return self.localizedLowercaseString;
    } else {
        return [self lowercaseStringWithLocale:NSLocale.currentLocale];
    }
}

- (NSString *)gsl_localizedCapitalizedString {
    if (@available(macOS 10.11, iOS 9.0, watchOS 2.0, tvOS 9.0, *)) {
        return self.localizedCapitalizedString;
    } else {
        return [self capitalizedStringWithLocale:NSLocale.currentLocale];
    }
}

@end
