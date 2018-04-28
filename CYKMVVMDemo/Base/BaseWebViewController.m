//
//  BaseWebViewController.m
//  CYKMVVMDemo
//
//  Created by yukechen on 2018/4/23.
//  Copyright © 2018年 yukechen. All rights reserved.
//

#import "BaseWebViewController.h"
#import "YJWebViewProgressView.h"
#import <WebKit/WebKit.h>


@interface BaseWebViewController ()<WKNavigationDelegate>
@property (nonatomic,strong) WKWebView *webView;
@property (nonatomic,strong) YJWebViewProgressView *webProgressView;
@end

@implementation BaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.navigationDelegate = self;
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.webView.scrollView.backgroundColor = [UIColor whiteColor];
    self.webView.allowsBackForwardNavigationGestures = YES;
    [self.view addSubview:self.webView];
    [self.webView setNeedsUpdateConstraints];
    
    CGFloat progressBarHeight = 2.f;
    _webProgressView = [[YJWebViewProgressView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, progressBarHeight)];
    _webProgressView.progressBarColor = [UIColor orangeColor];
    _webProgressView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.view addSubview:_webProgressView];
    
    [self addObservers];
}

- (void)loadRequest:(NSString *)url
{
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:request];
}

- (void)addObservers {
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:NULL];
    [_webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    [_webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)dealloc {
    [_webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [_webView removeObserver:self forKeyPath:@"title"];
    [_webView.scrollView removeObserver:self forKeyPath:@"contentSize"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        if (object == self.webView) {
            [self.webProgressView setProgress:self.webView.estimatedProgress animated:YES];
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
        
    }else if ([keyPath isEqualToString:@"title"]) {
        if (object == self.webView) {
            self.title = self.webView.title;
        }
        else{
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else if ([keyPath isEqualToString:@"contentSize"]){
        if (object == self.webView.scrollView) {
            //                  self.scrollView.contentSize = self.webView.scrollView.contentSize;
        }else {
            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    
}
#pragma mark - WebView Delegate -
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    [self.webProgressView setProgress:0 animated:YES];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    
}



@end
