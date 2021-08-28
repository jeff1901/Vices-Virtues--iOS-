//
//  ViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <UIKit/UIKit.h>
@import Firebase;
@import FirebaseDatabase;

@interface HomePageViewController : UIViewController

//firestore setup
@property(nonatomic,strong)FIRFirestore *firestore;

@end

