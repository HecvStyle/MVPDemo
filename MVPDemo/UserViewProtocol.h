//
//  UserViewProtocol.h
//  MVPDemo
//
//  Created by 何巍 on 16/8/26.
//  Copyright © 2016年 Hecv. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UserViewProtocol <NSObject>

-(void) userViewDataSource:(NSArray*)data;
-(void) showIndicator;
-(void) hideIndicator;
-(void) showEmptyView;

@end
