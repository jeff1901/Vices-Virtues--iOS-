//
//  EditingVicesViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 8/8/21.
//

#import "EditingVicesViewController.h"

@interface EditingVicesViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameViceTextField;

@property (weak, nonatomic) IBOutlet UITextField *costDayTextField;

@property (weak, nonatomic) IBOutlet UITextField *startDateViceTextField;

@property (weak, nonatomic) IBOutlet UIButton *btnConfirm;




@end

@implementation EditingVicesViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    //Do any additional setup after loading the view.
    //setup firestore database
    self.firestore = [FIRFirestore firestore];
    [self.costDayTextField setText:@""];
    [self.nameViceTextField setText:self.model.name];
    [self.startDateViceTextField  setText:[self.model startDate]];

}

- (IBAction)addVices:(id)sender {
   
    NSString *nameVice = [[self nameViceTextField] text];
    NSString *costDay = [[self costDayTextField] text];
    NSString *startDay = [[self startDateViceTextField] text];
    
    Vices *vices = [[Vices alloc]initWithName:nameVice startDate:startDay currentDate:@"" moneySaved:costDay autoId:@""];
    
    [self addVicesTxt: vices];

    }

-(void) addVicesTxt: (Vices* )vices{
        //calling the firestore database//access the vices node
        FIRDocumentReference * documentReference = [[[self firestore] collectionWithPath:@"Vices"] documentWithAutoID];

        documentReference = [[[self firestore] collectionWithPath:@"Vices"] documentWithPath:self.model.autoId];
       
        
        //convert current date to string
        NSDate *today = [NSDate date];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        //set format DD/MM/YYYY
        [dateFormat setDateFormat:@"dd/MM/yyyy"];
        NSString *dateString = [dateFormat stringFromDate:today];
        
        //get days from current date and start date
        NSDate *date1 = [dateFormat dateFromString:[vices startDate]];
        NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                            fromDate:date1
                                                              toDate:[NSDate date]
                                                             options:0];
        //calculate money saved
        vices.moneySaved = [NSString stringWithFormat:@"%ld",[components day] * [[_costDayTextField text] integerValue]];
    
    
                //save the data on firebase
                [documentReference setData:@{
                @"name":[vices name],
                @"moneySaved":[vices moneySaved],
                @"startDate":[vices startDate],
                //dateString = today see above
                @"currentDate":dateString,
                } completion:^(NSError * _Nullable error) {
                  if (error != nil) {
                   // NSLog(@"Error adding document: %@", error);
      } else {
        //NSLog(@"All good");
          
                //setup alert
              UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                             message:@"Documented Edited"
                                             preferredStyle:UIAlertControllerStyleAlert];

              UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                 handler:^(UIAlertAction * action) {
                  [self.navigationController popViewControllerAnimated:true];
              }];
                //show ok button with alert
              [alert addAction:defaultAction];
              [self presentViewController:alert animated:YES completion:nil];
          // NSLog(@"all good!");
          }
      
}];
}

- (IBAction)clearVicesScreen:(id)sender {
    [[self nameViceTextField] setText: @""];
    [[self costDayTextField] setText: @""];
    [[self startDateViceTextField] setText: @""];
   }
@end
