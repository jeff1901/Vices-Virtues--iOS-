//
//  EditingVirtuesViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 8/8/21.
//

#import "EditingVirtuesViewController.h"

@interface EditingVirtuesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtVirtue;

@property (weak, nonatomic) IBOutlet UITextField *txtStartDate;

@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;

@end

@implementation EditingVirtuesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //setup firestore database
    self.firestore = [FIRFirestore firestore];
    [self.txtVirtue setText:self.model.name];
    [self.txtStartDate  setText:[self.model startDate]];
    
   
}

- (IBAction)onclick_btnConfirm:(id)sender {
    FIRDocumentReference * documentReference = [[[self firestore] collectionWithPath:@"Virtues"] documentWithAutoID];
    //id editing then update specific auto id data
   
        documentReference = [[[self firestore] collectionWithPath:@"Virtues"] documentWithPath:self.model.autoId];

    
    //convert current date to string
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:today];

            [documentReference setData:@{
            @"name":_txtVirtue.text,
            @"startDate":_txtStartDate.text,
            @"currentDate":dateString,
            } completion:^(NSError * _Nullable error) {
              if (error != nil) {
                NSLog(@"Error adding document: %@", error);
              } else {
                NSLog(@"All good");
                
                  
                  
          // ignore ...self->access to the instance variable /// self. = access property
          
              //https://stackoverflow.com/questions/36226285/how-do-i-handle-the-actions-of-a-uialertcontroller
              UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                             message:@"Documented edited"
                                             preferredStyle:UIAlertControllerStyleAlert];

              UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                 handler:^(UIAlertAction * action) {
                  [self.navigationController popViewControllerAnimated:true];
              }];

              [alert addAction:defaultAction];
              [self presentViewController:alert animated:YES completion:nil];
             
              }
}];
}
//clear txt fields
- (IBAction)clear:(id)sender {
        [[self txtVirtue] setText: @""];
        [[self txtStartDate] setText: @""];
       }


@end

