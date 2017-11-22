//
//  main.m
//  ContactsSort
//
//  Created by 南门 on 2017/11/22.
//  Copyright © 2017年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StrClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str1 = @"猪在";
        NSString *str2 = @"包是";
        NSString *str3 = @"才发";
        NSString *str4 = @"猪啊";
        NSString *str5 = @"猪1";
        NSString *str6 = @"*";
        
        NSArray *arr = [NSArray arrayWithObjects: str1, str2, str3, str4, str5, str6, nil];
        NSMutableArray<NSMutableArray *> *dataArr = [NSMutableArray array];
        NSMutableArray *titleArr = [NSMutableArray array];
        NSMutableArray *tmpArr = [NSMutableArray array];
        
        for (int i = 0; i<27; i++) {
            NSMutableArray *mar = [NSMutableArray array];
            [tmpArr addObject:mar];
        }
        
        for (NSString *str in arr) {
            NSString *nickName = [StrClass returnFirstWordWithString:str];
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
                NSString *nickName = [StrClass returnFirstWordWithString:[arr firstObject]];
                int firstWord = [nickName characterAtIndex:0];
                if (firstWord >= 65 && firstWord <= 90) {
                    [titleArr addObject:nickName];
                }
            }
        }
        
        for (NSMutableArray *arr in dataArr) {
            if (arr.count > 1) {
                [arr sortUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2) {
                    return [[[StrClass returnAllWordsWithString:obj1] stringByReplacingOccurrencesOfString:@" " withString:@""] compare:[[StrClass returnAllWordsWithString:obj2] stringByReplacingOccurrencesOfString:@" " withString:@""] options:NSLiteralSearch];
                }];
            }
        }
        
        if (dataArr.count != titleArr.count) {
            [titleArr addObject:@"#"];
        }
        
        NSLog(@"data = %@\ntitle = %@", dataArr, titleArr);
    }


    return 0;
}



