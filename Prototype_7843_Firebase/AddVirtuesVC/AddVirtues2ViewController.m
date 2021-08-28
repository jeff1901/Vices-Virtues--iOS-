//
//  AddVirtues2ViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "AddVirtues2ViewController.h"
#import "AddVirtuesViewController.h"

@interface AddVirtues2ViewController ()

@end

@implementation AddVirtues2ViewController

@synthesize virtues;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firestore = [FIRFirestore firestore];
    _virtueNameLabel.text=virtues.name;
   
}

//clear txt field date add virtue in add virtue scene
- (IBAction)clearTxtFielDateAddVirtue:(id)sender {
    [[self txtFieldDateAddVirtue] setText:@""];
}
- (IBAction)confirmBtnVirtues:(id)sender {
    //start date object
    virtues.startDate=[[self txtFieldDateAddVirtue] text];
    [self addVirtueTxt: virtues];
}


-(void)addVirtueTxt: (Virtues*)virtues{
    
    //calling the firestore database//access the virtues node
    FIRDocumentReference * documentReference = [[[self firestore] collectionWithPath:@"Virtues"] documentWithAutoID];
    
    //convert current date to string
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    //set format DD/MM/YYYY
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];

            //save the data on firebase
            [documentReference setData:@{
            @"name":virtues.name,
            @"startDate":virtues.startDate,
            @"currentDate":dateString,
            } completion:^(NSError * _Nullable error) {
              if (error != nil) {
                NSLog(@"Error adding document: %@", error);
              } else {
                NSLog(@"All good");
                    
                      //Setup Alert
                      [self.txtFieldDateAddVirtue setText:@""];
                      UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                     message:@"Documented Added"
                                                     preferredStyle:UIAlertControllerStyleAlert];

                      UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action) {}];
                      //show ok button with alert
                      [alert addAction:defaultAction];
                      //show alert
                      [self presentViewController:alert animated:YES completion:nil];
                  
              }
        }];
}

    
    

  



@end
