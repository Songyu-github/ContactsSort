//
//  Sort.m
//  ContactsSort
//
//  Created by 南门 on 2017/11/23.
//  Copyright © 2017年 南门. All rights reserved.
//

#import "Sort.h"
#import "StrClass.h"

@implementation Sort

+ (NSDictionary *)sortContactsWithDataArray:(NSArray *)array {
    NSMutableArray<NSMutableArray *> *dataArr = [NSMutableArray array];
    NSMutableArray *titleArr = [NSMutableArray array];
    NSMutableArray *tmpArr = [NSMutableArray array];
    
    for (int i = 0; i<27; i++) {
        NSMutableArray *mar = [NSMutableArray array];
        [tmpArr addObject:mar];
    }
    
    for (NSString *str in array) {
        NSString *nickName = [StrClass returnFirstTransformedWordWithString:str];
        int firstWord = [nickName characterAtIndex:0];
        if (firstWord >= 65 && firstWord <= 90) {
            [tmpArr[firstWord-65] addObject:str];
        } else {
            [tmpArr[26] addObject:str];
        }
    }
    
    for (NSMutableArray *arr in tmpArr) {
        if (arr.count) {
            [dataArr addObject:arr];
            // title数组
            NSString *nickName = [StrClass returnFirstTransformedWordWithString:[arr firstObject]];
            int firstWord = [nickName characterAtIndex:0];
            if (firstWord >= 65 && firstWord <= 90) {
                [titleArr addObject:nickName];
            }
        }
    }
    
    for (NSMutableArray *arr in dataArr) {
        if (arr.count > 1) {
            [arr sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
                return [[[StrClass returnAllTransformedWordsWithString:obj1] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:[[StrClass returnAllTransformedWordsWithString:obj2] stringByReplacingOccurrencesOfString:@" " withString:@""] options:NSLiteralSearch];
            }];
        }
    }
    
    if (dataArr.count != titleArr.count) {
        [titleArr addObject:@"#"];
    }
    
    NSDictionary *dic = @{
                          @"data" : dataArr.mutableCopy,
                          @"title" : titleArr.mutableCopy
                          };
    return dic;
//    NSLog(@"data = %@\ntitle = %@", dataArr, titleArr);
}

@end
