//
//  VicesTableViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 7/8/21.
//

#import "VicesTableViewController.h"
#import "EditingVicesViewController.h"
#import "DataTableViewCell.h"

@interface VicesTableViewController ()

@end

@implementation VicesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //setup firestore
    self.firestore = [FIRFirestore firestore];
    //get the data from firestore
    FIRCollectionReference *vicesCollectionRef = [[self firestore] collectionWithPath:@"Vices"];
 
    //fetch all data and also manage insert, edit and delete automatically
    //addSnapshotListener = update arrays when database changes
    [vicesCollectionRef addSnapshotListener:^(FIRQuerySnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if (error == nil){
            self->_vicesArray = [[NSMutableArray alloc] init];
            for (FIRDocumentSnapshot *document in snapshot.documents) {
                //get the data from database and save in array
               Vices *vices = [[Vices alloc] initWithDictionary:[document data]];
                vices.autoId = document.documentID;
                //self=global variable
                [self->_vicesArray addObject:vices];
           }
           [self.tableView reloadData];
        }else{
            //describe error if occurs
            NSLog(@"%@",error.localizedDescription);
        }
    }];
    //remove empty sopace under table view
    [self.tableView setTableFooterView:[[UIView alloc]init] ];
}

#pragma mark - Table view data source

//number of section returned
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
//number of rows returned
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return numbers of objects in array
    return [[self vicesArray]count];
}

//make the cell editable
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
//return the table cell at the index path "Vices"
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    //check default swipe from left
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        Vices *model = self.vicesArray[indexPath.row];
        [[[self.firestore collectionWithPath:@"Vices"] documentWithPath:model.autoId]
         //call function to delete ID
            deleteDocumentWithCompletion:^(NSError * _Nullable error) {
            //if we have error-->alert
              if (error != nil) {
                  //setup alert
                //NSLog(@"Error removing document: %@", error);
                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                 message:@"Error removing document"
                                                 preferredStyle:UIAlertControllerStyleAlert];

                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                     handler:^(UIAlertAction * action) {}];
                  //show ok button with alert
                  [alert addAction:defaultAction];
                  //show alert
                  [self presentViewController:alert animated:YES completion:nil];
                  //NSLog(@"Error removing document: %@", error);
              } else {
                  //NSLog(@"All good");
                  //setup alert
                  UIAlertController* alert = [UIAlertController alertControllerWithTitle:@""
                                                 message:@"Documented removed"
                                                 preferredStyle:UIAlertControllerStyleAlert];

                  UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                     handler:^(UIAlertAction * action) {}];
                  //show ok button with alert
                  [alert addAction:defaultAction];
                  //show alert
                  [self presentViewController:alert animated:YES completion:nil];
               // NSLog(@"Document successfully removed!");
              }
        }];

        [tableView reloadData]; // tell table to refresh now
    }
}

//select the function name will run when tapping on cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //redirect to edit in editingVicesVC and send model to display and edit model(list of virtues)
    Vices *model = [self.vicesArray objectAtIndex:indexPath.row];
    EditingVicesViewController *destinationvcname = [self.storyboard instantiateViewControllerWithIdentifier:@"EditingVicesViewController"];
    destinationvcname.model = model;
    [self.navigationController pushViewController:destinationvcname animated:true];
   
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString* cellIdentifier = @"DataTableViewCell";
    
    DataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    
    //Configure the cell inside table views
    if(cell== nil){
        cell = [[DataTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    
    }
    Vices *model = [self.vicesArray objectAtIndex:indexPath.row];
    
    //get number of days from two days https://stackoverflow.com/questions/13672313/set-the-event-startdate
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSDate *date1 = [dateFormat dateFromString:[model startDate]];
    NSDate *date2 = [dateFormat dateFromString:[model currentDate]];
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay
                                                        fromDate:date1
                                                          toDate:date2
                                                         options:0];
    //setup cell inside table view
    [cell.lblDate setText:[NSString stringWithFormat:@"%ld",(long)[components day]]];
    [cell.lblName setText:[model name]];
    [cell.lblDays setText:[NSString stringWithFormat:@"%@ - Saved $%@",[model startDate],[model moneySaved]]];
    // unlimited number of lines https://stackoverflow.com/questions/11874323/making-all-the-text-show-in-a-uitableview-cell
    [[cell textLabel] setNumberOfLines:0];
    //set selection color
    [cell setSelectionStyle:(UITableViewCellSelectionStyleNone)];
    return cell;
}

//https://stackoverflow.com/questions/35812891/tableviewcell-auto-height
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Auto height based on content
    return UITableViewAutomaticDimension;
}

@end
