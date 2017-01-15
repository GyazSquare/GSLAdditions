//
//  NSDictionaryGSLAdditions.m
//  FoundationGSLAdditions
//

@import Foundation;

#import "NSDictionaryGSLAdditions.h"

@implementation NSDictionary (GSLAdditions)

- (BOOL)gsl_containsKey:(id)key {
    return ([self objectForKey:key] != nil);
}

@end
