//
//  ViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "HomePageViewController.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //firestore setup
    self.firestore=[FIRFirestore firestore];
}


//unwind to homePage
- (IBAction)unwindToHomePage:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
}
@end
