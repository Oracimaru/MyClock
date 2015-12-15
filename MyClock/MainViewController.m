//
//  MainViewController.m
//  MyClock
//
//  Created by su on 15/12/7.
//  Copyright (c) 2015年 YuBo. All rights reserved.
//

#import "MainViewController.h"
#import "ClockViewController.h"
#import "MyHomeViewController.h"
#import "CustomSegment.h"

@interface MainViewController ()<CustomSegmentDelegate>
@property(nonatomic,strong)CustomSegment *segment;/**< 切换器   */

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.view addSubview:self.segment];
    
    
}
#pragma mark 为爱定时
- (IBAction)clockClick:(id)sender {
    ClockViewController *detail=[[ClockViewController alloc]init];
    [self.navigationController pushViewController:detail  animated:YES];
    

    
}
#pragma mark 我的领域
- (IBAction)MyHomeClick:(id)sender {
    
    MyHomeViewController *detail=[[MyHomeViewController alloc]init];
    [self.navigationController pushViewController:detail  animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (CustomSegment *)segment
{
    if (!_segment) {
        _segment = [[CustomSegment alloc] initWithFrame:CGRectMake(10, 64, self.view.frame.size.width-20, 80)];
        _segment.delegate=self;
        
        [_segment setItems:[NSArray arrayWithObjects:@"周日",@"周一",@"周二",@"周三",@"周四",@"周五",@"周六", nil]];
        //        _segment.currentIndex=1;
        
    }
    return _segment;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
