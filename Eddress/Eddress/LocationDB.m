//
//  LocationDB.m
//  Eddress
//
//  Created by Joji Kubota on 11/24/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "LocationDB.h"

@implementation LocationDB

//path to the dabase
NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
NSString *dir   = [paths objectAtIndex:0];

//DBファイルがあるかどうか確認
NSFileManager *fileManager = [NSFileManager defaultManager];
if (![fileManager fileExistsAtPath:[dir stringByAppendingPathComponent:@"file.db"]])
{
    //なければ新規作成
    FMDatabase *db= [FMDatabase databaseWithPath:[dir stringByAppendingPathComponent:@"file.db"]];
    NSString *sql = @"CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT,testname TEXT);";
    
    [db open]; //DB開く
    [db executeUpdate:sql]; //SQL実行
    [db close]; //DB閉じる
}

@end
