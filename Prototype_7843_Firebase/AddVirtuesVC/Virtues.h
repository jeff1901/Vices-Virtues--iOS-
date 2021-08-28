//
//  Virtues.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Virtues : NSObject

@property NSString* autoId;
@property NSString* name;
@property NSString* startDate;
@property NSString* currentDate;

- (instancetype)initWithDictionary: (NSDictionary*) dictionary;
-(instancetype)initWithName: (NSString*) name
                  startDate:(NSString*) startDate
                currentDate:(NSString*) currentDate
                     autoId:(NSString*) autoId;

@end

NS_ASSUME_NONNULL_END
