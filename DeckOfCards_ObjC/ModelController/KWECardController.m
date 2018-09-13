//
//  KWECardController.m
//  DeckOfCards_ObjC
//
//  Created by Kamil Wrobel on 9/11/18.
//  Copyright © 2018 Kamil Wrobel. All rights reserved.
//

#import "KWECardController.h"
#import "KWECard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/draw/?count=1";

@implementation KWECardController

//+(instancetype)sharedController
//{
//    static KWECardController *sharedController = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedController = [[KWECardController alloc] init];
//    });
//    return sharedController;
//}



+(void)fetchCard: (void(^_Nullable) (KWECard *_Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    
    NSLog(@"%@", [baseURL absoluteString]);
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:baseURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching data, %@ %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No Data returned from NSURLSession");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelJsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        //this shpould hold just 1 card since thats what were fetching
        NSArray *cardArray = topLevelJsonDictionary[@"cards"];
        //i dont thing i have to loop anything, - i think i should just reach into this array to pull the properties -
        //but the properties arent in the array, they are in the dictonary that this array is holding
        //so after looking at the master project - we have to loop thru the array to extract the dictionary that holds the card.
        NSMutableArray *oneCard = [[NSMutableArray alloc] init];
        
        for (NSDictionary * cardDictionary in cardArray){
            
            KWECard *card = [[KWECard alloc]initWithDictionary : cardDictionary];
            [oneCard addObject: card];
            
        }
        //FIXME: I had to cheat! - cant think of another solution at the moment
        completion(oneCard[0]);
    }]resume];

}

//fetch image
+(void)fetchImageFromURl: (NSString *)imageUrl completion:(void(^)(NSData *_Nullable imageData))completion
{
    NSURL *url = [NSURL URLWithString: imageUrl];
    
    NSLog(@"🙏🏻URL Please work:  %@", [url absoluteString]);
    
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error) {
            NSLog(@"Error fetching data, %@ %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        NSLog(@"%@", response);
        
        if (!data){
            NSLog(@"No Data returned from NSURLSession");
            completion(nil);
            return;
        }
        
        completion(data);
    }]resume];
    
}

@end
