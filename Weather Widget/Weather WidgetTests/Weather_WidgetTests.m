//
//  Weather_WidgetTests.m
//  Weather WidgetTests
//
//  Created by Chase McCoy on 7/25/15.
//  Copyright (c) 2015 Chase McCoy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "HelperClass.h"

@interface Weather_WidgetTests : XCTestCase

@end

@implementation Weather_WidgetTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}




- (void)testHelperClassNil {
  XCTAssertNil([HelperClass dateFromSecondsString:nil],
               @"dateFromSecondsString nil pass");
}

- (void)testHelperClassNil2 {
  XCTAssertNil([HelperClass integerStringFromDoubleString:nil],
               @"integerStringFromDoubleString nil pass");
  XCTAssertNil([HelperClass percentageStringFromDoubleString:nil],
               @"percentageStringFromDoubleString nill pass");
  XCTAssertNil([HelperClass dayOfWeekStringFromDate:nil],
               @"dayOfWeekStringFromDate nil pass");
  XCTAssertNil([HelperClass descriptionForPrecipIntensity:nil],
               @"descriptionForPrecipIntensity nil pass");
  XCTAssertNil([HelperClass cardinalDirectionFromBearingString:nil],
               @"cardinalDirectionFromBearingString nil pass");
  XCTAssertNil([HelperClass temperatureStringFromDoubleString:nil andFarenheitSetting:YES],
               @"temperatureStringFromDoubleString");
  XCTAssertNil([HelperClass speedStringFromDoubleString:nil andMilesSetting:YES],
               @"speedStringFromDoubleString");
}




- (void)testHelperClass {
  XCTAssertEqualObjects([NSDate dateWithTimeIntervalSince1970:178445],
                        [HelperClass dateFromSecondsString:@"178445"],
                        @"dateFromSecondsString pass");
  XCTAssertEqualObjects(@"105",
                        [HelperClass integerStringFromDoubleString:@"105.4"],
                        @"integerStringFromDoubleString round_down pass");
  XCTAssertEqualObjects(@"106",
                        [HelperClass integerStringFromDoubleString:@"105.5"],
                        @"integerStringFromDoubleString round_up pass");
  XCTAssertEqualObjects(@"10%",
                        [HelperClass percentageStringFromDoubleString:@"10"],
                        @"percentageStringFromDoubleString pass");
  XCTAssertEqualObjects(@"Sun",
                        [HelperClass dayOfWeekStringFromDate:[NSDate date]],
                        @"dayOfWeekStringFromDate pass");
  XCTAssertEqualObjects(@"Light",
                        [HelperClass descriptionForPrecipIntensity:@"0"],
                        @"none pass");
  XCTAssertEqualObjects(@"Very Light",
                        [HelperClass descriptionForPrecipIntensity:@"0.01"],
                        @"very_light pass");
  XCTAssertEqualObjects(@"Light",
                        [HelperClass descriptionForPrecipIntensity:@"0.02"],
                        @"light pass");
  XCTAssertEqualObjects(@"Moderate",
                        [HelperClass descriptionForPrecipIntensity:@"0.2"],
                        @"moderate pass");
  XCTAssertEqualObjects(@"Heavy",
                        [HelperClass descriptionForPrecipIntensity:@"1"],
                        @"heavy pass");
  XCTAssertEqualObjects(@"N",
                        [HelperClass cardinalDirectionFromBearingString:@"0"],
                        @"North_1 pass");
  XCTAssertEqualObjects(@"NNE",
                        [HelperClass cardinalDirectionFromBearingString:@"22.5"],
                        @"North_North_East pass");
  XCTAssertEqualObjects(@"NE",
                        [HelperClass cardinalDirectionFromBearingString:@"45"],
                        @"North_East pass");
  XCTAssertEqualObjects(@"NEE",
                        [HelperClass cardinalDirectionFromBearingString:@"67.5"],
                        @"North_East_East pass");
  XCTAssertEqualObjects(@"E",
                        [HelperClass cardinalDirectionFromBearingString:@"90"],
                        @"East pass");
  XCTAssertEqualObjects(@"SEE",
                        [HelperClass cardinalDirectionFromBearingString:@"112.5"],
                        @"South_East_East pass");
  XCTAssertEqualObjects(@"SE",
                        [HelperClass cardinalDirectionFromBearingString:@"135"],
                        @"South_East pass");
  XCTAssertEqualObjects(@"SSE",
                        [HelperClass cardinalDirectionFromBearingString:@"157.5"],
                        @"South_South_East pass");
  XCTAssertEqualObjects(@"S",
                        [HelperClass cardinalDirectionFromBearingString:@"180"],
                        @"South pass");
  XCTAssertEqualObjects(@"SSW",
                        [HelperClass cardinalDirectionFromBearingString:@"202.5"],
                        @"South_South_West pass");
  XCTAssertEqualObjects(@"SW",
                        [HelperClass cardinalDirectionFromBearingString:@"225"],
                        @"South_West pass");
  XCTAssertEqualObjects(@"SWW",
                        [HelperClass cardinalDirectionFromBearingString:@"247.5"],
                        @"South_West_West pass");
  XCTAssertEqualObjects(@"W",
                        [HelperClass cardinalDirectionFromBearingString:@"270"],
                        @"West pass");
  XCTAssertEqualObjects(@"NWW",
                        [HelperClass cardinalDirectionFromBearingString:@"292.5"],
                        @"North_West_West pass");
  XCTAssertEqualObjects(@"NW",
                        [HelperClass cardinalDirectionFromBearingString:@"315"],
                        @"North_West pass");
  XCTAssertEqualObjects(@"NNW",
                        [HelperClass cardinalDirectionFromBearingString:@"337.5"],
                        @"North_North_West pass");
  XCTAssertEqualObjects(@"N",
                        [HelperClass cardinalDirectionFromBearingString:@"359"],
                        @"North_2 pass");
  XCTAssertEqualObjects(@"98°",
                        [HelperClass temperatureStringFromDoubleString:@"98"
                                                   andFarenheitSetting:YES],
                        @"Farenheit pass");
  XCTAssertEqualObjects(@"36°",
                        [HelperClass temperatureStringFromDoubleString:@"98"
                                                   andFarenheitSetting:NO],
                        @"Celsius pass");
  XCTAssertEqualObjects(@"8.8 mph",
                        [HelperClass speedStringFromDoubleString:@"8.8"
                                                 andMilesSetting:YES],
                        @"mph pass");
  XCTAssertEqualObjects(@"14.2 km/h",
                        [HelperClass speedStringFromDoubleString:@"8.8"
                                                 andMilesSetting:NO],
                        @"km/h pass");
}

/*
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
*/

@end
