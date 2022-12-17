//
//  Person.m
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import "Notes.h"

@implementation Notes

- (instancetype)initWithIdentifier:(NSUUID *)identifier noteTitle:(NSString *)noteTitle noteText:(NSString *)noteText {
    self = [super init];
    if (self) {
        _identifier = identifier;
        _noteTitle = noteTitle;
        _noteDescription = noteText;
    }
    return self;
}

- (void)setNoteDescription:(NSString *)noteDescription {
    _noteDescription = noteDescription;
}

@end

