//
//  CustomSegment.m
//  suning6iphone
//
//  Created by  liukun on 13-7-23.
//  Copyright (c) 2013年 liukun. All rights reserved.
//

#import "CustomSegment.h"
#import "UIView+Addition.h"
#import "Tool.h"

#define kSegmentLineImage               @"segment_line_vertical_gray.png"
#define kSegmentBottomLine              @"segment_line_Horizontal_orange.png"

@interface CustomSegment()
{
    BOOL  setupFinished;
}

@property (nonatomic, strong) NSArray *buttons;
@property (nonatomic, strong) NSArray *lines;


@end

/*********************************************************************/

@implementation CustomSegment

- (void)dealloc
{
    TT_RELEASE_SAFELY(_buttons);
    TT_RELEASE_SAFELY(_lines);
}

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 40)];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self commonSetup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self commonSetup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self commonSetup];
}

- (void)commonSetup
{
    if (setupFinished)
    {
        return;
    }
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;

    
    setupFinished = YES;
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(5, self.frame.size.height/2 - 0.5, self.frame.size.width-10, 0.5)];
    v.backgroundColor = UIColorFromRGB(0xdcdcdc);
    [self addSubview:v];
    [self bringSubviewToFront:v];
}

- (void)setItems:(NSArray *)items
{
    if (_items != items)
    {
        _items = items;
        
        [self setButtons];
        
        
    }
    
}

- (void)setCurrentIndex:(NSInteger)currentIndex
{
    if (currentIndex != _currentIndex)
    {
        _currentIndex = currentIndex;
        
        for (int i =0; i<[self.buttons count]; i ++) {
            UIButton *btn =(UIButton *)[self.buttons objectAtIndex:i];
            [btn setTitleColor:[self getBtnColorAtIndex:i] forState:UIControlStateNormal];
        }
        
        [UIView animateWithDuration:0.4 animations:^{
            NSInteger count = [_items count];
            CGFloat width = self.bounds.size.width / count;
            CGFloat height = self.bounds.size.height;
            
            CGFloat left =0;
            if (currentIndex > 0) {
                UIImageView *l = [self.lines objectAtIndex:currentIndex-1];
                left = l.right;
            }
        }];
    }
    
    if ([_delegate respondsToSelector:@selector(segment:didSelectAtIndex:)])
    {
        [_delegate segment:self didSelectAtIndex:_currentIndex];
    }
}

- (void)setButtons
{
    NSInteger count = [_items count];
    CGFloat width = self.bounds.size.width / count - 1;
    CGFloat height = self.bounds.size.height/2;

    
    UILabel *lab1=[Tool z_LabWithText:@"周期:" alignment:0 color:[UIColor whiteColor] fontSize:14];
    NSArray *titleArr=@[@"工作日",@"周末",@"每天"];
    for (int i=0; i<3; i++) {
        UIButton *btn=[Tool z_BtnWithTitle:titleArr[i] titleColor:[UIColor whiteColor] titleFont:14 bgImg:nil tag:100+i];
        [btn setTitleColor:[UIColor colorWithRed:0.17f green:0.71f blue:0.80f alpha:1.00f] forState:UIControlStateSelected];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    

    [self addSubview:lab1];
    UIButton *btn1=(UIButton*)[self viewWithTag:100];
    UIButton *btn2=(UIButton*)[self viewWithTag:101];
    UIButton *btn3=(UIButton*)[self viewWithTag:102];

    NSDictionary *constraintsView = NSDictionaryOfVariableBindings(lab1, btn1,btn2,btn3);
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btn1(40)]" options:0 metrics:nil views:constraintsView ]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-5-[lab1]-100-[btn1(46)]-7-[btn2(btn1)]-5-[btn3(btn1)]-5-|" options:0 metrics:nil views:constraintsView ]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btn2(40)]" options:0 metrics:nil views:constraintsView ]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[btn3(40)]" options:0 metrics:nil views:constraintsView ]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[lab1(40)]" options:0 metrics:nil views:constraintsView ]];

    

    
    NSMutableArray *btnArr = [NSMutableArray arrayWithCapacity:count];
    NSMutableArray *lineArr = [NSMutableArray arrayWithCapacity:count-1];
    for (int i = 0; i < [_items count]; i++)
    {
        NSString *title = [_items objectAtIndex:i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*width, height, width, height);
        [btn addTarget:self
                action:@selector(buttonTapped:)
      forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i+200;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.17f green:0.71f blue:0.80f alpha:1.00f] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btn.titleLabel.font
        = [UIFont systemFontOfSize:14.0];
        [btnArr addObject:btn];
        [self addSubview:btn];
        
        if (i > 0)
        {
            UIImageView *line = [[UIImageView alloc] init];
            line.frame = CGRectMake(btn.left, 12+height, 0.5, 15);
            line.backgroundColor = UIColorFromRGB(0xdcdcdc);
            
            [self addSubview:line];
            [lineArr addObject:line];
        }
    }
    self.buttons = btnArr;
    self.lines = lineArr;
}


- (UIColor *)getBtnColorAtIndex:(NSInteger)index
{
    if (self.currentIndex == index)
    {
        return [UIColor orangeColor];
    }
    else
    {
        return [UIColor darkGrayColor];;
    }
}


#pragma mark -
#pragma mark actions

- (void)buttonTapped:(UIButton*)sender
{
    //NSInteger index = [(UIButton *)sender tag];
    if(!sender.selected){
        sender.selected=YES;
    }
    else{
        sender.selected=NO;
    }
    //上排按钮
    UIButton *btn0=(UIButton*)[self viewWithTag:200];
    UIButton *btn6=(UIButton*)[self viewWithTag:200+6];
    int count=0;
    int disSelectedCount=0;
    for(int i=1;i<6;i++){
        UIButton *btn=(UIButton*)[self viewWithTag:i+200];
        if(!btn.selected){
            disSelectedCount++;
            
        }
        else{
            count++;
        }
    }
    
    for (int i=0; i<3; i++) {
        UIButton *btn=(UIButton*)[self viewWithTag:100+i];
            btn.selected=NO;
    }

    if(btn0.selected&&btn6.selected&&count==0){
        UIButton *btn=(UIButton*)[self viewWithTag:101];
        btn.selected=YES;
    }
    else if (!btn0.selected&&!btn6.selected&&disSelectedCount==0){
        UIButton *btn=(UIButton*)[self viewWithTag:100];
        btn.selected=YES;

    }
    else if (btn0.selected&&btn6.selected&&disSelectedCount==0){
        UIButton *btn=(UIButton*)[self viewWithTag:102];
        btn.selected=YES;

    }
}

-(void)btnClicked:(UIButton*)sender{
    
    for (int i=0; i<3; i++) {
        UIButton *btn=(UIButton*)[self viewWithTag:100+i];
        if(btn!=sender){
        btn.selected=NO;
        }
    }

    if(!sender.selected){
        sender.selected=YES;
    }
    else{
        sender.selected=NO;
    }
    //下排按钮
    for(int i=0;i<7;i++){
        UIButton *btn=(UIButton*)[self viewWithTag:i+200];
            btn.selected=NO;
    }

    switch (sender.tag) {
        case 100:{
            for(int i=1;i<6;i++){
                UIButton *btn=(UIButton*)[self viewWithTag:i+200];
                if(sender.selected){
                btn.selected=YES;
                }
                else{
                    btn.selected=NO;
                }
            }
        }
            break;
        
        case 101:{
            for(int i=0;i<7;i++){
                if(i==0||i==6){
                    UIButton *btn=(UIButton*)[self viewWithTag:i+200];
                    if(sender.selected){
                        btn.selected=YES;
                    }
                    else{
                        btn.selected=NO;
                    }
                }
            }
        }
            break;
            
        case 102:{
            for(int i=0;i<7;i++){
                UIButton *btn=(UIButton*)[self viewWithTag:i+200];
                if(sender.selected){
                    btn.selected=YES;
                }
                else{
                    btn.selected=NO;
                }
            }
        }
            break;
        default:
            break;
    }
    
}
@end
