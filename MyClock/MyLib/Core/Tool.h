//
//  Tool.h
//  robHMNew
//
//  Created by zhb on 15/7/27.
//  Copyright (c) 2015年 sequel. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface Tool : UIView

+(BOOL)isSuccess:(id)JSON;
+ (void)beginLog:(NSString *)pageName;
+ (void)endLog:(NSString *)pageName;

+(void)NavWithTitleLabel:(NSString*)title :(UIView*)view backButton:(void(^)(id sender))backButton;

+(UIButton*)NavWithTitleLabel:(NSString*)title rightBtn:(NSString*)rightTitle :(UIView*)view backButton:(void(^)(id sender))backButton otherButton:(void(^)(id sender))otherButton;
/** tabbarNAV  */
+(UIButton*)NavWithTitleLabel:(NSString*)title leftBtn:(NSString*)leftImg rightBtn:(NSString*)rightTitle rightImg:(NSString*)rightImg :(UIView*)view backButton:(void(^)(id sender))backButton otherButton:(void(^)(id sender))otherButton;

//VFL下常用控件初始化
+(UILabel*)z_LabWithText:(NSString *)text alignment:(CGFloat)position color:(UIColor*)color                                                                                           fontSize:(CGFloat)fontSize;
+(UIButton*)z_BtnWithTitle:(NSString *)string titleColor:(UIColor*)color titleFont:(CGFloat)fontSize bgImg:(NSString*)imgStr                                                          tag:(NSInteger)tag;
+(UIImageView*)z_ImageWithName:(NSString                                                                                                                                              * )imageStr;
+ (UITextField *)z_TextFieldWithStyle:(BOOL)NoneStyle place:(NSString                                                                                                                 * )string;

+(UIView*)z_ViewWithColor:(UIColor*)color imageColor:(NSString                                                                                                                        * )imgStr;
+(UICollectionView*)z_CollectionViewWithDirection:(CGFloat)position registerClass:(UICollectionViewCell*)objectCell registerNib:(NSString *)nibName delegate:(id<UICollectionViewDelegate>)delegate dataSource:(id<UICollectionViewDataSource>)dataSource;/** CollectionView初始化  */
+(UIAlertController*)z_AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButton:(void(^)(UIAlertAction *action))cancelButton otherButton:(void(^)(UIAlertAction  * action))otherButton;

+(UIAlertController*)z_AlertSheetWithTitle:(NSString *)title message:(NSString *)message  deleteButton:(void(^)(UIAlertAction *action))deleteButton saveButton:(void(^)(UIAlertAction * action))saveButton;


@end
