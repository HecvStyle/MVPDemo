//
//  ViewController.m
//  MVPDemo
//
//  Created by 何巍 on 16/8/26.
//  Copyright © 2016年 Hecv. All rights reserved.
//

#import "ViewController.h"
#import "UserViewProtocol.h"
#import "Presenter.h"

@interface ViewController ()<UserViewProtocol,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic,strong) NSArray *friendlyUIData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;

@property (nonatomic,strong) Presenter *presenter;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	[self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];

	self.presenter = [Presenter new];
	[self.presenter attachView:self];
	[self.presenter fetchData];

}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.friendlyUIData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class]) forIndexPath:indexPath];
	cell.textLabel.text = [self.friendlyUIData[indexPath.row] valueForKey:@"name"];

	return cell;
}


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


#pragma UserViewProtocol

-(void)userViewDataSource:(NSArray*)data{
	
	self.friendlyUIData = data;
	[self.tableview reloadData];

}
-(void) showIndicator{
	self.indicator.hidden = NO;
}
-(void) hideIndicator{
	self.indicator.hidden = YES;
}
-(void) showEmptyView{
	UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Alert" message:@"show empty view" preferredStyle:UIAlertControllerStyleAlert];
	[alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
	[self presentViewController:alertView animated:YES completion:^{

	}];
}

@end
