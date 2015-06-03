//
//  searchViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchViewController.h"

#import "searchArtistViewController.h"

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


@end
