//
//  BarChartViewController.m
//  图表Chart
//
//  Created by SXF on 2017/5/5.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "BarChartViewController.h"

@interface BarChartViewController ()<PNChartDelegate>

@property (nonatomic, strong)PNBarChart *barChart;//柱状

@end

@implementation BarChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"柱状图";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0 green:arc4random()%256/255.0 blue:arc4random()%256/255.0 alpha:1.0];
    [self initWithBarChart];//绘制柱状图
}
-(void)initWithBarChart //绘制柱状图
{
    
    static NSNumberFormatter *barChartFormatter;
    if (!barChartFormatter){
        barChartFormatter = [[NSNumberFormatter alloc] init];
        barChartFormatter.numberStyle = NSNumberFormatterCurrencyStyle;
        barChartFormatter.allowsFloats = NO;
        barChartFormatter.maximumFractionDigits = 0;
    }
    self.barChart = [[PNBarChart alloc] initWithFrame:CGRectMake(0, 135.0, SCREEN_WIDTH, 200.0)];
    self.barChart.backgroundColor = [UIColor clearColor];
    self.barChart.yLabelFormatter = ^(CGFloat yValue){
        return [barChartFormatter stringFromNumber:[NSNumber numberWithFloat:yValue]];
    };
    
    self.barChart.yChartLabelWidth = 20.0;
    self.barChart.chartMarginLeft = 30.0;
    self.barChart.chartMarginRight = 10.0;
    self.barChart.chartMarginTop = 5.0;
    self.barChart.chartMarginBottom = 10.0;
    self.barChart.labelMarginTop = 5.0;
    self.barChart.showChartBorder = YES;
    [self.barChart setXLabels:@[@"2",@"3",@"4",@"5",@"2",@"3",@"4",@"5"]];
    [self.barChart setYValues:@[@10.82,@1.88,@6.96,@33.93,@10.82,@1.88,@6.96,@33.93]];
    [self.barChart setStrokeColors:@[PNGreen,PNLightBlue,PNRed,PNMauve,PNBrown,PNYellow,PNDarkBlue,PNBlue]];
    //是否显示梯度棒
    self.barChart.isGradientShow = NO;
    //是否显示数字
    self.barChart.isShowNumbers = NO;
    
    [self.barChart strokeChart];
    
    self.barChart.delegate = self;
    
    [self.view addSubview:self.barChart];
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



@end
