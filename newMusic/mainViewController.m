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
    
    
    _mainViewController.delegate = self;
    _mainViewController.dataSource = self;
    
    
    
    // phpにアクセス(mainImage,musicTittle,artistName)
    NSString *phpMainViewUrl = [NSString stringWithFormat:@"http://takeshi-w.sakura.ne.jp/musicData.php"];
    
    // Requestを作成
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:phpMainViewUrl]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    // 取ってきた分配列に格納
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    //_musicCell = [[NSArray alloc] init];
    _musicCell = array;
    
}



// 行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _musicCell.count;
    
}



// セルに文字を表示する
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // 定数を宣言（static = 静的)
    static NSString *CellIdentifer = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer];
    
    if(cell == nil){
        
        // セルの初期化とスタイルの決定
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifer];
        
    }

    
    
    // image,button,labelをタグで管理する
    UIImageView *userImageView = (UIImageView *)[cell viewWithTag:1];
    UIImageView *musicImageView = (UIImageView *)[cell viewWithTag:2];
    UILabel *userNameLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *musicTittleLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *artistNameLabel = (UILabel *)[cell viewWithTag:5];
    //UILabel *commentLabel = (UILabel *)[cell viewWithTag:6];
    UIButton *goodButton = (UIButton *)[cell viewWithTag:7];
    UIButton *playButton = (UIButton *)[cell viewWithTag:8];
    UIButton *commentButton = (UIButton *)[cell viewWithTag:9];
    UILabel *goodCountLabel = (UILabel *)[cell viewWithTag:10];
    
    
    // cellに画像表示
    NSURL *jurl =[NSURL URLWithString:_musicCell[indexPath.row][@"jacketUrl"]];
    // urlを画像データに変更
    NSData *imageData = [NSData dataWithContentsOfURL:jurl];
    // 画像データを表示する
    musicImageView.image = [UIImage imageWithData:imageData];
    
    
    
    // cell内にそれぞれ表示
    userImageView.image = [UIImage imageNamed:@"usewrImage"];
    userNameLabel.text = _musicCell[indexPath.row][@"userName"];
    artistNameLabel.text = _musicCell[indexPath.row][@"artistName"];
    musicTittleLabel.text = _musicCell[indexPath.row][@"musicTittle"];
    //commentLabel.text = _musicCell[indexPath.row][@"comment"];
    [goodButton setTitle:nil forState:UIControlStateNormal];
    [playButton setTitle:nil forState:UIControlStateNormal];
    [commentButton setTitle:nil forState:UIControlStateNormal];
    //goodCountLabel.text = _musicCell[indexPath.row][@"goodCount"];
    
    return cell;
    
    
}



// Goodをカウント
- (IBAction)good:(id)sender {
    
//    total++;
//    [self.number.text setText:[NSString stringWithFormat: @"%d:件", total]];
    
        //goodボタンの回数カウント
//        NSInteger num1 = 1;
//        total = self.goodButton + 1;
//        NSLog(@"%@",goodButton);
//        NSString *print = [[NSString alloc] initWithFormat:@"%d!", num1];
//        self.goodCountLabel.text = print;
//    
}



// 音を出す
- (IBAction)playButton:(id)sender {
    
    NSError *error = nil;
    
    // cellの行数を取得
    UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];
    
    int row = [self.mainViewController indexPathForCell:cell].row;
    NSLog(@"%d",row);
    
    NSURL *SoundUrl = [NSURL URLWithString:_musicCell[row][@"previewUrl"]];
    
    // audioを再生するプレイヤーを作成する
    NSData *data = [[NSData alloc] initWithContentsOfURL:SoundUrl];
    if (_audioPlayer == nil) {
        _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        
        // エラーが起きたとき
        if (error !=nil) {
            //NSLog(@"Error %@",[error localizedDescription]);
            
        }else{
            
            // 自分自身をデリケートに設定
            [_audioPlayer setDelegate:self];
            [_musicPlay addObject:_audioPlayer];
            
        }
    }
    
    if (_audioPlayer.playing) {
        [_audioPlayer stop];
        _audioPlayer = nil;
        
    }else{
        
        [_audioPlayer play];
        
    }
}



- (IBAction)serchButton:(id)sender {
    
    //sampleImageViewControllerに画面遷移
    // インスタンス化
    sampleImageViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sampleImageViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}

- (IBAction)mainButton:(id)sender {
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
