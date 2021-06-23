//
//  TipViewController.m
//  Tipster
//
//  Created by Ileen Fan on 6/22/21.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageControl;
@property (weak, nonatomic) IBOutlet UIView *labelsContainerView;
@property (nonatomic) bool isEditing;
@property (nonatomic) bool check;

@end

@implementation TipViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect billFrame = self.billAmountField.frame;
    billFrame.origin.y += 200;
    self.billAmountField.frame = billFrame;
    self.labelsContainerView.alpha = 0;
    self.isEditing = NO;
    self.check = NO;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSLog(@"View will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    NSLog(@"View did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    NSLog(@"View will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];

    NSLog(@"View did disappear");
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:true];
   
}
- (IBAction)updateLabels:(id)sender {
    if (self.billAmountField.text.length == 0){
        [self hideLabels];
        self.isEditing = NO;
        
    } else if (self.billAmountField != 0 && self.isEditing == NO){
            
        
        [self showLabels];
        self.isEditing = YES;
    }
    
    
    double tipPercentages[] = {0.15, 0.2, 0.25};
    double tipPercentage = tipPercentages[self.tipPercentageControl.selectedSegmentIndex];
    
    
    double bill = [self.billAmountField.text doubleValue];
    double tip = bill * tipPercentage;
    double total = bill + tip;
    
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
}
- (void)hideLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y += 200;
        self.billAmountField.frame = billFrame;
        
        
        CGRect labelsFrame = self.labelsContainerView.frame;
        
        labelsFrame.origin.y += 200;
        self.labelsContainerView.frame = labelsFrame;
        
        self.labelsContainerView.alpha = 0;
        self.check = YES;
        
    }];
    
    
}

- (void)showLabels {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect billFrame = self.billAmountField.frame;
        billFrame.origin.y -= 200;
        self.billAmountField.frame = billFrame;
      
        self.labelsContainerView.alpha = 1;
        CGRect labelsFrame = self.labelsContainerView.frame;
        if (self.check == YES) {

            labelsFrame.origin.y -= 200;
            self.labelsContainerView.frame = labelsFrame;

            self.labelsContainerView.alpha = 1;

        }
    }];

    
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
 
*/

@end
