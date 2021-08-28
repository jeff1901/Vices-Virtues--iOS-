//
//  QuitVices2ViewController.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 6/8/21.
//

#import <UIKit/UIKit.h>
#import "Vices.h"

NS_ASSUME_NONNULL_BEGIN

@interface QuitVices2ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtCostDayVice;

@property (weak, nonatomic) IBOutlet UILabel *nameViceLbl;

@property (nonatomic, strong) NSString *data;

@property Vices *vices;


@end

NS_ASSUME_NONNULL_END
