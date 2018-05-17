//
//  WJUser.m
//  WJWineDemo
//
//  Created by Adward on 2018/5/8.
//  Copyright © 2018年 Adward. All rights reserved.
//

#import "WJUser.h"


#define userTag @"user"
#define userSound @"userSound"
#define userShake @"userShake"

@implementation WJUser

+ (instancetype)currentUser
{
    static WJUser *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[WJUser alloc]init];
        user.bageValue  = 0;
        user.bid        = @"56c45924c2fb4e2050000022";
        user.isSound    = YES;
        user.isShake    = YES;
        user.nickName   = @"昵称";
        user.sex        = YES;
        user.birthDay   = @"输入后不可修改";
        user.address    = @[].mutableCopy;
        user.phoneNum   = @"";
        
    });
    return user;
}
- (void)setBageValue:(NSInteger)bageValue
{
    _bageValue = bageValue;
    if (bageValue <= 0)
    {
        _bageValue = 0;
    }
}



- (BOOL)isLogin
{
    if ([[NSUserDefaults standardUserDefaults] valueForKey:userTag])
    {
        return YES;
    }
    return  NO;
}

- (WJAddress *)defaultAddress
{
    if (!_defaultAddress)
    {
        if (self.address.count >= 1)
        {
            _defaultAddress = self.address[0];
        }
        else
        {
            _defaultAddress = [[WJAddress alloc]init];
            _defaultAddress.w_name = CURRENT_USER.nickName;
            _defaultAddress.w_phone = CURRENT_USER.phoneNum;
            _defaultAddress.w_address = @"";
        }
    }
    return _defaultAddress;
}



//实现归档解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0 ; i < count; i++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([aDecoder decodeObjectForKey:key])
        {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0 ; i < count; i ++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key  = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end


@implementation WJAddress



- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"address不能识别key---%@",key);
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@ ,address = %@ phone = %@",self.w_name,self.w_address,self.w_phone];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0 ; i < count; i ++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([aDecoder decodeObjectForKey:key])
        {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0; i < count; i++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}


@end
