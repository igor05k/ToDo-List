//
//  Person.h
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, strong) NSString *noteTitle;
@property (nonatomic, nullable, strong) NSString *noteDescription;

- (instancetype)initWithName:(NSString *)noteTitle noteText:(NSString *)noteText;

@end

NS_ASSUME_NONNULL_END
