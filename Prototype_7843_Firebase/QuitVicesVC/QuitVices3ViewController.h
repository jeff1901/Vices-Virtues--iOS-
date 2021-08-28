//
//  QuitVices3ViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <UIKit/UIKit.h>
#import "Vices.h"
@import Firebase;
@import FirebaseDatabase;

NS_ASSUME_NONNULL_BEGIN

@interface QuitVices3ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *txtStartDayVice;
@property (weak, nonatomic) IBOutlet UILabel *costDayViceLbl;
@property (weak, nonatomic) IBOutlet UILabel *nameViceLbl;
@property Vices *vices;
@property (nonatomic, strong) FIRFirestore *firestore;



//comment ignore

@end

NS_ASSUME_NONNULL_END
