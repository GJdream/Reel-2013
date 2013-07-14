//
//  Model.m
//  reel2013
//
//  Created by Luiz Gustavo Faria on 26/03/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import "Model.h"

@implementation Model

-(id)init {
    self = [super init];
    _data = [[NSMutableDictionary alloc] init];
    return self;
}

-(id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    _data = [[NSMutableDictionary alloc] initWithDictionary:dictionary];
    return self;
}

-(id)objectForKey:(NSString *)key {
    return [_data objectForKey:key];
}

-(void)setObject:(id)object forKey:(NSString *)key {
    [_data setObject:object forKey:key];
}

@end
