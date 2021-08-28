//
//  QuitVices2ViewController.m
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import "QuitVices2ViewController.h"
#import "QuitVices3ViewController.h"

@interface QuitVices2ViewController ()

@end

@implementation QuitVices2ViewController

@synthesize vices;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _nameViceLbl.text=vices.name;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


//segue passing data to QuitVices2ViewController (name vices + costDay vices)
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"passSegue02Vices"])
    {
        QuitVices3ViewController *QuitVice3VC = segue.destinationViewController;
        
        vices.moneySaved=_txtCostDayVice.text;
        QuitVice3VC.vices=vices;
        
       
        
    }
}



// clear txtCostDayVice in quit vices Scene
- (IBAction)clearTxtField:(id)sender {
    [[self txtCostDayVice] setText:@""];

}


@end
