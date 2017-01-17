//
//  WinnerViewController.h
//  BingoNightFinal
//
//  Created by Adam Schor on 10/21/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "DefaultsDataManager.h"



@interface WinnerViewController : UIViewController

@property (strong, nonatomic) NSMutableArray *arrayCoordinatesWinnerSounds;
@property (strong, nonatomic) NSString *keyForCoordinatesWinnerSounds;

@property NSInteger gameNumber;
@property NSInteger winnerSoundNumber;
@property (strong, nonatomic) NSString *winnerSound;



@end
