//
//  mainViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "mainViewController.h"
#import "searchViewController.h"
#import "newMainTableViewCell.h"

@interface mainViewController ()

@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //userViewControllerから画面遷移
    [self dismissViewControllerAnimated:YES completion:nil];
    
    _mainViewController.delegate = self;
    _mainViewController.dataSource = self;
    
    _coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア"];
    
    //カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithNibName:@"mainTableView" bundle:nil];
    
    //カスタムセルを使用しているTableViewに登録
    [self.mainViewController registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _coffeeArray.count;
}

//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    //セルの再利用
    newMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    cell.tittleLabel.text = _coffeeArray[indexPath.row];
    
    return cell;
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
