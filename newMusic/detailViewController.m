//
//  detailViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/04.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "detailViewController.h"


@interface detailViewController ()

@end

@implementation detailViewController {
    NSArray *_musicList;
    NSArray *_musicListArtistName;
    NSArray *_musicListTrackName;
    NSArray *_musicListViewUrl;
    NSArray *_musicListSound;
    NSMutableArray *_musicPlay;
    
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame = CGRectMake(50, 97, 220, 10);
    [self.view addSubview:progressView];
    progressView_ = progressView;
    progressView_.progress = 0.0f;
    
    //ボタン表示
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    button.frame = CGRectMake(50, 150, 150, 50);
//    [button setTitle:@"Jack Johnson 検索" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(buttonWasTapped:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];

    // 検索された文字
    self.searchDetail.delegate=self;
    
    // Delegate通知を受け取る
    //self.artistname.text.delegate = self;
    
//    self.artistImage.dataSource = self;
//    self.myTableView.delegate = self;
//    
//    _audioPlayer = nil;
    
}



- (void)buttonWasTapped:(UIButton *)button {
    
    
}



// 検索文字を取り出す
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    // 変数
    searchSongArtist = self.searchDetail.text;
    
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
    for (NSInteger i = 0; i < 1; i++) {
        // 配列から要素を取得する
        _str = [artist objectAtIndex:i];
        NSLog(@"%@", _str);
        
    }
    
    

    // 取りたい情報を配列に格納
    _musicListArtistName = _str[@"artistName"];
    NSLog(@"%@",_musicListArtistName);
    //NSLog(@"%lu",_musicListArtistName.count);
    
    // 取りたい情報を配列に格納
    _musicListTrackName = _str[@"trackName"];
    NSLog(@"%@",_musicListTrackName);
    //NSLog(@"%lu",_musicListTrackName.count);
    
    // 取りたい情報を配列に格納()
    NSString *artwork = _str[@"artworkUrl100"];
    NSLog(@"%@",artwork);
    // NSLog(@"%lu",_musicListTrackViewUrl.count);
    
    // 取りたい情報を配列に格納()
    _musicListSound = _str[@"previewUrl"];
    NSLog(@"%@",_musicListSound);
    
    
    
    // urlを画像データに変更
    NSURL *imageUrl =[NSURL URLWithString:artwork];
    
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:imageUrl];
    
//    // サーバーとの通信を行う
//    NSData *json = [NSURLConnection sendSynchronousRequest:myURLReq returningResponse:nil error:nil];
//    
//    // JSONをパース
//    // 最新の音楽を取ってきた分配列に格納
//    _musicImg = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    
    
    // 画像データを表示する
    //[_webView loadRequest:myURLReq];
    self.artistImage.image = (UIImage *)_musicImg;

    
    
    // 表示
    //self.artistImage.image = _musicList;
    //self.artistImage.image= [UIImage image:_musicListTrackViewUrl];
    self.artistname.text = (NSString *)_musicListArtistName;
    self.songTittle.text = (NSString *)_musicListTrackName;
    //self.soundImage.image = @""
    
}

- (IBAction)soundbutton:(id)sender {
    
    //音を出す
    NSError *error = nil;
    
    //パスから再生プレイヤーを作成する
    NSURL *sondUrl = [NSURL URLWithString:(NSString *)_musicListSound];
    
    //audioを再生するプレイヤーを作成する
    NSData *data = [[NSData alloc] initWithContentsOfURL:sondUrl];
    if (_audioPlayer == nil) {
        _audioPlayer = [[AVAudioPlayer alloc] initWithData:data error:&error];
        
        //エラーが起きたとき
        if (error !=nil) {
            NSLog(@"Error %@",[error localizedDescription]);
            
        }else{
            
            //自分自身をデリケートに設定
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

@end
