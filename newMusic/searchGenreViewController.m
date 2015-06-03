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
    
    // iTunseに接続
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://itunes.apple.com/search?term=Pop&limit=10"]];
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSError *error = nil;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:&error];
    
    _musicList = jsonObject[@"results"];
    NSLog(@"%@",_musicList);
    NSLog(@"%lu",(unsigned long)_musicList.count);
    
//    self.myTableView.dataSource = self;
//    self.myTableView.delegate = self;
//    
//    _audioPlayer = nil;
    
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
}

- (IBAction)genreButton:(id)sender {
}
@end
