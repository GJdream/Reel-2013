//
//  ApiRequest.h
//  reel2013
//
//  Created by Luiz Gustavo Faria on 26/03/13.
//  Copyright (c) 2013 PDM Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiRequest : NSObject

+(void)requestWithURL:(NSString *)relativeURL method:(NSString *)method args:(NSDictionary *)args successCallback:(void(^)(id parsedResponse))successCallback failure:(void(^)())failureCallback;

@end
