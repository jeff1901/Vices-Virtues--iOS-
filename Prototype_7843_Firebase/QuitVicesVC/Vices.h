//
//  Vices.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Vices : NSObject

@property NSString* autoId;
@property NSString* name;
@property NSString* moneySaved;
@property NSString* startDate;
@property NSString* currentDate;

- (instancetype)initWithDictionary: (NSDictionary*) dictionary;
-(instancetype)initWithName:(NSString*) name
                  startDate:(NSString*) startDate
                currentDate:(NSString*) currentDate
                 moneySaved:(NSString*) moneySaved
                     autoId:(NSString*) autoId;

@end

NS_ASSUME_NONNULL_END
