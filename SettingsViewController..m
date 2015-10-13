#import "SettingsViewController.h"
#import "MenuTableViewCell.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "CalendarViewController.h"
#import "LeadsVW.h"
#import "UpDateLead.h"
#import "ViewController.h"
#import "UpdateViewController.h"


@interface SettingsViewController ()

@end

@implementation SettingsViewController
@synthesize firstView,secondView;
- (void)viewDidLoad {
    [super viewDidLoad];
    vwChangePassword.hidden=YES;
    
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    
    if(orientation == 0)
    {  scroll.contentSize=CGSizeMake(self.view.frame.size.width, 568);
    }
    else if(orientation == UIInterfaceOrientationPortrait)
    {
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
        }
        
        else
        {
            //=====================================================================================================================================480
            if ([UIScreen mainScreen].bounds.size.height==480.0)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 590);            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.height==568.0)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 578);
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.height==667.0)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 668);
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.height==736.0)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 668);            }
            
        }
        
        
        
    }
    else if(orientation == UIInterfaceOrientationLandscapeLeft)
    {
        
        if ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad )
        {
        }
        
        else
        {
            //=====================================================================================================================================480
            if ([UIScreen mainScreen].bounds.size.width==480.0)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 768);
                
            }
            //=========================================================================================================================================568
            if ([UIScreen mainScreen].bounds.size.width==568)
            {
                scroll.contentSize=CGSizeMake(self.view.frame.size.width, 768);
                
            }
            //=============================================================================================================================================667
            if ([UIScreen mainScreen].bounds.size.height==375)
            {
                 scroll.contentSize=CGSizeMake(self.view.frame.size.width, 868);
                
            }
            //=================================================================================================================================================736
            if ([UIScreen mainScreen].bounds.size.width==736.0)
            {
                
            }
            
        }
        
        
    }
    else if(orientation == UIInterfaceOrientationLandscapeRight)
    {
        //Do something if right
        
        //=====================================================================================================================================480
        if ([UIScreen mainScreen].bounds.size.width==480.0)
        {
        }
        //=========================================================================================================================================568
        if ([UIScreen mainScreen].bounds.size.height==320.0)
        {
             scroll.contentSize=CGSizeMake(self.view.frame.size.width, 768);
        }
        //=============================================================================================================================================667
        if ([UIScreen mainScreen].bounds.size.height==375.0)
        {
            scroll.contentSize=CGSizeMake(self.view.frame.size.width, 868);
        }
        //=================================================================================================================================================736
        if ([UIScreen mainScreen].bounds.size.height==736.0)
        {
            
        }
        
        
    }

    
    
    
   
    NSDictionary *dictUser=[[NSDictionary alloc]initWithDictionary:[[NSUserDefaults standardUserDefaults] valueForKey:@"user"]];
    lblName.text=[dictUser valueForKey:@"name"];
    lblEmail.text=[dictUser valueForKey:@"email"];
    lblVersion.text=[NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"version"]];
    
    arrMenu=[[NSMutableArray alloc]init];
    [arrMenu addObject:@"Calendar"];
    [arrMenu addObject:@"Updates"];
    [arrMenu addObject:@"Leads"];
    [arrMenu addObject:@"Settings"];
    
    swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
    
    
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIDeviceOrientationDidChangeNotification
                                               object:nil];
}
- (void)handleSwipe:(UISwipeGestureRecognizer *)swipe {
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        firstView.hidden=NO;
        secondView.hidden=NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            
            secondView.frame=CGRectMake(-158, 66, 152, self.view.bounds.size.height-50);
            firstView.frame=CGRectMake(-320, 66, 320, self.view.bounds.size.height-50);
            
        }];
        
        
    }
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        firstView.hidden=NO;
        secondView.hidden=NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            secondView.frame=CGRectMake(0, 66, 152, self.view.bounds.size.height-50);
            firstView.frame=CGRectMake(0, 66, 320, self.view.bounds.size.height-50);
            
        }];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
        return [arrMenu count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   
        static NSString *CellIdentifier = @"Cell";
        MenuTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        cell1.lblMenu.text=[arrMenu objectAtIndex:indexPath.row];
        cell1.lblMenu.textColor=[UIColor whiteColor];
        cell1.lblMenu.backgroundColor=[UIColor clearColor];
        return cell1;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str_menu=[arrMenu objectAtIndex:indexPath.row];
    NSLog(@"%@",str_menu);
    
    if ([str_menu isEqualToString:@"Calendar"])
    {
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                    CalendarViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"CalendarViewController"];
                    [self.navigationController pushViewController:view animated:YES];
        
    }
    else if([str_menu isEqualToString:@"Updates"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UpdateViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"UpdateViewController"];
        [self.navigationController pushViewController:view animated:YES];
    }
    else if([str_menu isEqualToString:@"Leads"])
    {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        LeadsVW *view = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
        [self.navigationController pushViewController:view animated:YES];
    }
    else if([str_menu isEqualToString:@"Settings"])
    {
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        SettingsViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
//        [self.navigationController pushViewController:view animated:YES];
        
    }

}

- (void)orientationChanged:(NSNotification *)notification
{
    UIDeviceOrientation deviceOrientation = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationLandscapeLeft==deviceOrientation || UIDeviceOrientationLandscapeRight==deviceOrientation)
    {
        scroll.contentSize=CGSizeMake(self.view.frame.size.width, 778);
    }
    else{
        scroll.contentSize=CGSizeMake(self.view.frame.size.width, 568);
    }
}


-(IBAction)mail:(id)sender
{
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@""];
    [controller setMessageBody:@" " isHTML:YES];
    [controller setToRecipients:[NSArray arrayWithObjects:@"partner@vymo.in",nil]];
    if (controller) [self presentViewController:controller animated:YES completion:nil];
}
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if (result == MFMailComposeResultSent) {
        NSLog(@"It's away!");
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)logout:(id)sender
{
//    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/logout"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
//                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                                       timeoutInterval:30.0];
//    [request setHTTPMethod:@"GET"];
//    NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
//                                                                 delegate:self];
//    [connection start];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"0" forKey:@"token"];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *view = [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self.navigationController pushViewController:view animated:YES];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    lookServerResponseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    
    [lookServerResponseData appendData:data];
    
    
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError *errorJson=nil;
    NSDictionary* responseDict = [NSJSONSerialization JSONObjectWithData:lookServerResponseData options:kNilOptions error:&errorJson];
    NSLog(@"responseDict=%@",responseDict);
    
}
-(IBAction)changePassword:(id)sender
{
    vwChangePassword.hidden=YES;
    if ([txtNewPass.text isEqualToString:txtReNewPass.text]) {
        NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/logout"];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                           timeoutInterval:30.0];
        [request setHTTPMethod:@"POST"];
        NSArray *objects = [NSArray arrayWithObjects:txtNewPass.text,txtExistingPass.text,nil];
        NSArray *keys = [NSArray arrayWithObjects:@"new_password",@"password", nil];
        
        
       // NSDictionary *questionDict = [NSDictionary dictionaryWithObject:objects forKey:keys];
        
        NSDictionary *questionDict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        NSLog(@"%@",questionDict);
        NSError *error=nil;
        NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:questionDict options:0 error:&error];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[jsonData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: jsonData];
        NSURLConnection *connection= [[NSURLConnection alloc] initWithRequest:request
                                                                     delegate:self];
        [connection start];
    }
    else
    {
        vwChangePassword.hidden=NO;
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Type New Password correctly" message:@"" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [txtReNewPass becomeFirstResponder];
        txtReNewPass.text=@"";
        [alert show];
        
    }
    
}
-(IBAction)getViewchangePassword:(id)sender
{
    vwChangePassword.hidden=NO;
    [txtExistingPass becomeFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (IBAction)btn_menu:(id)sender
{
    if(isSwipe==NO)
    {
        [self handleSwipe:swipeRight];
        isSwipe=YES;
    }
    
    
    else
    {
        [self handleSwipe:swipeLeft];
        isSwipe=NO;
    }

    
}
@end
