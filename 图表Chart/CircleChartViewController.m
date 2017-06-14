//
//  CircleChartViewController.m
//  图表Chart
//
//  Created by SXF on 2017/5/5.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "CircleChartViewController.h"

@interface CircleChartViewController ()<PNChartDelegate>

@property (nonatomic, strong)PNCircleChart * circleChart; //圆形状态

@end

@implementation CircleChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"圆形图";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    [self initWithCircleChart];//绘制圆圈
}
//圆圈⭕️
- (void)initWithCircleChart
{
    
    self.circleChart = [[PNCircleChart alloc] initWithFrame:CGRectMake(0,150.0, SCREEN_WIDTH, 100.0)
                                                      total:@100
                                                    current:@60
                                                  clockwise:YES];
    
    self.circleChart.backgroundColor = [UIColor clearColor];
    
    [self.circleChart setStrokeColor:[UIColor clearColor]];
    [self.circleChart setStrokeColorGradientStart:[UIColor blueColor]];
    [self.circleChart strokeChart];
    
    [self.view addSubview:self.circleChart];
}

#pragma - PNChartDelegate代理方法

- (void)userClickedOnLinePoint:(CGPoint)point lineIndex:(NSInteger)lineIndex{
    
    
    NSLog(@"point  = %@ lineIndex = %ld",NSStringFromCGPoint(point),lineIndex);
    
}
- (void)userClickedOnLineKeyPoint:(CGPoint)point
                        lineIndex:(NSInteger)lineIndex
                       pointIndex:(NSInteger)pointIndex{
    
    NSLog(@"Keypoint  = %@ lineIndex = %ld pointIndex = %ld",NSStringFromCGPoint(point),lineIndex,pointIndex);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
