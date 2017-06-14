//
//  ViewController.m
//  图表Chart
//
//  Created by SXF on 2017/5/5.
//  Copyright © 2017年 SXF. All rights reserved.
//

#import "ViewController.h"
#import "ChartViewController.h"
#import "BarChartViewController.h"
#import "CircleChartViewController.h"
#import "RadarChartViewController.h"
#import "ScatterChartViewController.h"
#import "PieChartViewController.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSArray *titleArr;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"图表大全";
    
    [self addtableView:self.view.bounds totableView:self.tableView];
    _titleArr = @[@"折线图",@"柱状图",@"圆圈图",@"雷达图",@"浮点图",@"饼状图"];
}

- (void)addtableView:(CGRect)frame totableView:(UITableView *)tableView{
    
    tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    tableView.backgroundColor = [UIColor lightGrayColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.rowHeight = 50.f;
    tableView.tableFooterView = [UIView new];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tableView];
}

#pragma mark - 必须实现的方法:
-(NSInteger)numberOfSectionsInTableView:(UITableView*)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.titleArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text  =_titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
    if (indexPath.row == 0)
    {
        ChartViewController *ChartVC = [ChartViewController new];
        
        [self.navigationController pushViewController:ChartVC animated:YES];
    }
    else if(indexPath.row==1)
    {
        BarChartViewController *keyVC = [BarChartViewController new];
        [self.navigationController pushViewController:keyVC animated:YES];
        
    }
    else if(indexPath.row==2)
    {
        CircleChartViewController *transVC = [CircleChartViewController new];
        
        [self.navigationController pushViewController:transVC animated:YES];
    }
    else if(indexPath.row==3)
    {
        RadarChartViewController  *springVC = [RadarChartViewController new];
        [self.navigationController pushViewController:springVC animated:YES];
    }
    else if(indexPath.row==4)
    {
        ScatterChartViewController *emitterVC = [ScatterChartViewController new];
        [self.navigationController pushViewController:emitterVC animated:YES];
    }
    else if(indexPath.row==5)
    {
        PieChartViewController *groupVC = [PieChartViewController new];
        [self.navigationController pushViewController:groupVC animated:YES];
    }
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
