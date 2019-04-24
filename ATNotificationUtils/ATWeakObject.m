//
//  ATWeakObject.m
//  demo
//
//  Created by linzhiman on 2019/4/24.
//  Copyright © 2019 linzhiman. All rights reserved.
//

#import "ATWeakObject.h"

@implementation ATWeakObject
{
    NSString *_objectKey;
}

- (BOOL)isEqual:(ATWeakObject *)object
{
    if ([self.objectKey isEqual:object.objectKey]) {
        return YES;
    }
    return [self.target isEqual:object.target];
}

- (void)setTarget:(id)target
{
    _target = target;
    
    if (nil != _target) {
        _objectKey = [[NSString alloc] initWithFormat:@"%p", target];
    } else {
        _objectKey = @"";
    }
}

- (NSString *)objectKey
{
    return (nil == _objectKey ? @"" : _objectKey);
}

+ (NSString *)objectKey:(id)targetObj
{
    if (nil != targetObj) {
        return [[NSString alloc] initWithFormat:@"%p", targetObj];
    }
    return @"";
}

- (NSUInteger)hash
{
    return [self.target hash];
}

@end
