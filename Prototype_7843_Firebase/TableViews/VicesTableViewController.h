//
//  VicesTableViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 7/8/21.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;
#import "Vices.h"

NS_ASSUME_NONNULL_BEGIN

@interface VicesTableViewController : UITableViewController

@property (nonatomic,retain) NSMutableArray *vicesArray;
@property (nonatomic, strong) FIRFirestore *firestore;

@end

NS_ASSUME_NONNULL_END
