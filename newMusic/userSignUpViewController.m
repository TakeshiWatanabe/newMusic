//
//  userSignUpViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "userSignUpViewController.h"

//ViewControllerを継承
#import "ViewController.h"

@interface userSignUpViewController ()

@end

@implementation userSignUpViewController

//遷移先の処理
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //写真の場所を押された時の処理
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"タイトル" message:@"メッセージ" preferredStyle:UIAlertControllerStyleAlert];
    
        [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
    
            // ボタンが押された時の処理
    
        }]];
    
        [self presentViewController:alert animated:YES completion:^{
            // 表示完了時の処理
        }];
    
    //ジャンルの配列
    _genre = @[@"総合",@"クラシック",@"ジャズ",@"トランス・ハウス",@"EDM・ダンス",@"ロック",@"ポップ",@"R&B",@"ヒップホップ",@"年代別",@"レゲエ",@"ハワイアン",@"K-pop",@"アニメ・アニソン",@"J-pop",@"歌謡曲",];
    
    //ジャンルを表示する
    self.inputTextGenre = _genre;
    
    //国名と国旗の配列
    _country = @[@{@"name":@"アイスランド",@"image":@"アイスランド国旗.gif"},
                 @{@"name":@"アイルランド",@"image":@"アイルランド国旗.gif"},
                 @{@"name":@"アメリカ",@"image":@"アメリカ国旗.gif"},
                 @{@"name":@"アルゼンチン",@"image":@"アルゼンチン国旗.gif"},
                 @{@"name":@"イギリス",@"image":@"イギリス国旗.gif"},
                 @{@"name":@"イタリア",@"image":@"イタリア国旗.gif"},
                 @{@"name":@"インドネシア",@"image":@"インドネシア国旗.gif"},
                 @{@"name":@"オーストラリア",@"image":@"オーストラリア国旗.gif"},
                 @{@"name":@"オーストリア",@"image":@"オーストリア国旗.gif"},
                 @{@"name":@"オマーン",@"image":@"オマーン国旗.gif"},
                 @{@"name":@"オランダ",@"image":@"オランダ国旗.gif"},
                 @{@"name":@"ガーナ",@"image":@"ガーナ国旗.gif"},
                 @{@"nmae":@"カタール",@"image":@"カタール国旗.gif"},
                 @{@"name":@"カナダ",@"image":@"カナダ国旗.gif"},
                 @{@"name":@"カメルーン",@"image":@"カメルーン国旗.gif"},
                 @{@"name":@"ギニア",@"image":@"ギニア国旗.gif"},
                 @{@"name":@"キューバ",@"image":@"キューバ国旗.gif"},
                 @{@"name":@"ギリシャ",@"image":@"ギリシャ国旗.gif"},
                 @{@"name":@"クウェート",@"image":@"クウェート国旗.gif"},
                 @{@"name":@"コロンビア",@"image":@"コロンビア国旗.gif"},
                 @{@"name":@"サモア",@"image":@"サモア国旗.gif"},
                 @{@"name":@"ジャマイカ",@"image":@"ジャマイカ国旗.gif"},
                 @{@"name":@"シンガポール",@"image":@"シンガポール国旗.gif"},
                 @{@"name":@"スイス",@"image":@"スイス国旗.gif"},
                 @{@"name":@"スウェーデン",@"image":@"スウェーデン国旗.gif"},
                 @{@"name":@"スペイン",@"image":@"スペイン国旗.gif"},
                 @{@"name":@"セルビア",@"image":@"セルビア国旗.gif"},
                 @{@"name":@"タイ",@"image":@"タイ国旗.gif"},
                 @{@"name":@"韓国",@"image":@"韓国国旗.gif"},
                 @{@"name":@"チェコ",@"image":@"チェコ国旗.gif"},
                 @{@"name":@"中央アフリカ",@"image":@"中央アフリカ国旗.gif"},
                 @{@"name":@"中国",@"image":@"中国国旗.gif"},
                 @{@"name":@"チュニジア",@"image":@"チュニジア国旗.gif"},
                 @{@"name":@"チリ",@"image":@"チリ国旗.gif"},
                 @{@"name":@"デンマーク",@"image":@"デンマーク国旗.gif"},
                 @{@"name":@"ドイツ",@"image":@"ドイツ国旗.gif"},
                 @{@"name":@"ドミニカ",@"image":@"ドミニカ国旗.gif"},
                 @{@"name":@"トルコ",@"image":@"トルコ国旗.gif"},
                 @{@"name":@"トンガ",@"image":@"トンガ国旗.gif"},
                 @{@"name":@"日本",@"image":@"日本国旗.gif"},
                 @{@"name":@"ニュージーランド",@"image":@"ニュージーランド国旗.gif"},
                 @{@"name":@"ノルウェー",@"image":@"ノルウェー国旗.gif"},
                 @{@"name":@"パナマ",@"image":@"パナマ国旗.gif"},
                 @{@"name":@"パラグアイ",@"image":@"パラグアイ国旗.gif"},
                 @{@"name":@"バルバドス",@"image":@"バルバドス国旗.gif"},
                 @{@"name":@"ハンガリー",@"image":@"ハンガリー国旗.gif"},
                 @{@"name":@"フィジー",@"image":@"フィジー国旗.gif"},
                 @{@"name":@"フィリピン",@"image":@"フィリピン国旗.gif"},
                 @{@"name":@"フィンランド",@"image":@"フィンランド国旗.gif"},
                 @{@"name":@"ブラジル",@"image":@"ブラジル国旗.gif"},
                 @{@"name":@"フランス",@"image":@"フランス国旗.gif"},
                 @{@"name":@"ベトナム",@"image":@"ベトナム国旗.gif"},
                 @{@"name":@"ベネズエラ",@"image":@"ベネズエラ国旗.gif"},
                 @{@"name":@"ベリーズ",@"image":@"ベリーズ国旗.gif"},
                 @{@"name":@"ペルー",@"image":@"ペルー国旗.gif"},
                 @{@"name":@"ベルギー",@"image":@"ペルー国旗.gif"},
                 @{@"name":@"ポーランド",@"image":@"ポーランド国旗.gif"},
                 @{@"name":@"ポルトガル",@"image":@"ポルトガル国旗.gif"},
                 @{@"name":@"ホンジュラス",@"image":@"ホンジュラス国旗.gif"},
                 @{@"name":@"メキシコ",@"image":@"メキシコ国旗.gif"},
                 @{@"name":@"モナコ",@"image":@"モナコ国旗.gif"},
                 @{@"name":@"モンゴル",@"image":@"モンゴル国旗.gif"},
                 @{@"name":@"ルクセンブルク",@"image":@"ルクセンブルク国旗.gif"},
                 @{@"name":@"ロシア",@"image":@"ロシア国旗.gif"}
                 ];
    
    //国名と国旗を表示する
    self.inputTextCountry.text = @"name";
    self.flagImageView.image = @"image";
    
    //
    self.countryPickerView.delegate = self;
    
    //viewContorrerから画面遷移
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //記入欄に薄く文字を表示する
    self.inputTextName.placeholder = @"ここに名前を入力してください";
    self.inputTextGenre.placeholder = @"ここにジャンルが入ります";
    self.inputTextCountry.placeholder = @"国名";
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    int cnt = [_country count];
    return cnt;
}

//ピッカービューのタイトルを変える
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [_country objectAtIndex:row];
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

- (IBAction)nameText:(id)sender {
}

- (IBAction)genreText:(id)sender {
}

- (IBAction)countryText:(id)sender {
}
- (IBAction)inputTextname:(id)sender {
}
@end
