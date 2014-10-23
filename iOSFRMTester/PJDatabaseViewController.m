//
//  PJDatabaseViewController.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-10-23.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "PJDatabaseViewController.h"
#import "UserService.h"

@interface PJDatabaseViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)   NSMutableArray *userList;
@property(nonatomic,strong)   UserService    *service;

@end


@implementation PJDatabaseViewController

@synthesize userList;
@synthesize service;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.userList = [[NSMutableArray alloc] init];
    self.service  = [[UserService alloc] init];
    
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return userList.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *Identifier = @"UserItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Identifier];
        
        NSDictionary *info = [userList objectAtIndex:indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%d:%@(%d岁)",(int)indexPath.row+1,[info objectForKey:@"name"],[[info objectForKey:@"age"] intValue]];
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(void)refresh{
    [userList removeAllObjects];
    [userList addObjectsFromArray:[service listUsers]];
    [_tableView reloadData];
}

- (IBAction)addUser:(id)sender {
    
    NSString *name = [NSString stringWithFormat:@"Item %d",arc4random()];
    int age = arc4random() % 100;
    [service addUser:name age:age];
    [self refresh];
}

- (IBAction)deleteUser:(id)sender {
    if (userList.count>0) {
        int userId = [[[userList objectAtIndex:0] objectForKey:@"id"] intValue];
        [service deleteUser:userId];
        [self refresh];
    }
}

- (IBAction)addTenUser:(id)sender {
    for (int i=0; i<10; i++) {
        NSString *name = [NSString stringWithFormat:@"Item %d",arc4random()];
        int age = arc4random() % 100;
        [service addUser:name age:age];
    }
    [self refresh];
}
@end
