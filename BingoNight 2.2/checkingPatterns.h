//
//  checkingPatterns.h
//  BingoNight 2.2
//
//  Created by Adam Schor on 12/26/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface checkingPatterns : UIView

@property (strong,nonatomic) UIView *frameView;
@property NSInteger patternNumber;
@property CGFloat w;
@property CGFloat h;
-(void) runAnimation;
+(checkingPatterns *) frameWithPattern:(NSInteger) patternSelected frameX:(CGFloat) x frameY: (CGFloat) y width: (CGFloat) w height: (CGFloat) h;
@end
