//
//  soundViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/06/01.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "soundViewController.h"

@interface soundViewController () 

@end

@implementation soundViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //　背景画像
    UIGraphicsBeginImageContext(self.view.frame.size);
    [[UIImage imageNamed:@"background.png"] drawInRect:self.view.bounds];
    UIImage *backgroundImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.view.backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    
    
    //　iTunseに接続
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=Pop&limit=10"]];
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
    
    _musicList = jsonObject[@"results"];
    NSLog(@"%@",_musicList);
    NSLog(@"%lu",(unsigned long)_musicList.count);
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    _audioPlayer = nil;
    
}

//行数を決定するメソッド
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _musicList.count;
}

//行に表示するデータの作成
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    
    //再利用可能なCellオブジェクトを作成
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = _musicList[indexPath.row][@"trackName"];
    cell.imageView.image = [UIImage imageNamed:@"sound.jpg"];
    cell.imageView.userInteractionEnabled = YES;
    cell.imageView.tag = indexPath.row;
    
    
    return cell;
    
}

//行が押された時に発動するメソッド
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"%ld",(long)indexPath.row);
    
    //音を出す
    NSError *error = nil;
    
  
    
    //パスから再生プレイヤーを作成する
    NSURL *url =[NSURL URLWithString:_musicList[indexPath.row][@"previewUrl"]];
    
    
    //audioを再生するプレイヤーを作成する
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
