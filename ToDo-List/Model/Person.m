//
//  Person.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)noteTitle noteText:(NSString *)noteText {
    self = [super init];
    if (self) {
        _noteTitle = noteTitle;
        _noteDescription = noteText;
    }
    return self;
}

@end

