//
//  PJTestViewController.m
//  iOSFRMTester
//
//  Created by 陆振文 on 14-8-4.
//  Copyright (c) 2014年 pj. All rights reserved.
//

#import "PJTestViewController.h"
#import <pjcore/HttpResult.h>
#import <pjcore/UIView+Extension.h>

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
    if (IOSVersion >= 7.0) {
//        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
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
    [self closeProgress];
}

- (IBAction)testProgressMessage:(id)sender {
    
    [self showProgressMessage:[NSString stringWithFormat:@"哈哈收 %f 到",[[NSDate date] timeIntervalSince1970]]];
    [self performSelector:@selector(showProgressMessage:) withObject:@"你猜猜吧" afterDelay:0.8];
    [self performSelector:@selector(closeProgressMessage) withObject:nil afterDelay:2];
    [self performSelector:@selector(showProgressMessage:) withObject:@"新的文字" afterDelay:2.1];
    [self performSelector:@selector(closeProgressMessage) withObject:nil afterDelay:4];
    [self performSelector:@selector(closeProgressMessage) withObject:nil afterDelay:4.2];
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    v.backgroundColor = [UIColor redColor];
    
    [self performSelector:@selector(showProgressMessageWithView:) withObject:v afterDelay:1];
    
    [self performSelector:@selector(closeProgressMessage) withObject:nil afterDelay:2];
    
    [self performSelector:@selector(showProgressMessage:) withObject:@"新的文字" afterDelay:3];
    [self performSelector:@selector(closeProgressMessage) withObject:nil afterDelay:5];
    
}

- (IBAction)testProgress:(id)sender {
    [self showProgress:NO];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:2];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showProgress:YES];
        });
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:4];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showProgress:NO];
        });
    });
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [NSThread sleepForTimeInterval:6];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self closeProgress];
            [self closeProgress];
            [self closeProgress];
        });
    });
}

-(void)httpRequestCountDidChange:(int)count{
    if (count>0) {
        [self showProgress:NO];
    }else{
        [self closeProgress];
    }
}

- (IBAction)testCorrectView:(id)sender {
    [self correctViewAvoidingKeyboardShelter:sender];
}

- (IBAction)stopHttp:(id)sender {
    [self stopAllAsyncRequest];
}

@end
