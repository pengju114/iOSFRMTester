//
//  PJDatabaseViewController.h
//  iOSFRMTester
//
//  Created by 陆振文 on 14-10-23.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pjcore/CoreViewController.h>

@interface PJDatabaseViewController : CoreViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)addUser:(id)sender;
- (IBAction)deleteUser:(id)sender;
- (IBAction)addTenUser:(id)sender;

@end
