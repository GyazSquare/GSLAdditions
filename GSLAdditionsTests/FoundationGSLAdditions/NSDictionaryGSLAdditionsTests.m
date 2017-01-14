//
//  NSDictionaryGSLAdditionsTests.m
//  GSLAdditions
//

@import XCTest;

#import "NSDictionaryGSLAdditions.h"

@interface NSDictionaryGSLAdditionsTests : XCTestCase
@end

@implementation NSDictionaryGSLAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gsl_containsKey {
    NSDictionary<NSString *, id> *dict = @{@"1": @(1), @"2": [NSNull null]};
    XCTAssertTrue([dict gsl_containsKey:@"1"]);
    XCTAssertTrue([dict gsl_containsKey:@"2"]);
    XCTAssertFalse([dict gsl_containsKey:@"3"]);
}

@end
