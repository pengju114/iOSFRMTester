//
//  PJTestViewController.h
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-4.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pjcore/CoreViewController.h>

@interface PJTestViewController : CoreViewController
- (IBAction)testHttpRequest:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *resultText;

@end
