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


-(IBAction)clickNewArtistImg:(id)sender
{
    NSLog(@"in clickNewArtistImg");
    // searchArtistViewControllerに画面遷移
    // インスタンス化
    searchGenreViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}



-(IBAction)clickclassicImg:(id)sender
{
    NSLog(@"in clickclassicImg");
    
    // searchArtistViewControllerに画面遷移
    // インスタンス化
    searchGenreViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
    
    // ナビゲーションコントローラーの機能で画面遷移
    [[self navigationController] pushViewController:secondVC animated:YES];
    
}

-(IBAction)clickjazzImg:(id)sender
{
    NSLog(@"in clickjazzImg");
    
}

-(IBAction)clicksoundTrackImg:(id)sender
{
    NSLog(@"in clicksoundTrackImg");
    
}

-(IBAction)clickedmImg:(id)sender
{
    NSLog(@"in clickedmImg");
    
}

-(IBAction)clickrockImg:(id)sender
{
    NSLog(@"in clickrockImg");
    
}

-(IBAction)clickpopImg:(id)sender
{
    NSLog(@"in clickpopImg");
    
}

-(IBAction)clickrbImg:(id)sender
{
    NSLog(@"in clickrbImg");
    
}

-(IBAction)clickhiphopImg:(id)sender
{
    NSLog(@"in clickhiphopImg");
    
}

-(IBAction)clickhitSongImg:(id)sender
{
    NSLog(@"in clickhitSongImg");
    
}

-(IBAction)clickreggaeImg:(id)sender
{
    NSLog(@"in clickreggaeImg");
    
}

-(IBAction)clickalternativeImg:(id)sender
{
    NSLog(@"in clickalternativeImg");
    
}

-(IBAction)clickjpopImg:(id)sender
{
    NSLog(@"in clickjpopImg");
    
}

-(IBAction)clickanimeImg:(id)sender
{
    NSLog(@"in clickanimeImg");
    
}

-(IBAction)clickfitnessImg:(id)sender
{
    NSLog(@"in clickfitnessImg");
    
}

-(IBAction)clickdanceImg:(id)sender
{
    NSLog(@"in clickdanceImg");
    
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



//- (IBAction)sampleButton:(id)sender {
//    // searchGenreViewControllerに画面遷移
//    // インスタンス化
//    searchGenreViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"searchGenreViewController"];
//    
//    // ナビゲーションコントローラーの機能で画面遷移
//    [[self navigationController] pushViewController:secondVC animated:YES];
//    
//    
//}
@end
