//
//  BaseViewController.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.navigationController.viewControllers.count > 1)
    {
        [self showBackButton:YES];
    }else{
        [self showBackButton:[self isShowBackButton]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)isShowBackButton
{
    return NO;
}

- (void)showBackButton:(BOOL)show
{
    if (show)
    {
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backMenu"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBarAction:)];
        self.navigationItem.leftBarButtonItem = left;
    }else{
        self.navigationItem.leftBarButtonItem = nil;
    }

//    UIImage *img = mImageByName(@"backBtn");
//    self.backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
//    self.backBtn.frame = CGRectMake(0, (44 - img.size.height)/2-1, img.size.width, img.size.height);
//    self.backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//    [self.backBtn setTitle:@"返回" forState:UIControlStateNormal];
//    // Replace backItem with real back button image
//    [self.backBtn setBackgroundImage:img forState:UIControlStateNormal];
//    [self.backBtn setTitleColor:kBtnTitleNormalColor forState:UIControlStateNormal];
//    self.backBtn.titleLabel.font = [UIFont systemFontOfSize:0];
//    self.backBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
//    
//    [self.backBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
//    self.backBtn.showsTouchWhenHighlighted = YES;
//    
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backBtn];
}

- (void)leftBarAction:(UIBarButtonItem *)item
{
    if ([self.navigationController popViewControllerAnimated:YES] == nil) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
