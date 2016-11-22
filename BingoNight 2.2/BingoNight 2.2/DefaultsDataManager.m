//
//  DefaultsDataManager.m
//  BingoNight 1.0
//
//  Created by Adam Schor on 5/19/15.
//  Copyright (c) 2015 AandA Development. All rights reserved.
//

#import "DefaultsDataManager.h"

@implementation DefaultsDataManager


+(BOOL)saveData: (NSObject *)data forKey: (NSString *) key {
    @try {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
    @catch (NSException *exception) {
        return false;
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    return true;
}

+(id)getDataForKey: (NSString *) key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+(NSMutableArray *)getArrayForKey: (NSString *) key {
    
    return [[[NSUserDefaults standardUserDefaults] arrayForKey:key] mutableCopy];
    
}


@end
