//
//  AddVirtuesViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "AddVirtuesViewController.h"
#import "AddVirtues2ViewController.h"
#import "Virtues.h"


@interface AddVirtuesViewController ()

@end

@implementation AddVirtuesViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
 
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation


//unwind segue - 'return to add new virtue page'
-(IBAction)unwindToAddNewVirtue:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    //clear txtfield
    _virtueName.text=@"";
}


//segue passing data to AddVirtues2ViewController (name virtue)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegueVirtue"])
    {
        AddVirtues2ViewController *AddVirtues2VC = segue.destinationViewController;
        //create object
        Virtues *virtues = [[Virtues alloc] init];
        virtues.name=_virtueName.text;
        //pass whole object
        AddVirtues2VC.virtues = virtues;
      
    }
}

//clear txt field virtue name in add virtue scene
- (IBAction)clearTXTfield:(id)sender {
    [[self virtueName] setText:@""];
}








@end
