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
    
    _coffeeArray = @[@"ブルーマウンテン",@"キリマンジャロ",@"ブラジル",@"コロンビア"];
    
    // NSLog(@"配列の中身の数:%d",_coffeeArray.count);
    
    _mainViewController.delegate = self;
    _mainViewController.dataSource = self;
    
//    //カスタマイズしたセルをテーブルビューにセット
//    UINib *nib = [UINib nibWithNibName:@"mainTableView" bundle:nil];
//    
//    
//    //カスタムセルを使用しているTableViewに登録
//    [self.mainViewController registerNib:nib forCellReuseIdentifier:@"Cell"];
    
}

//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _coffeeArray.count;
}

//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    //セルの再利用
//    newMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if(cell == nil){
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }

    
//    cell.userNameLabel.text = _coffeeArray[indexPath.row];
    
    // image,button,labelをタグで管理する
    UIImageView *userImageView = (UIImageView *)[cell viewWithTag:1];
    UIImageView *musicImageView = (UIImageView *)[cell viewWithTag:2];
    UILabel *userNameLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *tittleLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *commentLabel = (UILabel *)[cell viewWithTag:5];
    UIButton *goodButton = (UIButton *)[cell viewWithTag:6];
    UIButton *playButton = (UIButton *)[cell viewWithTag:7];
    UIButton *commentButton = (UIButton *)[cell viewWithTag:8];
    
    userImageView.image = [UIImage imageNamed:@"Tomorrowland26.jpg"];
    musicImageView.image = [UIImage imageNamed:@"10408703_807424855935242_5076302992490742974_n.jpg"];
    userNameLabel.text = @"ジェシー";
    tittleLabel.text = @"かわいい　やばい　欲しい　付き合いたい　結婚したい　早くアメリカ行きたい";
    commentLabel.text = @"I want you I want you I want you I want you I want youI want you";
    //[myBtn setTitle:@"ふが" forState:UIControlStateNormal];
    
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

@end
