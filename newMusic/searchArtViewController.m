//
//  searchGenreViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/01.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchGenreViewController.h"

@interface searchGenreViewController ()

@end

@implementation searchGenreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // ボタンの作成
    UIButton *undoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // ボタンの画像
    [undoButton setImage:[UIImage imageNamed:@"sound.jpg"]
                forState:UIControlStateNormal];
    // ボタンの位置とサイズ
    [undoButton setFrame:CGRectMake(10, 80, 44, 44)];
    // ボタンタップ時のメソッド
    [undoButton addTarget:self
                   action:@selector(didTapUndo:)
         forControlEvents:UIControlEventTouchUpInside];
    // ボタンをviewに追加
    [self.view addSubview:undoButton];
}

// ボタンタップ時
- (IBAction)didTapUndo:(id)sender
{
    NSLog(@"undo button");
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

@end
