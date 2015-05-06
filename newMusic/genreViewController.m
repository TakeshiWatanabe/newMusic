//
//  genreViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/04.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "genreViewController.h"

//１枚目のファイルを継承
#import "ViewController.h"

@interface genreViewController ()

@end

@implementation genreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.genreTable.dataSource = self;
    self.genreTable.delegate = self;
    
    //ジャンルの配列
    _genre = @[@"総合",@"クラシック",@"ジャズ",@"トランス・ハウス",@"EDM・ダンス",@"ロック",@"ポップ",@"R&B",@"ヒップホップ",@"年代別",@"レゲエ",@"ハワイアン",@"K-pop",@"アニメ・アニソン",@"J-pop",@"歌謡曲",];
    
    //カスタマイズしたセルをテーブルビューにセット
    UINib *nib = [UINib nibWithData:@"customCell" bundle:nil];
}

//表示するデータ内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //定数の宣言
    static NSString *CellIdemtifier = @"Cell";
    
    //staticを再利用する
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdemtifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdemtifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", _genre[(long)indexPath.row]];
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

@end
