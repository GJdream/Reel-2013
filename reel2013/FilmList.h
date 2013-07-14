//
//  FilmList.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 20/04/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FilmList : NSObject

+(NSArray *)films;
+(NSArray *)documentaries;
+(void)fillTheArrays;

@end
