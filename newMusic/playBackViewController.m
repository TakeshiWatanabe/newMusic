//
//  playBackViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/02.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "playBackViewController.h"

@interface playBackViewController ()

@end

@implementation playBackViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //　背景画像
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame = CGRectMake(50, 97, 220, 10);
    [self.view addSubview:progressView];
    progressView_ = progressView;
    progressView_.progress = 0.0f;

    
    
//    // 検索された文字
//    self.searchDetail.delegate=self;
    
}



// 行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _artistCell.count;
    
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
    
    
    
    // image,labelをタグで管理する
    UIImageView *artistImage1 = (UIImageView *)[cell viewWithTag:1];
    
    // cellに表示
    NSURL *jurl =[NSURL URLWithString:_artistCell[indexPath.row][@"artworkUrl100"]];
    
    // urlを画像データに変更
    NSData *imageData = [NSData dataWithContentsOfURL:jurl];
    
    // 画像データを表示する
    // cell内にそれぞれ表示
    artistImage1.image = [UIImage imageWithData:imageData];

    return cell;
    
}






- (void)buttonWasTapped:(UIButton *)button {
}

// 検索文字を取り出す
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // 変数
//    searchSongArtist = self.searchDetail.text;
    
    // エンコード
    searchSongArtist = [searchSongArtist stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    // キーボード消す
    [searchBar resignFirstResponder];
    
    [self loadAsync];
    
}


- (void)loadAsync {
    // request (jack johnson で検索)
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@",searchSongArtist]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection==nil) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle : @"ConnectionError"
                              message : @"ConnectionError"
                              delegate : nil
                              cancelButtonTitle : @"OK"
                              otherButtonTitles : nil];
        [alert show];
        
    } else {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
        
    }
}



// header data
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    dataAsync = [[NSMutableData alloc] initWithData:0];
    totalbytes = [response expectedContentLength];
    loadedbytes = 0.0;
    
}



// content downloading
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [dataAsync appendData:data];
    loadedbytes += [data length];
    progressView_.progress = (loadedbytes/totalbytes);
    
}



// download error
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSString *errorMessage = [error localizedDescription];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle : @"RequestError"
                              message : errorMessage
                              delegate : nil
                              cancelButtonTitle : @"OK"
                              otherButtonTitles : nil];
    [alertView show];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
}



// download complete
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // encode
    int encodes[] = {
        NSUTF8StringEncoding,			// UTF-8
        NSShiftJISStringEncoding,		// Shift_JIS
        NSJapaneseEUCStringEncoding,	// EUC-JP
        NSISO2022JPStringEncoding,		// JIS
        NSUnicodeStringEncoding,		// Unicode
        NSASCIIStringEncoding			// ASCII
    };
    
    NSString *jsonString = nil;
    int encodesCount = sizeof(encodes) / sizeof(encodes[0]);
    int encode;
    for (int i=0; i<encodesCount; i++) {
        jsonString = [[NSString alloc]
                      initWithData : dataAsync
                      encoding : encodes[i]];
        if (jsonString!=nil) {
            encode = encodes[i];
            break;
            
        }
    }
    
    
    
    // complete
    progressView_.progress = 1;
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    // Available in iOS 5.0 and later.
    NSError *error;
    NSDictionary *json2 = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:encode] options:kNilOptions error:&error];
    //NSLog(@"%@", [json2 description]);
    
    
    
    // 最新の音楽を取ってきた分配列に格納
    NSArray *artist = [json2 objectForKey:@"results"];
    NSLog(@"%@",artist);
    
    
    
    // 配列の１個目を取得(10個)
    //for (NSInteger i = 0; i < 1; i++) {
        // 配列から要素を取得する
        _str = (NSDictionary *)artist[0];
        NSLog(@"%@", _str);
        
    //}
    
    
    
    // 取りたい情報を配列に格納
    _musicListArtistName = _str[@"artistName"];
    NSLog(@"%@",_musicListArtistName);
    
    _musicListTrackName = _str[@"trackName"];
    NSLog(@"%@",_musicListTrackName);
    
    _musicListViewUrl = _str[@"artworkUrl100"];
    NSLog(@"%@",_musicListViewUrl);
    
    _musicListSound = _str[@"previewUrl"];
    NSLog(@"%@",_musicListSound);
    
    
    
    // NSUrlに変更
    NSURL *jurl =[NSURL URLWithString:(NSString *)_musicListViewUrl];
    
    // NSDataに変更
    imageData = [NSData dataWithContentsOfURL:jurl];
    NSLog(@"%@",imageData);
    
    // 画像データを表示する
    self.artistImg.image = [UIImage imageWithData:imageData];
    
    
    
    // 文字表示
    self.artistname.text = (NSString *)_musicListArtistName;
    self.tittleLabel.text = (NSString *)_musicListTrackName;
    
}

- (IBAction)soundbutton:(id)sender {
    
    // 音を出す
    NSError *error = nil;
    
    // パスから再生プレイヤーを作成する
    NSURL *sondUrl = [NSURL URLWithString:(NSString *)_musicListSound];
    
    // audioを再生するプレイヤーを作成する
    NSData *data = [[NSData alloc] initWithContentsOfURL:sondUrl];
    if (_audioPlayer == nil) {
        _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        
        // エラーが起きたとき
        if (error !=nil) {
            NSLog(@"Error %@",[error localizedDescription]);
            
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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goodButton:(id)sender {
}

- (IBAction)favouriteButton:(id)sender {
    // 変数の宣言
    int userId = 0;
    NSString *musicTittle = (NSString *)_musicListTrackName;
    NSString *artistName = (NSString *)_musicListArtistName;
    UIImage *musicImg = (UIImage *)_musicListViewUrl;
    NSString *soundUrl = (NSString *)_musicListSound;
    
    NSString *StrmusicImg = @"";
    
    
    // アラート表示
    UIAlertView *alert =
    [[UIAlertView alloc] initWithTitle:@"お気に入りに"
                               message:@"登録されました"
                              delegate:@"Cancel"
                     cancelButtonTitle:@"OK"
                     otherButtonTitles:nil];
    [alert show];
    
    
    
    // エンコード
    musicTittle = [musicTittle stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    artistName = [artistName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    soundUrl = [soundUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    
    // phpに接続
    NSString *phpUrl = [NSString stringWithFormat:@"http://takeshi-w.sakura.ne.jp?musicTittle=%@&artistName=%@&jacketUrl=%@&previewUrl=%@",musicTittle,artistName,musicImg,soundUrl];
    
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
    userId = [array[@"id"] intValue];
    StrmusicImg = array[@"jacketUrl"];
    
    
    // 画像の指定
    // UIImageをpng.jpgに変換
    NSRange range = [StrmusicImg rangeOfString:@".png"];
    
    NSData *jpgData = [[NSData alloc] init];
    NSData *pngData = [[NSData alloc] init];
    
    if (range.location == NSNotFound) {
        jpgData = UIImageJPEGRepresentation(musicImg, 0.9);
        [imageData writeToFile:(NSString *)jpgData atomically:YES];
    
    } else {
        pngData = UIImagePNGRepresentation(musicImg);
        
    }
    
    
    
    // ここからPOSTDATAの作成
    NSString *urlString = @"http://takeshi-w.sakura.ne.jp";
    
    // 初期化
    NSMutableURLRequest *userRequest = [[NSMutableURLRequest alloc] init] ;
    [userRequest setURL:[NSURL URLWithString:urlString]];
    [userRequest setHTTPMethod:@"POST"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSString *boundary = @"---------------------------168072824752491622650073";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [userRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    if (range.location == NSNotFound) {
        //JPEG
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"prof%d.jpg\"\r\n",userId] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:jpgData]];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
    } else {
        //PNG
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"file\"; filename=\"prof%d.png\"\r\n",userId] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[NSData dataWithData:pngData]];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [userRequest setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:userRequest returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", returnString);
    
    
    
    // mainViewController.mに画面遷移
    // インスタンス化
    mainViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
}



- (IBAction)backBtn:(id)sender {
    //前の画面へ戻る
    [[self navigationController] popViewControllerAnimated:YES];

}



@end
