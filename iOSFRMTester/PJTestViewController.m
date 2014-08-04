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
    ASIHTTPRequest *req = [self requestWithRequestCode:1 url:@"http://192.168.3.210:8084/web/client.service?service=10001&dataType=JSON" expectedDataFormat:kASIExpectedDataString responseDataFormat:kASIResponseDataJSON extraData:nil parameterPairs:@"name",@"pengju",nil];
    
    [self asyncRequest:req];
}

-(void) httpDidResponse:(ASIHTTPRequest *)request withResult:(HttpResult *)result{
    if ([self isHttpSuccessAndNotify:result]) {
        [self showMessage:[result responseData]];
    }
}

-(void)httpDidFailure:(NSString *)reason{
    [self showMessage:reason];
}

@end
