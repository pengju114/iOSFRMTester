//
//  UserService.h
//  iOSFRMTester
//
//  Created by 陆振文 on 14-10-23.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pjcore/CoreDatabase.h>

@interface UserService : CoreDatabase

-(NSArray *)listUsers;
-(NSInteger)addUser:(NSString *)name age:(int)age;
-(NSInteger)deleteUser:(int)userId;

@end
