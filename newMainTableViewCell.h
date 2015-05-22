//
//  newMainTableViewCell.h
//  
//
//  Created by 渡邉　剛志 on 2015/05/21.
//
//

#import <UIKit/UIKit.h>

@interface newMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImage;
@property (weak, nonatomic) IBOutlet UIImageView *musicImage;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *commntoLabel;
- (IBAction)commentoButton:(id)sender;
- (IBAction)playButton:(id)sender;
- (IBAction)goodButton:(id)sender;

@end
