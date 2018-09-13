//
//  KWECardController.h
//  DeckOfCards_ObjC
//
//  Created by Kamil Wrobel on 9/11/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KWECard.h"

@interface KWECardController : NSObject

//+(instancetype)sharedController;

+(void)fetchCard: (void(^_Nullable) (KWECard *_Nullable))completion;

+(void)fetchImageFromURl: (NSString *)imageUrl completion:(void(^)(NSData *_Nullable imageData))completion;

@end


//@interface KWECard (JSONConvertible)
//
//
////-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)cardDictionary;
//-(instancetype)initWithInfo: (NSString *)value suit: (NSString *)suit image: (NSString *)image;
//
//@end
