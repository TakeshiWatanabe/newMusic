//
//  searchViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchViewController.h"

@interface searchViewController ()
@property MPMusicPlayerController *player;

@end

@implementation searchViewController

NSURLConnection *connection;
NSMutableData *dataAsync;
float totalbytes;
float loadedbytes;
UIProgressView *progressView_;

- (void)viewDidLoad {
    
    // プレイヤーのインスタンス化を作成
    self.player = [MPMusicPlayerController applicationMusicPlayer];
    
}

- (IBAction)classicButton:(id)sender {
    // MPMediaPickerControllerのインスタンスを作成
    MPMediaPickerController *picker = [[MPMediaPickerController alloc]init];
    // ピッカーのデリゲートを設定
    picker.delegate = self;
    // 複数選択を不可にする。（YESにすると、複数選択できる）
    picker.allowsPickingMultipleItems = NO;
    // ピッカーを表示する
    [self presentViewController:picker animated:YES completion:nil];
}

// メディアアイテムピッカーでアイテムを選択完了したときに呼び出される
- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection
{
    // 選択した曲情報がmediaItemCollectionに入っているので、これをplayerにセット。
    [self.player setQueueWithItemCollection:mediaItemCollection];
    // 再生開始
    [self.player play];
    // ピッカーを閉じ、破棄する
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

//選択がキャンセルされた場合に呼ばれる
- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    // ピッカーを閉じ、破棄する
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)genreButton:(id)sender {
    [self.player play];
}
- (IBAction)artistButton:(id)sender {
    [self.player pause];
}
- (IBAction)allButton:(id)sender {
    [self.player stop];
}

- (void)didReceiveMemoryWarning
{
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

//- (IBAction)genreButton:(id)sender {
//}

//- (IBAction)artistButton:(id)sender {
//}

//- (IBAction)allButton:(id)sender {
//}

//- (IBAction)classicButton:(id)sender {
//}

- (IBAction)jazzButton:(id)sender {
}

- (IBAction)tranceHouseButton:(id)sender {
}
- (IBAction)EDMDanceButton:(id)sender {
}

- (IBAction)rockButton:(id)sender {
}

- (IBAction)popButton:(id)sender {
}

- (IBAction)rbButton:(id)sender {
}

- (IBAction)hiphopButton:(id)sender {
}

- (IBAction)generationDistinctionButton:(id)sender {
}

- (IBAction)reggaeButton:(id)sender {
}

- (IBAction)hawaiianButton:(id)sender {
}

- (IBAction)kPopButton:(id)sender {
}

- (IBAction)animeButton:(id)sender {
}

- (IBAction)jPopButton:(id)sender {
}

- (IBAction)popularSongButton:(id)sender {
}
@end
