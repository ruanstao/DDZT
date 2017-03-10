//
//  LoginViewController.m
//  DDZT
//
//  Created by ruanstao on 2017/3/7.
//  Copyright © 2017年 ruanstao. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)encry:(id)sender {

    self.publabel.text = [RTUtil encrypString:self.textF.text];
}

- (IBAction)decry:(id)sender {

    self.prilabel.text = [RTUtil decrypString:self.publabel.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
