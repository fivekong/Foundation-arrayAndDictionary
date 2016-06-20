//
//  main.m
//  Foundation-复杂数组和字典(Plist)
//
//  Created by qingyun on 16/4/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arr1=@[
                       @{@"name":@"xiaoming",@"age":@21,@"sex":@"男"},
                       @{@"name":@"xiaoli",@"age":@(18),@"sex":@"女"},
                       @{@"name":@"xiaofang",@"age":@22,@"sex":@"女"},
                       @{@"name":@"xiaomin",@"age":@23,@"sex":@"女"}
                       ];
        NSLog(@"arr1==%@",arr1);
        BOOL flag=YES;//判断是否找到的标志
        for (NSDictionary *dic in arr1)
        {
            if ([dic[@"name"] isEqualToString:@"xiaolin"])
            {
                flag=YES;//找到了
                for (NSString *key in dic)
                {
                    NSLog(@"%@=%@",key,dic[key]);
                }
                break;//如果有两个相同的名字，则不用break
            }
        }
        //判断是否找到
        if (NO==flag)
        {
            NSLog(@"not found");
        }
        
        NSDictionary *dict = @{
                               @"country":@"中国",
                               @"province":@[
                                       @{
                                           @"provincename":@"河南",
                                           @"city":@{
                                                   @"cityname":@"郑州",
                                                   @"area":@[@"金水区",@"二七区",@"中原区"]
                                                   }
                                           },
                                       @{
                                           @"provincename":@"陕西",
                                           @"city":@{
                                                   @"cityname":@"西安@市",
                                                   @"area":@[@"高新区",@"临潼区",@"长安区"]
                                                   }
                                           },
                                       ],
                               @"territory":@9600000,
                               @"build":@"1949-10-01"
                               };
        NSLog(@"dict==%@",dict);
        //找临潼区
        NSArray *proArr=dict[@"province"];// 所有的省份
        //遍历省数组
        for (NSDictionary *myDic in proArr)
        {
            NSDictionary *dic1=myDic[@"city"];
            if ([@"西安市" isEqualToString:dic1[@"cityname"]])
            {
                NSArray *areaArr=dic1[@"area"];//需要的地区
                //遍历地区数组
                for (NSString *area in areaArr)
                {
                    if ([area isEqualToString:@"临潼区"])
                    {
                        NSLog(@"找到了...");
                    }
                }
            }
        }
        
        //plist文件写入有两种方式
        //1.直接写入
        //设置路径  这里最好不要用绝对路径
        NSString *path=[NSString stringWithFormat:@"/Users/qingyun/Desktop/Code/20160406/Foundation-复杂数组和字典(Plist)/%@",@"dic.plist"];
        BOOL writeFlag=[dict writeToFile:path atomically:YES];
        if (writeFlag)
        {
            NSLog(@"写入成功!");
        }
        
        //2.Xcode操作
        NSLog(@"readArr==%@",[NSArray arrayWithContentsOfFile:@"/Users/qingyun/Desktop/Code/20160406/Foundation-复杂数组和字典(Plist)/Foundation-复杂数组和字典(Plist)/my.plist"]);
    }
    return 0;
}
