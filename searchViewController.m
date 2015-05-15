//
//  searchViewController.m
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "searchViewController.h"

@interface searchViewController ()

@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ジャンルの配列
    _genre = @[@{@"name":@"総合",@"image":@""},
               @{@"name":@"クラシック",@"image":@""},
               @{@"name":@"ジャズ",@"image":@""},
               @{@"name":@"トランス・ハウス",@"image":@""},
               @{@"name":@"EDM・ダンス",@"image":@""},
               @{@"name":@"ロック",@"image":@""},
               @{@"name":@"ポップ",@"image":@""},
               @{@"name":@"R&B",@"image":@""},
               @{@"name":@"ヒップホップ",@"image":@""},
               @{@"name":@"年代別",@"image":@""},
               @{@"name":@"レゲエ",@"image":@""},
               @{@"name":@"ハワイアン",@"image":@""},
               @{@"name":@"K-pop",@"image":@""},
               @{@"name":@"アニメ・アニソン",@"image":@""},
               @{@"name":@"J-pop",@"image":@""},
               @{@"name":@"歌謡曲",@"image":@""}
               ];
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

- (IBAction)genreButton:(id)sender {
}

- (IBAction)artistButton:(id)sender {
}

- (IBAction)allButton:(id)sender {
}

- (IBAction)classicButton:(id)sender {
}

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

- (IBAction)RBButton:(id)sender {
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
