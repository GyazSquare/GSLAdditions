//
//  NSValueGSLAdditionsTests.m
//  GSLAdditions
//

@import Foundation;
@import XCTest;

#import "NSValueGSLAdditions.h"

@interface NSValueGSLAdditionsTests : XCTestCase
@end

@implementation NSValueGSLAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gsl_CGFloatValue {
    {
        NSNumber *number = @3.14f; // float
        XCTAssertEqual(sizeof(CGFloat), sizeof(number.gsl_CGFloatValue));
    }
    {
        NSNumber *number = @3.1415926535; // double
        XCTAssertEqual(sizeof(CGFloat), sizeof(number.gsl_CGFloatValue));
    }
}

- (void)test_gsl_numberWithCGFloat {
    {
        CGFloat value = 3.14f;
        XCTAssertEqualObjects(@(value), [NSNumber gsl_numberWithCGFloat:value]);
    }
    {
        CGFloat value = 3.1415926535;
        XCTAssertEqualObjects(@(value), [NSNumber gsl_numberWithCGFloat:value]);
    }
}

@end
