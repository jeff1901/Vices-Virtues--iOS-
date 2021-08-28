//
//  Virtues.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "Virtues.h"

@implementation Virtues
-(instancetype)initWithName: (NSString*) name
                  startDate:(NSString*) startDate
                currentDate:(NSString*) currentDate
                     autoId:(NSString*) autoId
{
    self = [super init];
    if (self){
        _name = name;
        _startDate= startDate;
        _currentDate= currentDate;
        _autoId= autoId;
    }
    return self;
}

- (instancetype)initWithDictionary: (NSDictionary*) dictionary
{
    self = [super init];
    if (self){
        _name = dictionary[@"name"];
        _startDate= dictionary[@"startDate"];
        _currentDate= dictionary[@"currentDate"];
        _autoId= dictionary[@"autoId"];
}
    return self;
}

@end
