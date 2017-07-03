//
//  CityModel.m
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/21.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

@synthesize cityId,firstChar,diffTime,nationName,cityName,logo;

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"cityId": @"id",
             @"firstChar": @"firstChar",
             @"diffTime": @"diffTime",
             @"nationName": @"nationName",
             @"cityName": @"cityName",
             @"logo": @"logo"
             };
}

@end
