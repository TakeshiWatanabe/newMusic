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
    
    
    
    //サーバーにアクセス
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
    
    
    
    // 非同期処理(userImage)
    if ([_imageCache objectForKey:indexPath]) {
        
        // すでにキャッシュしてある場合
        //cell.imageView.image = [UIImage imageNamed:newMusicCell[indexPath.row]];
        //[musicImageView setImage:[_imageCache2 objectForKey:indexPath]];
        
    } else {
        //if (_musicTableView.dragging == NO && _musicTableView.decelerating == NO)
        {
            
            // URLから画像を表示
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_queue_t q_main = dispatch_get_main_queue();
            
            //cell.imageView.image = nil;
            dispatch_async(q_global, ^{
                
                // どこに画像を表示するか指定
                UIImageView *userImageView = (UIImageView *)[cell viewWithTag:1];
                
                // cellに画像表示
                NSURL *jurl =[NSURL URLWithString:newMusicCell[indexPath.row][@"userProfImage"]];
                
                // urlを画像データに変更
                NSData *imageData = [NSData dataWithContentsOfURL:jurl];
                
                dispatch_async(q_main, ^{
                    
                    //[cell.imageView setImage:(UIImage *)musicImageView.image];
                    if(imageData !=nil){
                        
                        // 画像表示位置指定
                        userImageView.image = [UIImage imageWithData:imageData];
                    }
                    
                });
            });
        }
    }
    
    
    
    // 非同期処理(アーティスト画像)
    if ([_imageCache2 objectForKey:indexPath]) {
        
        // すでにキャッシュしてある場合
        //cell.imageView.image = [UIImage imageNamed:newMusicCell[indexPath.row]];
        //[musicImageView setImage:[_imageCache2 objectForKey:indexPath]];
        
    } else {
        //if (_musicTableView.dragging == NO && _musicTableView.decelerating == NO)
        {
            
            // URLから画像を表示
            dispatch_queue_t q_global = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
            dispatch_queue_t q_main = dispatch_get_main_queue();
            
            dispatch_async(q_global, ^{
                UIImageView *musicImageViewTmp = (UIImageView *)[cell viewWithTag:2];
                
                // どこに画像を表示するか指定
                NSURL *jurl2 =[NSURL URLWithString:newMusicCell[indexPath.row][@"jacketUrl"]];
                
                // urlを画像データに変更
                NSData *imageData2 = [NSData dataWithContentsOfURL:jurl2];
                
                dispatch_async(q_main, ^{
                    
                    if(imageData2 !=nil){
                        
                        // 画像表示位置指定
                        musicImageViewTmp.image = [UIImage imageWithData:imageData2];
                    }
                    
                });
            });
        }
    }

    
    
    // image,button,labelをタグで管理する
    //UIImageView *userImageView = (UIImageView *)[cell viewWithTag:1];
    //UIImageView *musicImageView = (UIImageView *)[cell viewWithTag:2];
    UILabel *userNameLabel = (UILabel *)[cell viewWithTag:3];
    UILabel *musicTittleLabel = (UILabel *)[cell viewWithTag:4];
    UILabel *artistNameLabel = (UILabel *)[cell viewWithTag:5];
    //UILabel *commentLabel = (UILabel *)[cell viewWithTag:6];
    UIButton *goodButton = (UIButton *)[cell viewWithTag:7];
    UIButton *playButton = (UIButton *)[cell viewWithTag:8];
    UIButton *commentButton = (UIButton *)[cell viewWithTag:9];
    UILabel *goodCountLabel = (UILabel *)[cell viewWithTag:10];
    
    
    
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
    
    int count = 0;
    
    // 投稿userIdの取得＆初期化
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // superviewは階層を表す（superview]superviewは親の親を指定している）
    UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];

    
    
    // userとmusicの番号取得
    int row = [self.musicTableView indexPathForCell:cell].row;

    // userのID取得(アプリ使ってるuser)
    int userId = [[userDefaults stringForKey:@"keyId"] intValue];
    
    // musicID取得
    int musicId = [newMusicCell[row][@"trackId"] intValue];
    
    //int userId = 9;
    //int musicId = 237;
    
    
    
    // カウント回数をサーバーに送る
    NSString *phpUrl = [NSString stringWithFormat:@"http://takeshi-w.sakura.ne.jp/GetGoodCount.php?userId=%d&musicId=%d",userId,musicId];
                        
    // リクエストを生成
    NSMutableURLRequest *request;
    request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:phpUrl]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPBody:[phpUrl dataUsingEncoding:NSUTF8StringEncoding]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    NSDictionary *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    // idの取得
    count = [array[@"goodCount"] intValue];

    
    
    // goodCountLabelに表示場所を指定
    UILabel *goodCountLabel = (UILabel *)[cell viewWithTag:10];

    kazuText= [NSString stringWithFormat:@"good %@ 件",json];
    [goodCountLabel setText:kazuText];
    
}



// 音を出す
- (IBAction)playButton:(id)sender {
    
    NSError *error = nil;
    
    // cellの行数を取得
    UITableViewCell *cell = (UITableViewCell *)[[sender superview]superview];
    
    int row = [self.musicTableView indexPathForCell:cell].row;
    NSLog(@"%d",row);
    
    //別な曲を再生した時、曲をストップする
    if (_audioPlayerRow != row) {
        if (_audioPlayer != nil) {
            [_audioPlayer stop];
            _audioPlayer = nil;
            _audioPlayerRow = row;
        }
    }
    
    NSURL *SoundUrl = [NSURL URLWithString:newMusicCell[row][@"previewUrl"]];
    
//    // Loadingを表示するView(通信中にぐるぐる回るやつ)
//    [self LoadingView];
    
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



- (IBAction)userInfoButton:(id)sender{
    
    //userInfoに画面遷移
    // インスタンス化
    searchArtistViewController *secondUser = [self.storyboard instantiateViewControllerWithIdentifier:@"userInfo"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondUser animated:YES];
    
}



- (IBAction)genretButton:(id)sender{
    
    //userInfoに画面遷移
    // インスタンス化
    searchViewController *secondGenre = [self.storyboard instantiateViewControllerWithIdentifier:@"searchViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondGenre animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// Loadingを表示するView(通信中にぐるぐる回るやつ) 設定
- (void)LoadingView {
    
    UIScreen *sc = [UIScreen mainScreen];
    uv_load = [[UIView alloc] initWithFrame:CGRectMake(0,0,sc.applicationFrame.size.width, sc.applicationFrame.size.height)];
    uv_load.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.7];
    
    // ぐるぐる回る
    UIActivityIndicatorView *aci_loading;
    aci_loading = [[UIActivityIndicatorView alloc] init];
    aci_loading.frame = CGRectMake(0,0,sc.applicationFrame.size.width, sc.applicationFrame.size.height);
    aci_loading.center = uv_load.center;
    aci_loading.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    [aci_loading startAnimating];
    
    // Loading表示
    [uv_load addSubview:aci_loading];
    [self.view addSubview:uv_load];
    
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
