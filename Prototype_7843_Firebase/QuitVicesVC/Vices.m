//
//  Vices.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "Vices.h"

@implementation Vices

-(instancetype)initWithName: (NSString*) name
                  startDate:(NSString*) startDate
                currentDate:(NSString*) currentDate
                 moneySaved:(NSString*) moneySaved
                     autoId:(NSString*) autoId
{
    self = [super init];
    if (self){
        _name = name;
        _startDate= startDate;
        _currentDate= currentDate;
        _moneySaved= moneySaved;
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
        _moneySaved= dictionary[@"moneySaved"];
        _autoId= dictionary[@"autoId"];
}
    return self;
}
@end
