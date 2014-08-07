//
//  PJTestViewController.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-4.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "PJTestViewController.h"
#import <pjcore/HttpResult.h>

@interface PJTestViewController ()

@end

@implementation PJTestViewController

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

- (IBAction)testHttpRequest:(id)sender {
    ASIHTTPRequest *req = [self requestWithRequestCode:1 url:@"http://192.168.1.103:8080/web-framework/client.service?service=10001&dataType=JSON" expectedDataFormat:kASIExpectedDataDictionary responseDataFormat:kASIResponseDataJSON extraData:nil parameterPairs:@"name",@"pengju",nil];
    
    [self asyncRequest:req];
}

- (IBAction)testConfirm:(id)sender {
    [self showMessage:[self showConfirmMessage:@"确定？" message:@"choose" delegate:nil]?@"YES":@"NO"];
}

- (IBAction)testInput:(id)sender {
    
    [self showMessage:[self showInputMessage:@"输入" initialText:@"" placeholder:@"input your text" secure:NO delegate:nil]];
}

-(void) httpDidResponse:(ASIHTTPRequest *)request withResult:(HttpResult *)result{
    if ([self isHttpSuccessAndNotify:result]) {
        _resultText.text = [[result responseData] description];
    }
}

-(void)httpDidFailure:(NSString *)reason{
    _resultText.text = reason;
}

- (IBAction)testProgressMessage:(id)sender {
    
    [self showProgressMessage:@"哈哈收到了后来说；哦i"];
}
@end
