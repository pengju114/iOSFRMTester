//
//  UserService.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-10-23.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "UserService.h"

@interface UserService ()
@property(nonatomic,copy) NSString *tableName;

@end

@implementation UserService

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.databaseName = @"test.db";
        self.tableName = @"tb_test";
    }
    return self;
}

-(NSArray *)createSqls{
    NSString *sql = [NSString stringWithFormat:@"create table %@(id integer PRIMARY KEY AUTOINCREMENT,age integer,name text)",self.tableName];
    return [NSArray arrayWithObject:sql];
}


-(NSArray *)listUsers{
    NSString *sql = [NSString stringWithFormat:@"select * from %@",self.tableName];
    return [self executeQuery:sql];
}
-(NSInteger)addUser:(NSString *)name age:(int)age{
    NSString *sql = [NSString stringWithFormat:@"insert into %@(name,age) values(?,?)",self.tableName];
    return [self executeUpdate:sql,name,[NSNumber numberWithInt:age]]?1:0;
}
-(NSInteger)deleteUser:(int)userId{
    NSString *sql = [NSString stringWithFormat:@"delete from %@ as t where t.id=?",self.tableName];
    return [self executeUpdate:sql,[NSNumber numberWithInt:userId]]?1:0;
}


@end
