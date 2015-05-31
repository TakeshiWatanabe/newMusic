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
    NSArray *_musicListTrackViewUrl;
}



- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIProgressView *progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
    progressView.frame = CGRectMake(50,120, 220, 10);
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
    for (NSInteger i = 0; i < 10; i++) {
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
    _musicListTrackViewUrl = _str[@"trackViewUrl"];
    NSLog(@"%@",_musicListTrackViewUrl);
    //NSLog(@"%lu",_musicListTrackViewUrl.count);
    
    
    
    // 表示
    //self.artistImage.image = _musicList;
    //self.artistImage.image= [UIImage image:_musicListTrackViewUrl];
    self.artistname.text = _musicListArtistName;
    self.songTittle.text = _musicListTrackName;
    
//    // 表示
//    NSURL *imageUrl =[NSURL URLWithString:_musicListTrackViewUrl];
//    // urlを画像データに変更
//    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
    
//    NSURL *myURL = [NSURL URLWithString:_musicListTrackViewUrl];
//    
//    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    
    NSURL *myURL = [NSURL URLWithString:@"https://itunes.apple.com/us/album/get-myself-back/id383290105?i=383290120&uo=4"];
    
    NSURLRequest *myURLReq = [NSURLRequest requestWithURL:myURL];
    
    [_webView loadRequest:myURLReq];
    // 画像データを表示する
    //self.webView = [UIImage imageWithData:myURLReq];
    
}

@end
