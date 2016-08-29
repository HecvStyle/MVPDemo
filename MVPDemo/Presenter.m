//
//  Presenter.m
//  MVPDemo
//
//  Created by 何巍 on 16/8/26.
//  Copyright © 2016年 Hecv. All rights reserved.
//

#import "Presenter.h"
#import "UserService.h"

@interface Presenter()

@property (nonatomic,strong) UserService *userService;

@property (nonatomic,weak) id<UserViewProtocol> attachView;

@end
@implementation Presenter


-(void)attachView:(id <UserViewProtocol>)view{
	self.attachView = view;
	self.userService  = [UserService new];
}

// 这个是对外的入口，通过这个入口，实现多个对内部的操作，外部只要调用这个接口就可以了
-(void)fetchData{
	[self getUserDatas];
}

// 对内的业务逻辑方法，
-(void)getUserDatas{
	[self.attachView showIndicator];
	[_userService getUserInfosSuccess:^(NSDictionary *dic) {
		[self.attachView hideIndicator];
		NSArray *userArr =[dic valueForKey:@"data"];

		if ([self processOriginDataToUIFriendlyData:userArr].count == 0) {
			[self.attachView showEmptyView];
		}
		[self.attachView userViewDataSource:[self processOriginDataToUIFriendlyData:userArr]];
	} andFail:^(NSDictionary *dic) {

	}];
}

// 如果数据比较复杂，或者UI渲染的数据只是其中很少一部分，将原数据处理，输出成UI渲染的数据。（题外话：这里其实还可以使用协议，提供不同的数据格式输出。）
-(NSArray *)processOriginDataToUIFriendlyData:(NSArray *) originData{

	NSMutableArray *friendlyUIData = [NSMutableArray new];
	for (NSDictionary *dic in originData) {
		if ([[dic valueForKey:@"gender"] isEqualToString:@"males"]) {
			[friendlyUIData addObject:dic];
		}
	}
	return friendlyUIData;
}


@end
