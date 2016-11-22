//
//  CreateCardArrays.m
//  Bingo Night 3.0
//
//  Created by Adam Schor on 10/6/16.
//  Copyright © 2016 AandA Development. All rights reserved.
//
#import "CreateCardArrays.h"

@implementation CreateCardArrays

+(NSMutableArray *)createNumbersWithLowNumber:(int)low highNumber:(int)high {
    
    
    
    NSMutableArray *cardArray = [[NSMutableArray alloc] init];
    
    for (int x =0; x<5; x++) {
        
        while (cardArray.count<5) {
            int randNum = arc4random() % (high-low+1) + low;
            if (![cardArray containsObject:[NSString stringWithFormat:@"%i",randNum]]) {
                [cardArray addObject:[NSString stringWithFormat:@"%i",randNum]];
            }
            else {
                randNum = arc4random() % (high-low+1) + low;
            }
            
        };
        
        
    }
    
    /*[cardArray sortUsingComparator:^NSComparisonResult(NSString *str1, NSString *str2) {
     return [str1 compare:str2 options:(NSNumericSearch)];
     }];
     
     */
    
    return cardArray;
    
    
    
}

@end
