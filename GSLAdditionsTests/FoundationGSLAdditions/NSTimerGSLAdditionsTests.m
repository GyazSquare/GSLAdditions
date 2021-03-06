//
//  NSTimerGSLAdditionsTests.m
//  GSLAdditions
//

@import XCTest;

#import "NSTimerGSLAdditions.h"

@interface NSTimerGSLAdditionsTests : XCTestCase
@end

@implementation NSTimerGSLAdditionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test_gsl_timerWithTimeInterval {
    __block BOOL tick = NO;
    NSTimer *timer = [NSTimer gsl_timerWithTimeInterval:1 repeats:NO block:^(NSTimer *timer) {
        tick = YES;
    }];
    [timer fire];
    while (!tick) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
    __block NSInteger tickCount = 0;
    timer = [NSTimer gsl_timerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
        ++tickCount;
    }];
    [timer fire];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    while (tickCount < 3) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
}

- (void)test_gsl_scheduledTimerWithTimeInterval {
    __block BOOL tick = NO;
    NSTimer *timer = [NSTimer gsl_scheduledTimerWithTimeInterval:1 repeats:NO block:^(NSTimer *timer) {
        tick = YES;
    }];
    while (!tick) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
    __block NSInteger tickCount = 0;
    timer = [NSTimer gsl_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
        ++tickCount;
    }];
    while (tickCount < 3) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    [timer invalidate];
    XCTAssert(YES, @"Pass");
}

@end
