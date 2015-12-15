//
//  UIView+Addition.h
//  robHMNew
//
//  Created by zhb on 15/7/6.
//  Copyright (c) 2015年 sequel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Addition)

@property (nonatomic) CGFloat left;


@property (nonatomic) CGFloat top;


@property (nonatomic) CGFloat right;


@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;


@property (nonatomic) CGFloat centerX;


@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGSize size;
- (void)removeAllSubviews;
- (void)addTopLine;
@end
