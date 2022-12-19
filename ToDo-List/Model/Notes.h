//
//  Person.h
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Notes : NSObject <NSCoding>

@property (nonatomic, strong) NSUUID *identifier;
@property (nonatomic, strong) NSString *noteTitle;
@property (nonatomic, nullable, strong) NSString *noteDescription;

- (void)setNoteDescription:(NSString *)noteDescription;
- (instancetype)initWithIdentifier:(NSUUID *)identifier noteTitle:(NSString *)noteTitle noteText:(NSString *)noteText;

@end

NS_ASSUME_NONNULL_END
