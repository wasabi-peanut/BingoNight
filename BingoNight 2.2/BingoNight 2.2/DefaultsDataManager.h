//
//  DefaultsDataManager.h
//  BingoNight 1.0
//
//  Created by Adam Schor on 5/19/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefaultsDataManager : NSObject

+(BOOL)saveData: (NSObject *) data forKey: (NSString *) key;
+(id)getDataForKey: (NSString *) key;
+(NSMutableArray *)getArrayForKey: (NSString *) key;



@end
