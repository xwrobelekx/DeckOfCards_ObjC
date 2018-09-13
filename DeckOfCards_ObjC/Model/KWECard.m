//
//  KWECard.m
//  DeckOfCards_ObjC
//
//  Created by Kamil Wrobel on 9/11/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWECard.h"

@implementation KWECard


-(instancetype)initWithDictionary: (NSDictionary *)dictionary
{
    //#1 pull all the values out of the json dictionary
    
    NSString *value = dictionary[@"value"];
    NSString *suit = dictionary[@"suit"];
    NSString *image = dictionary[@"image"];

    
    //#1.5 make sure they are the right type
    
    if (![value isKindOfClass:[NSString class]] || !(value) || ![suit isKindOfClass:[NSString class]] || (!value) || ![image isKindOfClass: [NSString class]]){
        return nil;
    }
    
    
    //#2 initalize a model object from the values you pulled out of the json dictionary
    
    self = [super init];
    if (self){
        _value = value;
        _suit = suit;
        _image = image;
    }
    return self;
    
}

@end
