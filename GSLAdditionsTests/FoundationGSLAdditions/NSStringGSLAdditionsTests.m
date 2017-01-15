//
//  NSStringGSLAdditionsTests.m
//  GSLAdditions
//

@import XCTest;

#import "NSStringGSLAdditions.h"

@interface NSStringGSLAdditionsTests : XCTestCase
@end

@implementation NSStringGSLAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gsl_isEqualToStringCaseInsensitive {
    // nil
    XCTAssertFalse([@"A" gsl_isEqualToStringCaseInsensitive:nil]);
    // A
    XCTAssertTrue([@"A" gsl_isEqualToStringCaseInsensitive:@"A"]);
    XCTAssertTrue([@"A" gsl_isEqualToStringCaseInsensitive:@"a"]);
    XCTAssertFalse([@"A" gsl_isEqualToStringCaseInsensitive:@"B"]);
    XCTAssertFalse([@"A" gsl_isEqualToStringCaseInsensitive:@"b"]);
    // Ä
    XCTAssertTrue([@"Ä" gsl_isEqualToStringCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"Ä" gsl_isEqualToStringCaseInsensitive:@"ä"]);
    // A + umlaut
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertEqual([A caseInsensitiveCompare:@"Ä"], NSOrderedSame);
    XCTAssertFalse([A gsl_isEqualToStringCaseInsensitive:@"Ä"]);
}

- (void)test_gsl_hasPrefixCaseInsensitive {
    // nil
    XCTAssertFalse([@"AB" gsl_hasPrefixCaseInsensitive:nil]);
    // empty
    XCTAssertFalse([@"AB" gsl_hasPrefixCaseInsensitive:@""]);
    // length
    XCTAssertFalse([@"AB" gsl_hasPrefixCaseInsensitive:@"ABC"]);
    // AB
    XCTAssertTrue([@"AB" gsl_hasPrefixCaseInsensitive:@"A"]);
    XCTAssertTrue([@"AB" gsl_hasPrefixCaseInsensitive:@"a"]);
    XCTAssertFalse([@"AB" gsl_hasPrefixCaseInsensitive:@"B"]);
    XCTAssertFalse([@"AB" gsl_hasPrefixCaseInsensitive:@"b"]);
    // ÄB
    XCTAssertTrue([@"ÄB" gsl_hasPrefixCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"ÄB" gsl_hasPrefixCaseInsensitive:@"ä"]);
    // A + umlaut + B
    NSString *AB = [NSString stringWithUTF8String:"\x41\xCC\x88\x42"];
    XCTAssertTrue([AB gsl_hasPrefixCaseInsensitive:@"Ä"]);
    // Fix on Rev.79
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertTrue([@"Ä" gsl_hasPrefixCaseInsensitive:A]);
}

- (void)test_gsl_hasSuffixCaseInsensitive {
    // nil
    XCTAssertFalse([@"BA" gsl_hasSuffixCaseInsensitive:nil]);
    // empty
    XCTAssertFalse([@"BA" gsl_hasSuffixCaseInsensitive:@""]);
    // length
    XCTAssertFalse([@"BA" gsl_hasSuffixCaseInsensitive:@"CBA"]);
    // BA
    XCTAssertTrue([@"BA" gsl_hasSuffixCaseInsensitive:@"A"]);
    XCTAssertTrue([@"BA" gsl_hasSuffixCaseInsensitive:@"a"]);
    XCTAssertFalse([@"BA" gsl_hasSuffixCaseInsensitive:@"B"]);
    XCTAssertFalse([@"BA" gsl_hasSuffixCaseInsensitive:@"b"]);
    // BÄ
    XCTAssertTrue([@"BÄ" gsl_hasSuffixCaseInsensitive:@"Ä"]);
    XCTAssertTrue([@"BÄ" gsl_hasSuffixCaseInsensitive:@"ä"]);
    // B + A + umlaut
    NSString *BA = [NSString stringWithUTF8String:"\x42\x41\xCC\x88"];
    XCTAssertTrue([BA gsl_hasSuffixCaseInsensitive:@"Ä"]);
    // Fix on Rev.79
    NSString *A = [NSString stringWithUTF8String:"\x41\xCC\x88"];
    XCTAssertTrue([@"Ä" gsl_hasPrefixCaseInsensitive:A]);
}

- (void)test_gsl_CGFloatValue {
#if CGFLOAT_IS_DOUBLE
    // overflow
    NSString *max = @"1.8e+308";
    XCTAssertEqual((double)max.gsl_CGFloatValue, HUGE_VAL);
    // underflow
    NSString *min = @"-1.8e+308";
    XCTAssertEqual((double)min.gsl_CGFloatValue, -HUGE_VAL);
    // invalid
    XCTAssertEqual((double)@"a1.0".gsl_CGFloatValue, 0.0);
    // 1.0
    XCTAssertEqual((double)@"1.0".gsl_CGFloatValue, 1.0);
    XCTAssertEqual((double)@"1.0a".gsl_CGFloatValue, 1.0);
#else
    // overflow
    NSString *max = @"3.5e+38";
    XCTAssertEqual((double)max.gsl_CGFloatValue, HUGE_VAL);
    // underflow
    NSString *min = @"-3.5e+38";
    XCTAssertEqual((double)min.gsl_CGFloatValue, -HUGE_VAL);
    // invalid
    XCTAssertEqual((double)@"a1.0".gsl_CGFloatValue, 0.0);
    // 1.0
    XCTAssertEqual((double)@"1.0".gsl_CGFloatValue, 1.0);
    XCTAssertEqual((double)@"1.0a".gsl_CGFloatValue, 1.0);
#endif
}

@end
