//
//  PJSecondViewController.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-13.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "PJSecondViewController.h"

@interface PJSecondViewController ()

@end

@implementation PJSecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+100);
//    _scrollView.contentOffset
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)testCorrect:(id)sender {
    [self correctViewAvoidingKeyboardShelter:sender];
}
- (IBAction)editEnd:(id)sender {
    [sender resignFirstResponder];
}
@end
