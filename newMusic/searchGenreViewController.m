//
//  searchGenreViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchGenreViewController.h"

@interface searchGenreViewController ()

@end

@implementation searchGenreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.artistTableView.dataSource = self;
    self.artistTableView.delegate = self;
    NSLog(@"%@",_artistTableView);
    //_audioPlayer = nil;
    //self.conne
    
    [self loadAsync];
    
    //ラベルに前の画面から受け取った引数を表示
    self.genreLabel.text = _btnGenre;
    
}



- (void)loadAsync {
    // request (jack johnson で検索)
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/search?term=%@",_btnGenre]];
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
    
    
    
    // 最新の音楽を取ってきた分配列に格納
    NSArray *artist = [json2 objectForKey:@"results"];
    NSLog(@"%@",artist);
    
    
    
    // 配列から要素を取得する
    _str = (NSDictionary *)artist[0];
    NSLog(@"%@", _str);
    
    
    
    // 取りたい情報を配列に格納
    _musicListArtistName = _str[@"artistName"];
    NSLog(@"%@",_musicListArtistName);
    //NSLog(@"%lu",_musicListArtistName.count);
    
    // 取りたい情報を配列に格納()
    _musicListViewUrl = _str[@"artworkUrl100"];
    NSLog(@"%@",_musicListViewUrl);
    // NSLog(@"%lu",_musicListTrackViewUrl.count);
    
    // 取りたい情報を配列に格納()
    _musicListSound = _str[@"previewUrl"];
    NSLog(@"%@",_musicListSound);
    
    
    
    _artistCell = artist;
    
    [self.artistTableView reloadData];
    
}



// 行数を返す
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _artistCell.count;
    
}



// セルに画像を表示する
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
                NSURL *jurl =[NSURL URLWithString:_artistCell[indexPath.row][@"jacketUrl"]];
                
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
    
    
    
    // image,labelをタグで管理する
    UIImageView *artistImage1 = (UIImageView *)[cell viewWithTag:1];
    UIImageView *artistImage2 = (UIImageView *)[cell viewWithTag:2];
    UIImageView *artistImage3 = (UIImageView *)[cell viewWithTag:3];
    UIImageView *artistImage4 = (UIImageView *)[cell viewWithTag:4];
    
    // cellに表示
    NSURL *jurl =[NSURL URLWithString:_artistCell[indexPath.row*4][@"artworkUrl100"]];
    NSURL *jurl2 =[NSURL URLWithString:_artistCell[indexPath.row*4+1][@"artworkUrl100"]];
    NSURL *jurl3 =[NSURL URLWithString:_artistCell[indexPath.row*4+2][@"artworkUrl100"]];
    NSURL *jurl4 =[NSURL URLWithString:_artistCell[indexPath.row*4+3][@"artworkUrl100"]];
    //NSLog(@"%@",jurl);
    
    // urlを画像データに変更
    NSData *imageData = [NSData dataWithContentsOfURL:jurl];
    NSData *imageData2 = [NSData dataWithContentsOfURL:jurl2];
    NSData *imageData3 = [NSData dataWithContentsOfURL:jurl3];
    NSData *imageData4 = [NSData dataWithContentsOfURL:jurl4];
    
    // 画像データを表示する
    // cell内にそれぞれ表示
    artistImage1.image = [UIImage imageWithData:imageData];
    artistImage2.image = [UIImage imageWithData:imageData2];
    artistImage3.image = [UIImage imageWithData:imageData3];
    artistImage4.image = [UIImage imageWithData:imageData4];
    
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

- (IBAction)artistButton:(id)sender {
    // searchViewControllerに画面遷移
    // インスタンス化
    searchArtistViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchArtistViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}

- (IBAction)genreButton:(id)sender {
    // searchViewControllerに画面遷移
    // インスタンス化
    searchViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}
- (IBAction)backBtn:(id)sender {
    //前の画面へ戻る
    [[self navigationController] popViewControllerAnimated:YES];
}
@end
