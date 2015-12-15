//
//  Tool.m
//  robHMNew
//
//  Created by zhb on 15/7/27.
//  Copyright (c) 2015年 sequel. All rights reserved.
//

#import "Tool.h"
#import "UIColor+SQ.h"
@implementation Tool

//************tabbar下的nav*************
/*+(UIButton*)NavWithTitleLabel:(NSString*)title leftBtn:(NSString*)leftImg rightBtn:(NSString*)rightTitle rightImg:(NSString*)rightImg :(UIView*)view backButton:(void(^)(id sender))backButton otherButton:(void(^)(id sender))otherButton{

    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIView *statusView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    statusView.backgroundColor= UIColorFromRGB(000000);
    navView.backgroundColor=UIColorFromRGB(000000);
    UIButton *backBtn=[MyCustomView creatButtonFrame:CGRectMake(4, 0, 150, 44) title:nil Type:UIButtonTypeCustom target:nil action:nil tag:100];
    [backBtn addSingleClick:^(id sender) {
        if(backButton){
            backButton(sender);
        }
    }];
    [backBtn setImage:[UIImage imageNamed:leftImg] forState:UIControlStateNormal];
//    [backBtn setTitle:@"  返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 100)];
    //[backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 80)];
    //backBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    
    
        UIButton *newBtn=[MyCustomView creatButtonFrame:CGRectMake(ScreenWidth-60, 2, 60, 42) title:nil Type:UIButtonTypeCustom target:nil action:nil tag:400];
        [newBtn addSingleClick:^(id sender) {
            if(otherButton){
                otherButton(sender);
            }
        }];
        if(rightImg!=nil){
        [newBtn setImage:[UIImage imageNamed:rightImg] forState:UIControlStateNormal];
            [newBtn setImageEdgeInsets:UIEdgeInsetsMake(0,0,0,0)];

        }
        else{
            [newBtn  setTitle:rightTitle forState:UIControlStateNormal];
            [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            newBtn.titleLabel.font=[UIFont systemFontOfSize:15];
            [newBtn setImageEdgeInsets:UIEdgeInsetsMake(10.0,10.0,10.0,10.0)];

        }
        [newBtn setContentMode:UIViewContentModeCenter];
    
        [navView addSubview:newBtn];
        
    
    
    UILabel* titleLabel=[MyCustomView creatLabelWithFrame:CGRectMake(0, 12, ScreenWidth, 20) text:title alignment:NSTextAlignmentCenter];
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.textColor=[UIColor whiteColor];
    
    [navView addSubview:backBtn];
    [navView addSubview:titleLabel];
    [view addSubview:statusView];
    [view addSubview:navView];
    return newBtn;
}

//*****************普通带右按钮nav****************
+(UIButton*)NavWithTitleLabel:(NSString*)title rightBtn:(NSString*)rightTitle :(UIView*)view backButton:(void(^)(id sender))backButton otherButton:(void(^)(id sender))otherButton{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIView *statusView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    statusView.backgroundColor= UIColorFromRGB(000000);
    navView.backgroundColor=UIColorFromRGB(000000);
    UIButton *backBtn=[MyCustomView creatButtonFrame:CGRectMake(4, 0, 150, 44) title:nil Type:UIButtonTypeCustom target:nil action:nil tag:100];
    [backBtn addSingleClick:^(id sender) {
        if(backButton){
            backButton(sender);
        }
    }];
    [backBtn setImage:[UIImage imageNamed:@"返回1"] forState:UIControlStateNormal];
    [backBtn setTitle:@"  返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 100)];
    [backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 80)];
    backBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    UIButton *newBtn;
    if(rightTitle!=nil){
        newBtn=[MyCustomView creatButtonFrame:CGRectMake(ScreenWidth-70, 3, 60, 39) title:rightTitle Type:UIButtonTypeCustom target:nil action:nil tag:400];
        [newBtn addSingleClick:^(id sender) {
            if(otherButton){
                otherButton(sender);
            }
        }];
        [newBtn setContentMode:UIViewContentModeCenter];
        [newBtn setImageEdgeInsets:UIEdgeInsetsMake(10.0,10.0,10.0,10.0)];
        [newBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        newBtn.titleLabel.font=[UIFont systemFontOfSize:15];
        [navView addSubview:newBtn];
        
    }
    
    UILabel* titleLabel=[MyCustomView creatLabelWithFrame:CGRectMake(0, 12, ScreenWidth, 20) text:title alignment:NSTextAlignmentCenter];
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.textColor=[UIColor whiteColor];
    
    [navView addSubview:backBtn];
    [navView addSubview:titleLabel];
    [view addSubview:statusView];
    [view addSubview:navView];
    return newBtn;
}
+(void)NavWithTitleLabel:(NSString*)title :(UIView*)view backButton:(void(^)(id sender))backButton{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UIView *statusView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 20)];
    UIView *navView=[[UIView alloc]initWithFrame:CGRectMake(0, 20, ScreenWidth, 44)];
    statusView.backgroundColor= UIColorFromRGB(000000);
    navView.backgroundColor=UIColorFromRGB(000000);
    UIButton *backBtn=[MyCustomView creatButtonFrame:CGRectMake(4, 0, 150, 44) title:nil Type:UIButtonTypeCustom target:nil action:nil tag:100];
    [backBtn addSingleClick:^(id sender) {
        if(backButton){
            backButton(sender);
        }
    }];
    [backBtn setImage:[UIImage imageNamed:@"返回1"] forState:UIControlStateNormal];
    [backBtn setTitle:@"  返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 100)];
    [backBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 80)];
    backBtn.titleLabel.font=[UIFont systemFontOfSize:15];
    
    UILabel* titleLabel=[MyCustomView creatLabelWithFrame:CGRectMake(0, 12, ScreenWidth, 20) text:title alignment:NSTextAlignmentCenter];
    titleLabel.font=[UIFont systemFontOfSize:18];
    titleLabel.textColor=[UIColor whiteColor];
    
    [navView addSubview:backBtn];
    [navView addSubview:titleLabel];
    [view addSubview:statusView];
    [view addSubview:navView];
}
 */

/** 开始记录页面点击次数  */

+(BOOL)isSuccess:(id)JSON{
    if([[JSON objectForKey:@"result"] isEqualToString:@"true"])
        return YES;
    else
        return NO;
}

+(UILabel*)z_LabWithText:(NSString *)text alignment:(CGFloat)position color:(UIColor*)color fontSize:(CGFloat)fontSize{
    UILabel *lab=[[UILabel alloc]init];
    [lab setBackgroundColor:[UIColor clearColor]];
//    [lab setFont:[UIFont systemFontOfSize:fontSize]];
    [lab setTextColor:color];
    lab.font =[UIFont fontWithName:@"Arial" size:fontSize];

    [lab setLineBreakMode:NSLineBreakByTruncatingTail];
    [lab setTranslatesAutoresizingMaskIntoConstraints:NO];
    lab.text = text;

    if(fontSize==0)
        lab.font = [UIFont fontWithName:@"Arial" size:12];
    else if (fontSize==1)
        [lab setFont:[UIFont boldSystemFontOfSize:12]];
    if(position==0)
        lab.textAlignment=NSTextAlignmentLeft;
    else if (position==1)
        lab.textAlignment=NSTextAlignmentCenter;
    else if(position==2)
        lab.textAlignment=NSTextAlignmentRight;

    if(color==nil)
        [lab setTextColor:[UIColor colorWithHexString:@"#666666"]];
    return lab;
}
+(UIButton*)z_BtnWithTitle:(NSString *)string titleColor:(UIColor*)color titleFont:(CGFloat)fontSize bgImg:(NSString*)imgStr tag:(NSInteger)tag{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.titleLabel.font=[UIFont systemFontOfSize:fontSize];
    [button setBackgroundImage:[UIImage imageNamed:imgStr] forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    if(tag!=0)
       [button setTag:tag];
    
    if(fontSize==0)
        button.titleLabel.font=[UIFont systemFontOfSize:12];
    else if (fontSize==1)
        button.titleLabel.font=[UIFont boldSystemFontOfSize:12];
    if(color==nil)
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

    return button;
}
+(UIImageView*)z_ImageWithName:(NSString *)imageStr{
    
    UIImageView *imgView = [[UIImageView alloc] init];
    if(imageStr!=nil)
    [imgView setImage:[UIImage imageNamed:imageStr]];
    [imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    return imgView;
    
}
+ (UITextField *)z_TextFieldWithStyle:(BOOL)NoneStyle place:(NSString *)string{
    UITextField *textfield         = [[UITextField alloc] init];
    textfield.placeholder          = string;
    textfield.borderStyle          = UITextBorderStyleRoundedRect;
    textfield.clearButtonMode      = UITextFieldViewModeWhileEditing;
    textfield.clearsOnBeginEditing = YES;//开始编辑时清空
    if(NoneStyle){
    textfield.borderStyle          = UITextBorderStyleNone;
    }
    return textfield;
}
+(UIView*)z_ViewWithColor:(UIColor*)color imageColor:(NSString*)imgStr{
    UIView *view=[[UIView alloc]init];
    view.translatesAutoresizingMaskIntoConstraints=NO;
    [view setBackgroundColor:color];
    if(imgStr)
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:imgStr]];
    return view;
}
+(UICollectionView*)z_CollectionViewWithDirection:(CGFloat)position registerClass:(UICollectionViewCell*)objectCell registerNib:(NSString *)nibName delegate:(id<UICollectionViewDelegate>)delegate dataSource:(id<UICollectionViewDataSource>)dataSource
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    if(position==0)
        layout.scrollDirection=UICollectionViewScrollDirectionVertical;//竖直
    else if (position==1)
        layout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    
    UICollectionView * collectionView  = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    if(objectCell!=nil)
        [collectionView registerClass:[objectCell class]forCellWithReuseIdentifier:[NSString stringWithFormat:@"%@",objectCell]];
    if(nibName!=nil)
        [collectionView registerNib:[UINib nibWithNibName:nibName bundle:nil] forCellWithReuseIdentifier:nibName];
    
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    return collectionView;
    
}
+(UIAlertController*)z_AlertViewWithTitle:(NSString *)title message:(NSString *)message cancelButton:(void(^)(UIAlertAction *action))cancelButton otherButton:(void(^)(UIAlertAction *action))otherButton{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        if(cancelButton){
            cancelButton(action);
        }
    }];
    //otherButtonTitle
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if(otherButton){
            otherButton(action);
        }
    }];
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
   // [self presentViewController:alertController animated:YES completion:nil];
    return alertController;
}
+(UIAlertController*)z_AlertSheetWithTitle:(NSString *)title message:(NSString *)message  deleteButton:(void(^)(UIAlertAction *action))deleteButton saveButton:(void(^)(UIAlertAction *action))saveButton{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];//@"保存或删除数据" message:@"删除数据将不可恢复"

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        if(deleteButton){
            deleteButton(action);
        }
    }];//Destructive“警示”样式为红色
    UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        if(saveButton){
            saveButton(action);
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [alertController addAction:archiveAction];
    
    
    
  
    
   // [self presentViewController:alertController animated:YES completion:nil];
    return alertController;
}



@end
