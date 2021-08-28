//
//  QuitVicesViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "QuitVicesViewController.h"
#import "QuitVices2ViewController.h"


@interface QuitVicesViewController ()



@end

@implementation QuitVicesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


#pragma mark - Navigation
/*
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//segue passing data to QuitVices2ViewController (name vices)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegue01Vices"])
    {
        QuitVices2ViewController *QuitVice2VC = segue.destinationViewController;
        
        //create object
        Vices *vices = [[Vices alloc] init];
        vices.name=_txtViceName.text;
        //pass whole object
        QuitVice2VC.vices = vices;
        
    }
}


//unwind segue - 'return to add new vice page'
-(IBAction)unwindToAddNewVice:(UIStoryboardSegue *)unwindSegue {
    UIViewController *sourceViewController = unwindSegue.sourceViewController;
    // Use data from the view controller which initiated the unwind segue
    //clear txtfield
    _txtViceName.text=@"";
}



// clear txtViceName in quit vices Scene
- (IBAction)clearTxtField:(id)sender {
    [[self txtViceName] setText:@""];
}



@end
