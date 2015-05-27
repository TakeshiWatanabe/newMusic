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
    
    _mainViewController.delegate = self;
    _mainViewController.dataSource = self;
    
    
    
    // phpにアクセス
    NSString *phpMainViewUrl = [NSString stringWithFormat:@"http://192.168.33.200/GC5Team/newMusicOnlyServer/json.php"];
    
    // Requestを作成
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:phpMainViewUrl]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    //最新の音楽を取ってきた分配列に格納
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    _musicCell = array;
    
}



//行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _musicCell.count;
}



//セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    if(cell == nil){
        //セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
    }

    
    
    // image,button,labelをタグで管理する
    UIImageView *userImageView = (UIImageView *)[cell viewWithTag:1];
    UIImageView *musicImageView = (UIImageView *)[cell viewWithTag:2];
    UILabel *userNameLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *musicTittleLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *artistNameLabel = (UILabel *)[cell viewWithTag:5];
    UILabel *commentLabel = (UILabel *)[cell viewWithTag:6];
    UIButton *goodButton = (UIButton *)[cell viewWithTag:7];
    UIButton *playButton = (UIButton *)[cell viewWithTag:8];
    UIButton *commentButton = (UIButton *)[cell viewWithTag:9];
    
    
    
    //cellに表示
    NSURL *jurl =[NSURL URLWithString:_musicCell[indexPath.row][@"jacketUrl"]];
    //urlを画像データに変更
    NSData *imageData = [NSData dataWithContentsOfURL:jurl];
    //画像データを表示する
    musicImageView.image = [UIImage imageWithData:imageData];
    
    
    
    //cell内に各表示
    userImageView.image = [UIImage imageNamed:@"Tomorrowland23.jpg"];
    userNameLabel.text = _musicCell[indexPath.row][@"userName"];
    artistNameLabel.text = _musicCell[indexPath.row][@"artistName"];
    musicTittleLabel.text = _musicCell[indexPath.row][@"musicTittle"];
    //commentLabel.text = _musicCell[indexPath.row][@"comment"];
    [goodButton setTitle:nil forState:UIControlStateNormal];
    [playButton setTitle:nil forState:UIControlStateNormal];
    [commentButton setTitle:nil forState:UIControlStateNormal];
    
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
