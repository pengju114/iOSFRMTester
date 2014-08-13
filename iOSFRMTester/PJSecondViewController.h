//
//  PJSecondViewController.h
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-13.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <pjcore/CoreViewController.h>

@interface PJSecondViewController : CoreViewController
- (IBAction)testCorrect:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
- (IBAction)editEnd:(id)sender;

@end
