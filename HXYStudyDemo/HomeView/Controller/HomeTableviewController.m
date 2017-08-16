//
//  ViewController.m
//  HXYStudyDemo
//
//  Created by tzsoft on 2017/8/9.
//  Copyright © 2017年 TZSoft. All rights reserved.
//

#import "HomeTableviewController.h"

@interface HomeTableviewController ()
{
    NSArray *dataArr;
    NSArray *controllerArr;
}
@end

@implementation HomeTableviewController

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    dataArr = [NSArray arrayWithObjects:@"友盟分享",@"KeyChian", nil];
    controllerArr = [NSArray arrayWithObjects:@"ShareViewController",@"KeyChianViewController", nil];
    self.tableView.delegate =self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Table view data source

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellMark = @"home_Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellMark];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellMark];
    }
    cell.textLabel.text = [dataArr objectAtIndex: indexPath.row];

    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return dataArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    UIViewController *vc = [[NSClassFromString([controllerArr objectAtIndex:indexPath.row]) alloc]init];
    vc.title = [dataArr objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];

}

@end
