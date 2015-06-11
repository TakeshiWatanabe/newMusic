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
    
    _musicTableView.delegate = self;
    _musicTableView.dataSource = self;
    
    
    
    // phpにアクセス(音楽系)
    NSString *phpMainViewUrl = [NSString stringWithFormat:@"http://takeshi-w.sakura.ne.jp/musicData.php"];
    
    // Requestを作成
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:phpMainViewUrl]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    // 取ってきた分配列に格納
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    _musicCell = array;
    
    
    
    // 配列の中身を最新順に並び変える
    //NSArray *newMusicCell;
    newMusicCell = [[NSMutableArray alloc] init];
    
    for(NSString *objData in [_musicCell reverseObjectEnumerator]){
        
    // newMusicCellの後ろにデータをどんどん格納
    [newMusicCell addObject:objData];
        
    }
    
}



//// 非同期
//- (void)connection:(NSURLConnection *)connection
//didReceiveResponse:(NSURLResponse *)response
//{
//    // データの長さを0で初期化
//    [self.receivedData setLength:0];
//}
//
//- (void)connection:(NSURLConnection *)connection
//    didReceiveData:(NSData *)data
//{
//    // 受信したデータを追加していく
//    [self.receivedData appendData:data];
//}
//
////- (void)connection:(NSURLConnection *)connection
////  didFailWithError:(NSError *error)
////{
////    NSLog(@"Error!");
////}
//
//- (void)connectionDifFinishLoading:(NSURLConnection *)connection
//{
//    NSLog(@"Did finish loading!");
//    
//    NSLog(@"data: \n%@", [[NSString alloc] initWithData:self.receivedData encoding:NSUTF8StringEncoding]);
//}



// 行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return newMusicCell.count;
    
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
    NSURL *jurl =[NSURL URLWithString:newMusicCell[indexPath.row][@"jacketUrl"]];
    NSURL *jurl2 =[NSURL URLWithString:newMusicCell[indexPath.row][@"userProfImage"]];
    
    // urlを画像データに変更
    NSData *imageData = [NSData dataWithContentsOfURL:jurl];
    NSData *imageData2 = [NSData dataWithContentsOfURL:jurl2];
    
    // 画像データを表示する
    musicImageView.image = [UIImage imageWithData:imageData];
    userImageView.image = [UIImage imageWithData:imageData2];
    
    
    
    // cell内にそれぞれ表示
    userNameLabel.text = newMusicCell[indexPath.row][@"userName"];
    artistNameLabel.text = newMusicCell[indexPath.row][@"artistName"];
    musicTittleLabel.text = newMusicCell[indexPath.row][@"musicTittle"];
    //commentLabel.text = _musicCell[indexPath.row][@"comment"];
    [goodButton setTitle:nil forState:UIControlStateNormal];
    [playButton setTitle:nil forState:UIControlStateNormal];
    [commentButton setTitle:nil forState:UIControlStateNormal];
    goodCountLabel.text = newMusicCell[indexPath.row][@"goodCount"];
    
    return cell;
    
}



// Goodをカウント
- (IBAction)good:(id)sender {
    
    //for (i = 0, i < count , i++){
    //int count;
    //number = count++;
    
    NSInteger i = number;
    i++;
    
    // superviewは階層を表す（superview]superviewは親の親を指定している）
    UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];
    
    // goodCountLabelに表示場所を指定
    UILabel *goodCountLabel = (UILabel *)[cell viewWithTag:10];
    
    kazuText= [NSString stringWithFormat:@"good%d件",i];
    [goodCountLabel setText:kazuText];
    
    

    // 後の作業
//    // カウント回数をサーバーに送る
//    NSString *phpUrl = [NSString stringWithFormat:@"http://takeshi-w.sakura.ne.jp/GetGoodCount.php?goodCount=%@",goodCountLabel];
//    
//    // リクエストを生成
//    NSMutableURLRequest *request;
//    request = [[NSMutableURLRequest alloc] init];
//    [request setHTTPMethod:@"POST"];
//    [request setURL:[NSURL URLWithString:phpUrl]];
//    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
//    [request setTimeoutInterval:30];
//    [request setHTTPShouldHandleCookies:FALSE];
//    [request setHTTPBody:[phpUrl dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // サーバーとの通信を行う
//    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    
//    // JSONをパース
//    NSDictionary *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
//    
//    // idの取得
//    int count = [array[@"goodCount"] intValue];
//
//    
//    
//    // goodCountLabelに表示場所を指定
//    goodCountLabel = (UILabel *)[cell viewWithTag:10];
//    
//    kazuText= [NSString stringWithFormat:@"good%d件",count];
//    [goodCountLabel setText:kazuText];
    
}



// 音を出す
- (IBAction)playButton:(id)sender {
    
    NSError *error = nil;
    
    // cellの行数を取得
    UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];
    
    int row = [self.musicTableView indexPathForCell:cell].row;
    NSLog(@"%d",row);
    
    NSURL *SoundUrl = [NSURL URLWithString:newMusicCell[row][@"previewUrl"]];
    
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
