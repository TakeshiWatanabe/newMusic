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
    
    
    // imageをタグで管理
    self.NewArtistImg.userInteractionEnabled = YES;
    self.NewArtistImg.tag = 1;
    self.classicImg.userInteractionEnabled = YES;
    self.classicImg.tag = 2;
    self.jazzImg.userInteractionEnabled = YES;
    self.jazzImg.tag = 3;
    self.soundTrackImg.userInteractionEnabled = YES;
    self.soundTrackImg.tag = 4;
    self.edmImg.userInteractionEnabled = YES;
    self.edmImg.tag = 5;
    self.rockImg.userInteractionEnabled = YES;
    self.rockImg.tag = 6;
    self.popImg.userInteractionEnabled = YES;
    self.popImg.tag = 7;
    self.rbImg.userInteractionEnabled = YES;
    self.rbImg.tag = 8;
    self.hiphopImg.userInteractionEnabled = YES;
    self.hiphopImg.tag = 9;
    self.hitSongImg.userInteractionEnabled = YES;
    self.hitSongImg.tag = 10;
    self.reggaeImg.userInteractionEnabled = YES;
    self.reggaeImg.tag = 11;
    self.alternativeImg.userInteractionEnabled = YES;
    self.alternativeImg.tag = 12;
    self.jpopImg.userInteractionEnabled = YES;
    self.jpopImg.tag = 13;
    self.animeImg.userInteractionEnabled = YES;
    self.animeImg.tag = 14;
    self.fitnessImg.userInteractionEnabled = YES;
    self.fitnessImg.tag = 15;
    self.danceImg.userInteractionEnabled = YES;
    self.danceImg.tag = 16;
    
    
    
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
   UITouch *touch = [[event allTouches] anyObject];
    if ( touch.view.tag == _NewArtistImg.tag )
        [self clickNewArtistImg:_NewArtistImg];
    else if ( touch.view.tag == _classicImg.tag )
        [self clickclassicImg:_classicImg]; 
    else if ( touch.view.tag == _jazzImg.tag )
        [self clickjazzImg:_jazzImg];
    else if ( touch.view.tag == _soundTrackImg.tag )
        [self clicksoundTrackImg:_soundTrackImg];
    else if ( touch.view.tag == _edmImg.tag )
        [self clickedmImg:_edmImg];
    else if ( touch.view.tag == _rockImg.tag )
        [self clickrockImg:_rockImg];
    else if ( touch.view.tag == _popImg.tag )
        [self clickpopImg:_popImg];
    else if ( touch.view.tag == _rbImg.tag )
        [self clickrbImg:_rbImg];
    else if ( touch.view.tag == _hiphopImg.tag )
        [self clickhiphopImg:_hiphopImg];
    else if ( touch.view.tag == _hitSongImg.tag )
        [self clickhitSongImg:_hitSongImg];
    else if ( touch.view.tag == _reggaeImg.tag )
        [self clickreggaeImg:_reggaeImg];
    else if ( touch.view.tag == _alternativeImg.tag )
        [self clickalternativeImg:_alternativeImg];
    else if ( touch.view.tag == _jpopImg.tag )
        [self clickjpopImg:_jpopImg];
    else if ( touch.view.tag == _animeImg.tag )
        [self clickanimeImg:_animeImg];
    else if ( touch.view.tag == _fitnessImg.tag )
        [self clickfitnessImg:_fitnessImg];
    else if ( touch.view.tag == _danceImg.tag )
        [self clickdanceImg:_danceImg];
    
}

- (IBAction)clickNewArtistImg:(id)sender {
    
    //次の画面へ渡す引数をセット
    _btnGenre = @"";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickclassicImg:(id)sender
{
    //次の画面へ渡す引数をセット
    _btnGenre = @"classical";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickjazzImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"jazz";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clicksoundTrackImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"soundtrack";
    
    //　画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickedmImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"edm";
    
    //　画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickrockImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"rock";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickpopImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"pop";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickrbImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"rb";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickhiphopImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"hiphop";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickhitSongImg:(id)sender
{
    // 次の画面に渡す引数セット
    _btnGenre = @"hitsong";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickreggaeImg:(id)sender
{
    // 次の画面に渡す引数セット
    _btnGenre = @"reggae";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickalternativeImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"alternative";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickjpopImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"jpop";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickanimeImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"anime";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickfitnessImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"fitness";
    
    // 画面遷移呼び出し
    [self changePage];
    
}

-(IBAction)clickdanceImg:(id)sender
{
    // 次の画面へ渡す引数セット
    _btnGenre = @"dance";
    
    //　画面遷移呼び出し
    [self changePage];
    
}



// 画面遷移時に呼ばれるメソッド
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    //2つ目の画面にパラメータを渡して遷移する
    if ([segue.identifier isEqualToString:@"secondSegue"]) {
        //ここでパラメータを渡す
        searchGenreViewController *searchGenreViewController = segue.destinationViewController;
        searchGenreViewController.genreInfo = _btnGenre;
    }
}



// 画面遷移
- (void)changePage {
    
    //searchGenreiewControllerに画面遷移
    // インスタンス化
    searchGenreViewController *secondGenre = [self.storyboard instantiateViewControllerWithIdentifier:@"genreView"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondGenre animated:YES];
    
    [self performSegueWithIdentifier:@"secondSegue" sender:self];
}



//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    //押されたか確認する
//    UITouch *touch = [touches anyObject];
//    NSLog( @"%d",touch.view.tag );
//    switch (touch.view.tag) {
//        case 1:
//            // タグ1の処理(NewArtistImg)
//            //searchGenreViewControllerに画面遷移
//            // インスタンス化
////            searchGenreViewController *testVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
////            
////            // ナビゲーションコントローラーの機能で画面遷移
////            [self presentModalViewController:testVC2 animated:YES ];
//            
//            break;
//        case 2:
//            // タグ2の処理(classicImg)
//            break;
//        case 3:
//            // タグ3の処理(jazzImg)
//            break;
//        case 4:
//            // タグ1の処理(hitSongImg)
//            break;
//        case 5:
//            // タグ2の処理(edmImg)
//            break;
//        case 6:
//            // タグ3の処理(rockImg)
//            break;
//        case 7:
//            // タグ1の処理(popImg)
//            break;
//        case 8:
//            // タグ2の処理(rbImg)
//            break;
//        case 9:
//            // タグ3の処理(hiphopImg)
//            break;
//        case 10:
//            // タグ1の処理(alternativeImg)
//            break;
//        case 11:
//            // タグ2の処理(reggaeImg)
//            break;
//        case 12:
//            // タグ3の処理(danceImg)
//            break;
//        case 13:
//            // タグ1の処理(jpopImg)
//            break;
//        case 14:
//            // タグ2の処理(animeImg)
//            break;
//        case 15:
//            // タグ3の処理(soundTrackImg)
//            break;
//        case 16:
//            // タグ1の処理(fitnessImg)
//            break;
//        default:
//            break;
//            
//    }
//    
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)serchButton:(id)sender {
    
    //sampleImageViewControllerに画面遷移
    // インスタンス化
    sampleImageViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"sampleImageViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}

- (IBAction)mainButton:(id)sender {
    
    //mainViewControllerに画面遷移
    // インスタンス化
    mainViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"mainViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}



- (IBAction)userInfoButton:(id)sender{
    
    //userInfoに画面遷移
    // インスタンス化
    searchArtistViewController *secondUser = [self.storyboard instantiateViewControllerWithIdentifier:@"userInfo"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondUser animated:YES];
    
}



- (IBAction)nextgenre:(id)sender {
    
    //sampleImageViewControllerに画面遷移
    // インスタンス化
    searchGenreViewController *secondGenre = [self.storyboard instantiateViewControllerWithIdentifier:@"genreView"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondGenre animated:YES];
    
    
}

@end
