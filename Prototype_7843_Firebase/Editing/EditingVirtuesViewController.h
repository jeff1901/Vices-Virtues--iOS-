//
//  EditingVirtuesViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 8/8/21.
//

#import <UIKit/UIKit.h>
#import "Virtues.h"
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface EditingVirtuesViewController : UIViewController


@property (nonatomic, strong) FIRFirestore *firestore;
@property (nonatomic, strong) Virtues *model;


@end

NS_ASSUME_NONNULL_END
