//
//  DetailsViewController.h
//  ToDo-List
//
//  Created by Igor Fernandes on 16/12/22.
//

#import <UIKit/UIKit.h>
#import "Notes.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) Notes *notes;

@end

NS_ASSUME_NONNULL_END
