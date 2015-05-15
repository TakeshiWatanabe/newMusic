//
//  searchViewController.h
//  newMusic
//
//  Created by 渡邉　剛志 on 2015/05/12.
//  Copyright (c) 2015年 渡邉　剛志. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "mainViewController.h"

@interface searchViewController : UIViewController {
    //配列の宣言
    NSArray *_genre;
}
@property (weak, nonatomic) IBOutlet UISearchBar *searchBer;

- (IBAction)genreButton:(id)sender;
- (IBAction)artistButton:(id)sender;
- (IBAction)allButton:(id)sender;
- (IBAction)classicButton:(id)sender;
- (IBAction)jazzButton:(id)sender;
- (IBAction)tranceHouseButton:(id)sender;
- (IBAction)EDMDanceButton:(id)sender;
- (IBAction)rockButton:(id)sender;
- (IBAction)popButton:(id)sender;
- (IBAction)rbButton:(id)sender;
- (IBAction)hiphopButton:(id)sender;
- (IBAction)generationDistinctionButton:(id)sender;
- (IBAction)reggaeButton:(id)sender;
- (IBAction)hawaiianButton:(id)sender;
- (IBAction)kPopButton:(id)sender;
- (IBAction)animeButton:(id)sender;
- (IBAction)jPopButton:(id)sender;
- (IBAction)popularSongButton:(id)sender;


@end
