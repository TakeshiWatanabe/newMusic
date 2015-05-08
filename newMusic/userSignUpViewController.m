//
//  userSignUpViewController.m
//  musicRunning
//
//  Created by 渡邉　剛志 on 2015/05/03.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import "userSignUpViewController.h"

@interface userSignUpViewController ()

@end

@implementation userSignUpViewController

//ボタンに枠を付ける処理
@synthesize okButton;
@synthesize noButton;
@synthesize picButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //ボタンに枠を付ける処理
    okButton.layer.cornerRadius = 10;
    [[okButton layer] setBorderColor:[[UIColor blackColor]CGColor]];
    [[okButton layer] setBorderWidth:1.0];
    noButton.layer.cornerRadius = 10;
    [[noButton layer] setBorderColor:[[UIColor blackColor]CGColor]];
    [[noButton layer] setBorderWidth:1.0];
    picButton.layer.cornerRadius = 10;
    [[picButton layer] setBorderColor:[[UIColor blackColor]CGColor]];
    [[picButton layer] setBorderWidth:1.0];
    
    //NSLog(@"%d",self.select_num);
    
    //ジャンルの配列
    _genre = @[@"総合",@"クラシック",@"ジャズ",@"トランス・ハウス",@"EDM・ダンス",@"ロック",@"ポップ",@"R&B",@"ヒップホップ",@"年代別",@"レゲエ",@"ハワイアン",@"K-pop",@"アニメ・アニソン",@"J-pop",@"歌謡曲"];
    
    //ジャンルを表示する
    //self.nameLabel = [NSString stringWithFormat:_genre[self.select_num]];
    
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
    //self.inputTextCountry.text = @"name";
    //self.flagImageView.image = @"image";
    
    //
    //self.countryPickerView.delegate = self;
    
    //viewContorrerから画面遷移
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //記入欄に薄く文字を表示する
    //self.inputTextName.placeholder = @"ここに名前を入力してください";
    //self.inputTextGenre.placeholder = @"ここにジャンルが入ります";
    //self.inputTextCountry.placeholder = @"国名";
    
    //backViewの初期化
    _backView = [UIView new];
    
    //backViewの出てくる位置指定
    _backView.frame = CGRectMake(0, self.view.bounds.size.height,self.view.bounds.size.width , 250);
    
    //ボタンの表示文字色（透明度）を設定  []の中で細かく色の指定する
    [_backView setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.7]];

    [self.view addSubview:_backView];
    
    //キーボードを表示
    //self.nameLabel = self;
    
    //最初は非表示なのでNO
    _isVisibleFlag = NO;
}

//pickerViewの横方向の個数を指定
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// pickerViewの縦の長さを決める
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    int cnt = [_genre count];
    return cnt;
}

//ピッカービューの行のタイトルを返す
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [_genre objectAtIndex:row];
}

//選択された行番号を取得
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSLog(@"%d",selectedRow);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)picButton:(id)sender {
    
    //カメラロールの起動と画像選択処理
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc]init];
    imagePicker.delegate = self;
    [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController :(UIImagePickerController *)picker
        didFinishPickingImage :(UIImage *)image editingInfo :(NSDictionary *)editingInfo {
    NSLog(@"selected");
    [self.userImageView setImage:image];
    [self dismissViewControllerAnimated:YES completion:nil];
}

//下からPickerViewをだす処理
- (IBAction)nameButton:(id)sender {
    
    //アニメーションのオブジェクト呼び出し
    [self backView];
    
    //キーボードのオブジェクト呼び出し
    [self newMyText];
    [self.view endEditing:YES];
    
    
}

- (IBAction)genreButton:(id)sender {
    
    //アニメーションのオブジェクト
    [self backView];
    
    //PickerViewを宣言
    self.viewPickerView.delegate = self;
    
}
- (IBAction)countryButton:(id)sender {
    
    //アニメーションのオブジェクト
    [self backView];
}
- (IBAction)okButton:(id)sender {
}

//アニメーション開始の処理
- (void)backView {
    
    //アニメーション開始の処理
    [UIView beginAnimations:nil context:nil];
    
    //アニメーション再生時間（０、１秒で動くように）
    [UIView setAnimationDuration:0.1];
    
    if (_isVisibleFlag){
        //位置を指定
        _backView.frame = CGRectMake(280, 548, 0, 0);
        
        //移動位置を指定
        _backView.frame = CGRectMake(0, self.view.bounds.size.height,self.view.bounds.size.width , 250);
        
        //_isVisibleFlagをNOにする
        _isVisibleFlag = NO;
        
        //[self downObjects];
        
    }else{
        
        //backViewの移動位置を指定
        _backView.frame = CGRectMake(0, self.view.bounds.size.height-300,self.view.bounds.size.width , 350);
        
        //_isVisibleFlagをYESにする
        _isVisibleFlag = YES;
    }
    
    //アニメーションここで終了処理
    [UIView commitAnimations];
}

//backViewにテキストフィールドを載せる
- (void)newMyText{
    //テキストフィールドを初期化
    //view.bounds.size.width(実行しているデバイス画面の幅)
    _myText = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    
    //テキストフィールドのbackColor指定
    _myText.backgroundColor = [UIColor colorWithRed:0.6 green:0.6 blue:0.6 alpha:0.7];
    
    //テキストフィールドのReturnキーのイベントとメソッドtapReturnを関連付ける
    [_myText addTarget:self action:@selector(nameButtonReturn:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    //backViewに追加する
    [_backView addSubview:_myText];
    
}

// リターンキーでキーボードを閉じる。 delegate必須
- (BOOL)_isVisibleFlag:(UITextField *)targetTextField {
    // viewのy座標を元に戻してキーボードをしまう
    [UIView animateWithDuration:0.2
                     animations:^{_backView.frame = CGRectMake(0, 0, _backView.frame.size.width,_backView.frame.size.height);
                     }];
    [targetTextField resignFirstResponder];
    return YES;
}


@end
