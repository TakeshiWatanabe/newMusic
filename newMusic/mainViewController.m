//
//  mainViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //userViewControllerから画面遷移
    [self dismissViewControllerAnimated:YES completion:nil];
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

- (IBAction)goodButton:(id)sender {
}

- (IBAction)listenButton:(id)sender {
}

- (IBAction)commentButton:(id)sender {
}
@end
