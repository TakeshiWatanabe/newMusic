//
//  searchViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchViewController.h"

#import "searchGenreViewController.h"

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
    [super viewDidLoad];

    
//    // タップを有効化する
//    UIImageView *tapView = [[UIImageView alloc]init];
//    // タグを設定する
//    tapView.userInteractionEnabled = YES;
//    // 画像をタグで管理する
//    tapView.tag = 1;
//    
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=Pop"]];
//    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    NSError *error = nil;
//    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
//    
//    _musicList = jsonObject[@"results"];
//    NSLog(@"%@",_musicList);
//    NSLog(@"%lu",(unsigned long)_musicList.count);
    
//    self.myTableView.dataSource = self;
//    self.myTableView.delegate = self;
    
    //_audioPlayer = nil;
    
//    alert.alertViewStyle = UIAlertViewStyleDefault;
//    [alert show];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch *touch = [touches anyObject];
    NSLog( @"%d",touch.view.tag );
    switch (touch.view.tag) {
        case 1:
            // タグ1の処理(NewArtistImg)
            // searchGenreViewControllerに画面遷移
            // インスタンス化
//            searchGenreViewController *testVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
//            
//            // ナビゲーションコントローラーの機能で画面遷移
//            [self presentModalViewController:testVC2 animated:YES ];
            
            break;
        case 2:
            // タグ2の処理(classicImg)
            break;
        case 3:
            // タグ3の処理(jazzImg)
            break;
        case 4:
            // タグ1の処理(hitSongImg)
            break;
        case 5:
            // タグ2の処理(edmImg)
            break;
        case 6:
            // タグ3の処理(rockImg)
            break;
        case 7:
            // タグ1の処理(popImg)
            break;
        case 8:
            // タグ2の処理(rbImg)
            break;
        case 9:
            // タグ3の処理(hiphopImg)
            break;
        case 10:
            // タグ1の処理(alternativeImg)
            break;
        case 11:
            // タグ2の処理(reggaeImg)
            break;
        case 12:
            // タグ3の処理(danceImg)
            break;
        case 13:
            // タグ1の処理(jpopImg)
            break;
        case 14:
            // タグ2の処理(animeImg)
            break;
        case 15:
            // タグ3の処理(soundTrackImg)
            break;
        case 16:
            // タグ1の処理(fitnessImg)
            break;
        default:
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)genreButton:(id)sender {
}

- (IBAction)artistButton:(id)sender {
    // searchArtistViewControllerに画面遷移
    // インスタンス化
    mainViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchArtistViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}


- (IBAction)sampleButton:(id)sender {
    // searchGenreViewControllerに画面遷移
    // インスタンス化
    searchGenreViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
    
}
@end
