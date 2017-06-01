//
//  ViewController.m
//  HYPDFDemo
//
//  Created by 胡杨 on 2017/6/1.
//  Copyright © 2017年 Hoo. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

#import <QuickLook/QuickLook.h>


@interface ViewController ()<QLPreviewControllerDelegate, QLPreviewControllerDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self QLPreviewLoadPDF];
}


- (void)QLPreviewLoadPDF {
    QLPreviewController *qlPreview = [[QLPreviewController alloc]init];
    qlPreview.dataSource = self; //需要打开的文件的信息要实现dataSource中的方法
    qlPreview.delegate = self;  //视图显示的控制
    qlPreview.view.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
    [self.navigationController pushViewController:qlPreview animated:YES];
}

#pragma mark - QLPreviewControllerDataSource
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"the_atomic_bomb" ofType:@"pdf"];
    
    return [NSURL fileURLWithPath:path];
}


- (void)webViewLoadPDF {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"the_atomic_bomb" ofType:@"pdf"];
    NSURL *pdfURL = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:pdfURL];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [webView loadRequest:request];
    [self.view addSubview:webView];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
