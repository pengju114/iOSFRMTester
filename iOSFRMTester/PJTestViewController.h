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
- (IBAction)testConfirm:(id)sender;
- (IBAction)testInput:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *resultText;
- (IBAction)testProgressMessage:(id)sender;
- (IBAction)testProgress:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *outer;
@property (weak, nonatomic) IBOutlet UIView *inner;
- (IBAction)testCorrectView:(id)sender;
- (IBAction)stopHttp:(id)sender;

@end
