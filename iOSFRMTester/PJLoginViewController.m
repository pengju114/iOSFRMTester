//
//  PJLoginViewController.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-14.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "PJLoginViewController.h"
#import <pjcore/ASIHTTPRequest.h>
#import <pjcore/HttpResult.h>

@interface PJLoginViewController ()

@end

@implementation PJLoginViewController

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

- (IBAction)login:(id)sender {
    ASIHTTPRequest *req = [self requestWithRequestCode:1 url:@"http://192.168.1.102:8080/web-framework/client.service?service=10003" expectedDataFormat:kASIExpectedDataDictionary responseDataFormat:kASIResponseDataJSON extraData:nil parameterPairs:@"name",@"pengju",@"password",@"762354",nil];
    [self asyncRequest:req];
}

- (IBAction)getUserInfo:(id)sender {
    ASIHTTPRequest *req = [self requestWithRequestCode:2 url:@"http://192.168.1.102:8080/web-framework/client.service?service=10004" expectedDataFormat:kASIExpectedDataDictionary responseDataFormat:kASIResponseDataJSON extraData:nil parameterPairs:nil];
    [self asyncRequest:req];
}

-(void)httpDidResponse:(ASIHTTPRequest *)request withResult:(HttpResult *)result{
    if (request.requestCode == 1) {// 登录
        if ([self isHttpSuccessAndNotify:result]) {
            [self showMessage:@"登录成功"];
        }
    }else if (request.requestCode == 2){// user info
        if ([self isHttpSuccessAndNotify:result]) {
            _result.text = [[[result dataList] firstObject] objectForKey:@"name"];
        }
    }
}

@end
