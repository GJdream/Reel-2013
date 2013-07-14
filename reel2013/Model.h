//
//  Model.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 26/03/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property NSMutableDictionary *data;
-(id)initWithDictionary:(NSDictionary *)dictionary;
-(id)objectForKey:(NSString *)key;
-(void)setObject:(id)object forKey:(NSString *)key;

@end
