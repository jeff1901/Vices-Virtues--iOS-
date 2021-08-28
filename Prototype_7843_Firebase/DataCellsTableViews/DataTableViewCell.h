//
//  DataTableViewCell.h
//  Prototype_7843_Firebase
//
//  Created by Jeff on 8/8/21.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UILabel *lblDays;

@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblDate;

@end

NS_ASSUME_NONNULL_END
