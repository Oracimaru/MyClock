//
//  UIColor+SQ.h
//  financesV2
//
//  Created by a on 14-4-22.
//  Copyright (c) 2014年 sequal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SQ)

+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)getRandomColor;/**< 随机颜色 */

@end
