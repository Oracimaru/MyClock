//
//  UIImage+SQ.h
//  financesV2
//
//  Created by a on 14-4-22.
//  Copyright (c) 2014年 sequal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SQ)
/**
 *  加载项目中的所有图片
 *
 *  @param name 文件名
 *
 *  @return 一个新的图片对象
 */
+ (UIImage *)imageWithName:(NSString *)name;
/**
 *  返回能够自由拉伸不变形的图片
 *
 *  @param name 文件名
 *
 *  @return 能够自由拉伸不变形的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;
+ (UIImage *)streImageNamed:(NSString *)imageName;
/**  以颜色创建image */
+ (UIImage*) createImageWithColor: (UIColor*) color;

@end
