//
//  StrClass.m
//  test
//
//  Created by 南门 on 2017/11/22.
//  Copyright © 2017年 南门. All rights reserved.
//

#import "StrClass.h"
static NSMutableString *editString;

@implementation StrClass

+ (NSString *)returnFirstWordWithString:(NSString *)str {
    return [[self class] returnTransformedWordsWithString:str lenth:1];
}

+ (NSString *)returnAllWordsWithString:(NSString *)str {
    return [[self class] returnTransformedWordsWithString:str lenth:[[self class] transformStringToPinyin:str].length];
}

+ (NSString *)returnTransformedWordsWithString:(NSString *)str lenth:(NSInteger)lenth {

    if ([[self class] transformStringToPinyin:str].length > 0) {
        // 全部转换为大写,取出lenth长度的子串并返回
        NSString * res = [[[[self class] transformStringToPinyin:str] uppercaseString] substringToIndex:lenth];
        return res;
    } else {
        return @"";
    }
}

+ (NSMutableString *)transformStringToPinyin:(NSString *)string {
    NSMutableString * mutStr = [NSMutableString stringWithString:string];
    
    // 将mutStr中的汉字转化为带音标的拼音（如果是汉字就转换，如果不是则保持原样）
    if (CFStringTransform((__bridge CFMutableStringRef)mutStr, NULL, kCFStringTransformMandarinLatin, NO) ) {
        // 去掉音标
        CFStringTransform((__bridge CFMutableStringRef)mutStr, NULL, kCFStringTransformStripCombiningMarks, NO);
    }
    return mutStr;
}


@end
