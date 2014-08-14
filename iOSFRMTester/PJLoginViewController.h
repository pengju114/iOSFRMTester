//
//  PJLoginViewController.h
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-14.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pjcore/CoreViewController.h>

@interface PJLoginViewController : CoreViewController
@property (weak, nonatomic) IBOutlet UILabel *result;
- (IBAction)login:(id)sender;
- (IBAction)getUserInfo:(id)sender;

@end
