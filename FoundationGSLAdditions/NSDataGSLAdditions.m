//
//  NSDataGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSDataGSLAdditions.h"

@implementation NSData (GSLAdditions)

- (NSString *)gsl_hexString {
    const unsigned char *bytes = self.bytes;
    NSUInteger length = self.length;
    NSMutableString *string = [NSMutableString stringWithCapacity:(length * 2)];
    for (NSUInteger i = 0; i < length; i++) {
        [string appendFormat:@"%02x", (unsigned)bytes[i]];
    }
    return string;
}

@end
