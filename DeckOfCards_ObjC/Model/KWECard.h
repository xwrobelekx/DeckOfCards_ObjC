//
//  KWECard.h
//  DeckOfCards_ObjC
//
//  Created by Kamil Wrobel on 9/11/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KWECard : NSObject

@property (nonatomic, readonly, copy) NSString *value;
@property (nonatomic, readonly, copy) NSString *suit;
@property (nonatomic, readonly, copy) NSString *image;

//@property (nonatomic, readonly, copy) NSArray<NSString *> *cards;


-(instancetype)initWithCardInfo: (NSString *)value suit: (NSString *)suit image: (NSString *)image;

-(instancetype)initWithDictionary: (NSDictionary *)dictionary;

@end
