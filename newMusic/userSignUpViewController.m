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
    _genre = @[@{@"name":@"総合",@"code":@"all"},
               @{@"name":@"クラシック",@"code":@"Classic"},
               @{@"name":@"ジャズ",@"code":@"jazz"},
               @{@"name":@"トランス・ハウス",@"code":@"tranceHouse"},
               @{@"name":@"EDM・ダンス",@"code":@"EDMDance"},
               @{@"name":@"ロック",@"code":@"rock"},
               @{@"name":@"ポップ",@"code":@"pop"},
               @{@"name":@"R&B",@"code":@"rb"},
               @{@"name":@"ヒップホップ",@"code":@"hiphop"},
               @{@"name":@"年代別",@"code":@"generationDistinction"},
               @{@"name":@"レゲエ",@"code":@"reggae"},
               @{@"name":@"ハワイアン",@"code":@"hawaiian"},
               @{@"name":@"K-pop",@"code":@"kPop"},
               @{@"name":@"アニメ・アニソン",@"code":@"anime"},
               @{@"name":@"J-pop",@"code":@"jPop"},
               @{@"name":@"歌謡曲",@"code":@"popularSong"}
               ];
    
    //国名と国旗の配列
    _country = @[@{@"name":@"アイスランド",@"code":@"Iceland",@"image":@"Iceland.gif"},
                 @{@"name":@"アイルランド",@"code":@"Ireland",@"image":@"Ireland.gif"},
                 @{@"name":@"アメリカ",@"code":@"USA",@"image":@"USA.gif"},
                 @{@"name":@"アルゼンチン",@"code":@"Argentina",@"image":@"Argentina.gif"},
                 @{@"name":@"イギリス",@"code":@"UnitedKingdom",@"image":@"UnitedKingdom.gif"},
                 @{@"name":@"イタリア",@"code":@"Italy",@"image":@"Italy.gif"},
                 @{@"name":@"インドネシア",@"code":@"Indonesia",@"image":@"Indonesia.gif"},
                 @{@"name":@"オーストラリア",@"code":@"Australia",@"image":@"Australia.gif"},
                 @{@"name":@"オーストリア",@"code":@"Austria",@"image":@"Austria.gif"},
                 @{@"name":@"オマーン",@"code":@"Oman",@"image":@"Oman.gif"},
                 @{@"name":@"オランダ",@"code":@"Netherlands",@"image":@"Netherlands.gif"},
                 @{@"name":@"ガーナ",@"code":@"Ghana",@"image":@"Ghana.gif"},
                 @{@"name":@"カタール",@"code":@"Qatar",@"image":@"Qatar.gif"},
                 @{@"name":@"カナダ",@"code":@"Canada",@"image":@"Canada.gif"},
                 @{@"name":@"カメルーン",@"code":@"Cameroon",@"image":@"Cameroon.gif"},
                 @{@"name":@"ギニア",@"code":@"Guinea",@"image":@"Guinea.gif"},
                 @{@"name":@"キューバ",@"code":@"Cuba",@"image":@"Cuba.gif"},
                 @{@"name":@"ギリシャ",@"code":@"Greece",@"image":@"Greece.gif"},
                 @{@"name":@"クウェート",@"code":@"Kuwait",@"image":@"Kuwait.gif"},
                 @{@"name":@"コロンビア",@"code":@"Colombia",@"image":@"Colombia.gif"},
                 @{@"name":@"サモア",@"code":@"Samoa",@"image":@"Samoa.gif"},
                 @{@"name":@"ジャマイカ",@"code":@"Jamaica",@"image":@"Jamaica.gif"},
                 @{@"name":@"シンガポール",@"code":@"Singapore",@"image":@"Singapore.gif"},
                 @{@"name":@"スイス",@"code":@"Switzerland",@"image":@"Switzerland.gif"},
                 @{@"name":@"スウェーデン",@"code":@"Sweden",@"image":@"Sweden.gif"},
                 @{@"name":@"スペイン",@"code":@"Spain",@"image":@"Spain.gif"},
                 @{@"name":@"セルビア",@"code":@"Serbia",@"image":@"Serbia.gif"},
                 @{@"name":@"タイ",@"code":@"Thailand",@"image":@"Thailand.gif"},
                 @{@"name":@"韓国",@"code":@"Korea",@"image":@"Korea.gif"},
                 @{@"name":@"チェコ",@"code":@"Czech",@"image":@"Czech.gif"},
                 @{@"name":@"中央アフリカ",@"code":@"CentralAfrica",@"image":@"CentralAfrica.gif"},
                 @{@"name":@"中国",@"code":@"China",@"image":@"China.gif"},
                 @{@"name":@"チュニジア",@"code":@"Tunisiagif",@"image":@"Tunisiagif.gif"},
                 @{@"name":@"チリ",@"code":@"Chile",@"image":@"Chile.gif"},
                 @{@"name":@"デンマーク",@"code":@"Denmark",@"image":@"Denmark.gif"},
                 @{@"name":@"ドイツ",@"code":@"Germany",@"image":@"Germany.gif"},
                 @{@"name":@"ドミニカ",@"code":@"Dominica",@"image":@"Dominica.gif"},
                 @{@"name":@"トルコ",@"code":@"Turkey",@"image":@"Turkey.gif"},
                 @{@"name":@"トンガ",@"code":@"Tonga",@"image":@"Tonga.gif"},
                 @{@"name":@"日本",@"code":@"Japan",@"image":@"Japan.gif"},
                 @{@"name":@"ニュージーランド",@"code":@"NewZealand",@"image":@"NewZealand.gif"},
                 @{@"name":@"ノルウェー",@"code":@"Norway",@"image":@"Norway.gif"},
                 @{@"name":@"パナマ",@"code":@"Panama",@"image":@"Panama.gif"},
                 @{@"name":@"パラグアイ",@"code":@"Paraguay",@"image":@"Paraguay.gif"},
                 @{@"name":@"バルバドス",@"code":@"Barbados",@"image":@"Barbados.gif"},
                 @{@"name":@"ハンガリー",@"code":@"Hungary",@"image":@"Hungary.gif"},
                 @{@"name":@"フィジー",@"code":@"Fiji",@"image":@"Fiji.gif"},
                 @{@"name":@"フィリピン",@"code":@"Philippines",@"image":@"Philippines.gif"},
                 @{@"name":@"フィンランド",@"code":@"Finland",@"image":@"Finland.gif"},
                 @{@"name":@"ブラジル",@"code":@"Brazil",@"image":@"Brazil.gif"},
                 @{@"name":@"フランス",@"code":@"France",@"image":@"France.gif"},
                 @{@"name":@"ベトナム",@"code":@"Vietnam",@"image":@"Vietnam.gif"},
                 @{@"name":@"ベネズエラ",@"code":@"Venezuela",@"image":@"Venezuela.gif"},
                 @{@"name":@"ベリーズ",@"code":@"Belize",@"image":@"Belize.gif"},
                 @{@"name":@"ペルー",@"code":@"Peru",@"image":@"Peru.gif"},
                 @{@"name":@"ベルギー",@"code":@"Belgium",@"image":@"Belgium.gif"},
                 @{@"name":@"ポーランド",@"code":@"Poland",@"image":@"Poland.gif"},
                 @{@"name":@"ポルトガル",@"code":@"Portugal",@"image":@"Portugal.gif"},
                 @{@"name":@"ホンジュラス",@"code":@"Honduras",@"image":@"Honduras.gif"},
                 @{@"name":@"メキシコ",@"code":@"Mexico",@"image":@"Mexico.gif"},
                 @{@"name":@"モナコ",@"code":@"Monaco",@"image":@"Monaco.gif"},
                 @{@"name":@"モンゴル",@"code":@"Mongolia",@"image":@"Mongolia.gif"},
                 @{@"name":@"ルクセンブルク",@"code":@"Luxembourg",@"image":@"Luxembourg.gif"},
                 @{@"name":@"ロシア",@"code":@"Russia",@"image":@"Russia.gif"}
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
        return [_genre objectAtIndex:row][@"name"];
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
        _genreText.text = [NSString stringWithFormat:[_genre objectAtIndex:row][@"name"]];
        _genreClearLabel.text = [NSString stringWithFormat:[_genre objectAtIndex:row][@"code"]];
    } else {
        NSLog(@"%@",[_country objectAtIndex:selectedRow]);
        _countryClearLabel.text = [NSString stringWithFormat:[_country objectAtIndex:row][@"code"]];
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
    
    //変数宣言
    NSString *name = self.nameText.text;
    NSString *country = self.countryClearLabel.text;
    NSString *genre = self.genreText.text;
    
    //エンコード
    name = [name
            stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *phpUrl = [NSString stringWithFormat:@"http://192.168.33.200/GC5Team/newMusicOnlyServer/serverTomysql.php?name=%@&country=%@&genre=%@",name,self.countryClearLabel.text,self.genreClearLabel.text];
    
    // リクエストを生成
    NSMutableURLRequest *request;
    request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:phpUrl]];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    [request setTimeoutInterval:30];
    [request setHTTPShouldHandleCookies:FALSE];
    [request setHTTPBody:[phpUrl dataUsingEncoding:NSUTF8StringEncoding]];
    //NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:phpUrl]];
    
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    // JSONをパース
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    //画像を送る
    //NSImage *userImg = [[NSImage alloc]initWithContentsOfFile:@"画像ファイル"];
    //NSData *imgdata = [userImg TIFFRepresentation];
    
    //ここからPOSTDATAの作成
    NSString *urlString = @"post先のurl"; //←phpとかで
    NSMutableURLRequest *imageRequest = [[NSMutableURLRequest alloc] init] ;
    [imageRequest setURL:[NSURL URLWithString:urlString]];
    [imageRequest   setHTTPMethod:@"POST"];
    
    NSMutableData *body = [NSMutableData data];
    
    NSString *boundary = @"---------------------------168072824752491622650073";
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Disposition: form-data; name=\"upfile\"; filename=\"user.png\"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [body appendData:[@"Content-Type: image/png\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    //[body appendData:[NSData dataWithData:imgdata]];
    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    [request setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSString *returnString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", returnString);
}

- (IBAction)noButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
