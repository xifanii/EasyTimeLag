//
//  CityModel.h
//  EasyTimeLag
//
//  Created by 朱源浩 on 2017/6/21.
//  Copyright © 2017年 稀饭. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Mantle.h>

@interface CityModel : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong) NSString *cityId;

@property (nonatomic, strong) NSString *firstChar;

@property (nonatomic, strong) NSNumber *diffTime;

@property (nonatomic, strong) NSString *nationName;

@property (nonatomic, strong) NSString *cityName;

@property (nonatomic, strong) NSString *logo;

@end
