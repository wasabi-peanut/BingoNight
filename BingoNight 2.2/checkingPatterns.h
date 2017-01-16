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
{
     NSTimer *ballTimer;
}


@property (strong,nonatomic) UIView *frameView;
@property NSInteger patternNumber;

@property CGFloat height;
@property CGFloat width;

-(void) runAnimationWithPatternSelected:(NSInteger) patternSelected;

+(checkingPatterns *) frameX:(CGFloat) x frameY: (CGFloat) y width: (CGFloat) w height: (CGFloat) h;

@property (strong,nonatomic) NSMutableArray *baby1Images;
@property (strong,nonatomic) UIImageView *baby1Frame;
@property (strong,nonatomic) UIImageView *baby2Frame;
@property (strong,nonatomic) UIImageView *baby3Frame;
@property (strong,nonatomic) UIImageView *baby4Frame;
@property (strong,nonatomic) UIImageView *baby5Frame;


@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehaviorTwo;
@property (nonatomic, strong) UIDynamicItemBehavior *bounceBehavior;
@property (nonatomic, strong) UIDynamicItemBehavior *bounceBehaviorDense;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;

@property int gameOver;

@property float ballReleasePointX;
//@property float width;
//@property float height;

@property int score;

@property (strong,nonatomic) UIColor *obstacleColor;

@property (strong,nonatomic)  UILabel *banner;
@property (strong, nonatomic) UIView *ball;
@property (strong, nonatomic) UILabel *labelLower;
@property (strong, nonatomic) UILabel *labelMiddle;
@property (strong, nonatomic) UILabel *labelMoms;
@property (strong, nonatomic) UILabel *labelDads;



@property int pointsLower;
@property int pointsMiddle;
@property int pointsMoms;
@property int pointsDads;



@property  (strong,nonatomic) NSString *strPointsLower;
@property  (strong,nonatomic) NSString *strPointsMiddle;
@property  (strong,nonatomic) NSString *strPointsMoms;
@property  (strong,nonatomic) NSString *strPointsDads;
@end
