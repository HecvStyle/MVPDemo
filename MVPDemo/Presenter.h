//
//  Presenter.h
//  MVPDemo
//
//  Created by 何巍 on 16/8/26.
//  Copyright © 2016年 Hecv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserViewProtocol.h"

@interface Presenter : NSObject


/**
 *  将一个实现了 UserViewProtocol 协议的对象绑定到 presenter上来
 *
 *  @param view 实现了UserViewProtocol的对象，一般来说，应该就是控制器，在MVP中，V 和 VC 共同组成UI 层。
 */
-(void)attachView:(id <UserViewProtocol>)view;

-(void)fetchData;
@end
