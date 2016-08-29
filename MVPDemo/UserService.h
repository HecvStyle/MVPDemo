//
//  Service.h
//  MVPDemo
//
//  Created by 何巍 on 16/8/26.
//  Copyright © 2016年 Hecv. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessHandler)(NSDictionary *dic);
typedef void(^FailHandler)(NSDictionary *dic);
/**
 *  Service 用来做数据获取工作等，发起网络请求，并且返回数据给Presenter，这个算是Model，但我准备用字典做业务交付
 */
@interface UserService : NSObject

-(void)getUserInfosSuccess:(SuccessHandler )success andFail:(FailHandler) fail;

@end
