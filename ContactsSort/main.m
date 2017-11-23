//
//  main.m
//  ContactsSort
//
//  Created by 南门 on 2017/11/22.
//  Copyright © 2017年 南门. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sort.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *str1 = @"猪在";
        NSString *str2 = @"包是";
        NSString *str3 = @"才发";
        NSString *str4 = @"猪啊";
        NSString *str5 = @"猪1";
        NSString *str6 = @"*";
        
        NSArray *arr = [NSArray arrayWithObjects: str1, str2, str3, str4, str5, str6, nil];
        
        NSDictionary *resultDic = [Sort sortContactsWithDataArray:arr];
        
        NSLog(@"%@", resultDic);
    }
    return 0;
}



