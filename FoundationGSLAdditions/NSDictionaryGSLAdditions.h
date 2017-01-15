//
//  NSDictionaryGSLAdditions.h
//  FoundationGSLAdditions
//

@import Foundation.NSDictionary;

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType> (GSLAdditions)

- (BOOL)gsl_containsKey:(KeyType)key;

@end

NS_ASSUME_NONNULL_END
