//
//  EditingVicesViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 8/8/21.
//

#import <UIKit/UIKit.h>
#import "Vices.h"
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface EditingVicesViewController : UIViewController

@property Vices *model;
@property (nonatomic, strong) FIRFirestore *firestore;

@end

NS_ASSUME_NONNULL_END
