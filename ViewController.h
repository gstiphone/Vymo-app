#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITextFieldDelegate>

{
    UITextField *txtfld;
    NSMutableData *lookServerResponseData;
    UIView *vw;
    UIActivityIndicatorView *spinner;

}
@property (weak, nonatomic) IBOutlet UITextField *text_email;
@property (weak, nonatomic) IBOutlet UITextField *text_password;
@property (weak, nonatomic) IBOutlet UIButton *btn_submit;
- (IBAction)btnSubmit:(id)sender;


@end

