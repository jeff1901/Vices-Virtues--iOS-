//
//  VirtuesTableViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 7/8/21.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;
#import "Virtues.h"

NS_ASSUME_NONNULL_BEGIN

@interface VirtuesTableViewController : UITableViewController

@property (nonatomic,retain) NSMutableArray *virtueArray;
@property (nonatomic, strong) FIRFirestore *firestore;

@end

NS_ASSUME_NONNULL_END
