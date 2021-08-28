//
//  QuitVices3ViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "QuitVices3ViewController.h"

@interface QuitVices3ViewController ()

@end

@implementation QuitVices3ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _costDayViceLbl.text=_vices.moneySaved;
    _nameViceLbl.text=_vices.name;
    //add AUD at the end of the label _costDayViceLbl
    _costDayViceLbl.text = [_costDayViceLbl.text stringByAppendingString:@" AUD"];
    
    //setup firestore database
    self.firestore = [FIRFirestore firestore];
}


// clear txtStartDayVice in quit vices Scene
- (IBAction)clearTxtField:(id)sender {
    [[self txtStartDayVice] setText:@""];
}

- (IBAction)confirmBtnVices:(id)sender {
    //start date object
    _vices.startDate=[[self txtStartDayVice] text];
    [self addVicesTxt: _vices];
}

-(void) addVicesTxt: (Vices* )vices{
    
        //calling the firestore database//access the vices node
        FIRDocumentReference * documentReference = [[[self firestore] collectionWithPath:@"Vices"] documentWithAutoID];
        
        
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
        vices.moneySaved = [NSString stringWithFormat:@"%ld",[components day] * [[_costDayViceLbl text] integerValue]];
    
    
                //save the data on firebase
                [documentReference setData:@{
                @"name":[vices name],
                @"moneySaved":[vices moneySaved],
                @"startDate":[vices startDate],
                //dateString = today see above
                @"currentDate":dateString,
                } completion:^(NSError * _Nullable error) {
                  if (error != nil) {
                    NSLog(@"Error adding document: %@", error);
                  } else {
                    NSLog(@"All good");
                      
                      //Setup Alert
                    [self.txtStartDayVice setText:@""];
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
