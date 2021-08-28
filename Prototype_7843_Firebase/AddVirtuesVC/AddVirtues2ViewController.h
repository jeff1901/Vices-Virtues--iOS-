//
//  AddVirtues2ViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <UIKit/UIKit.h>
#import "Virtues.h"
@import Firebase;
@import FirebaseDatabase;


NS_ASSUME_NONNULL_BEGIN

@interface AddVirtues2ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *virtueNameLabel;


@property (weak, nonatomic) IBOutlet UITextField *txtFieldDateAddVirtue;

@property (nonatomic, strong) FIRFirestore *firestore;



@property Virtues *virtues;


@end

NS_ASSUME_NONNULL_END
