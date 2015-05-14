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
    
    //ジャンルの配列
    _genre = @[@"総合",@"クラシック",@"ジャズ",@"トランス・ハウス",@"EDM・ダンス",@"ロック",@"ポップ",@"R&B",@"ヒップホップ",@"年代別",@"レゲエ",@"ハワイアン",@"K-pop",@"アニメ・アニソン",@"J-pop",@"歌謡曲"];
    
    //国名と国旗の配列
    _country = @[@{@"name":@"アイスランド",@"image":@"アイスランド国旗.gif"},
                 @{@"name":@"アイルランド",@"image":@"al.gif"},
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
                 @{@"name":@"カタール",@"image":@"カタール国旗.gif"},
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
    
    //viewContorrerから画面遷移
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //Delegate通知を受け取る
    self.nameText.delegate = self;
    self.genreText.delegate = self;
    self.commentTextView.delegate = self;
    self.viewPickerView.delegate = self;
    
    //nameとgenreの記入欄に薄く文字を表示する
    self.nameText.placeholder = @"ここをタップ";
    self.genreText.placeholder = @"ここをタップ";
    
    //最初は非表示なのでNO
    _isVisibleFlag = NO;
    _genreFlag = NO;
    
    //ジャンルpickerViewのスタート位置
    self.moveGenreView.center = CGPointMake(160, 800);
    
    //[「改行（Return）」キーの設定]
    self.commentTextView.returnKeyType = UIReturnKeyDone;
}


//name
//エンターキーでキーボードを隠す
- (BOOL)textFieldShouldReturn1:(UITextField *)nameText; {
    [nameText resignFirstResponder];
    return YES;
}

//comment
//エンターキーでキーボードを隠す
- (BOOL)textFieldShouldReturn2:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

//genre
//キーボードを出さない処理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    NSLog(@"%d",textField.tag);
    if (textField.tag == 0){
        //name
        return YES;
    } else {
        //genre
        _genreFlag = YES;
        [self.viewPickerView reloadComponent:0];
        [self showPicker];
        return NO;
    }
}

// ピッカーが下から出るアニメーション
- (void)showPicker {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    self.moveGenreView.center = CGPointMake(160, 430);
    [UIView commitAnimations];
    
    // 右上にdoneボタン
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
        [self.navigationItem setRightBarButtonItem:doneButton animated:YES];
        [doneButton class];
    }
}

// ピッカーが下に隠れるアニメーション
- (void)hidePicker {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.1];
    [UIView setAnimationDelegate:self];
    self.moveGenreView.center = CGPointMake(160, 700);
    [UIView commitAnimations];
    
    // doneボタンを消す
    [self.navigationItem setRightBarButtonItem:nil animated:YES];
}

// ピッカーしまう
- (void)done:(id)sender {
    [self hidePicker];
}

// ピッカー表示開始
- (BOOL)genreText:(UITextField *)textField {
    [self showPicker];
    return NO;
}

//pickerViewの横方向の個数を指定
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

//pickerViewの縦の長さを決める
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    //条件で_genreか_countryのpickerViewを出す
    if (_genreFlag == YES) {
        int count = [_genre count];
        return count;
    } else {
        int count = [_country count];
        return count;
    }
}

//ピッカービューの行のタイトルを返す
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (_genreFlag == YES) {
        return [_genre objectAtIndex:row];
    } else {
        //配列の国名指定
        return [_country objectAtIndex:row][@"name"];
    }
}

// 配列から要素を取得する
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    NSInteger selectedRow = [pickerView selectedRowInComponent:0];
    NSLog(@"%d",selectedRow);
    if (_genreFlag == YES) {
        NSLog(@"%@",[_genre objectAtIndex:selectedRow]);
        _genreText.text = [NSString stringWithFormat:@"%@",[_genre objectAtIndex:row]];
    } else {
        NSLog(@"%@",[_country objectAtIndex:selectedRow]);
        _countryImage.image = [UIImage imageNamed:[_country objectAtIndex:row][@"image"]];
    }
}

- (IBAction)countryButton:(id)sender {
    //国旗を表示する
    _genreFlag = NO;
    UIImage *flagImage = [UIImage imageNamed:@"image"];
    [self.countryImage setImage:flagImage];
    
    //pickerViewの中身を再設定
    [self.viewPickerView reloadComponent:0];
    [self showPicker];
}

//カメラロールの起動と画像選択処理
- (IBAction)picButton:(id)sender {
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

- (IBAction)nameText:(id)sender {
}

- (IBAction)okButton:(id)sender {
    //api接続
    //NSString * urlString = [NSString stringWithFormat:@"http://localhost:8888/GourRepoM2/ApiMovies/returnMoviesJson.json"];
    
    NSString *name = self.nameText.text;
    //NSString *country = self._countryimage.image@[count]@[count];
    NSString *genre = self.genreText.text;
    
    //エンコード
    NSString* info = [name,genre
                           stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *server = [NSString stringWithFormat:@"My Name is %@",self.nameText.text,_country,_genreText.text];
    
    NSString *phpUrl = @"http://192.168.33.200/GC5Team/newMusicOnlyServer/serverTomysql.php?name=%@&country=%d&genre=%d&signup=%d";
    NSString *url = [NSString stringWithFormat:@"%@mention=%@",server,info];
    
    // requestを作成
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    //デコード
    NSString* reply = [[array valueForKeyPath:@"reply"] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //NSURL * url = [NSURL URLWithString:phpUrl];
    NSData * data = [NSData dataWithContentsOfURL:phpUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
