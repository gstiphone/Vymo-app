#import "ViewController.h"
#import "CalenderVW.h"
#import "LeadsVW.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize text_email,text_password;
- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSubmit:(id)sender
{
 /*  if([text_email.text isEqualToString:@""] ||[text_password.text isEqualToString:@""])
   {
       UIAlertView *view = [[UIAlertView alloc]
                            initWithTitle: @"VYMO"
                            message: @"Please fill the required feilds"
                            delegate: self
                            cancelButtonTitle: @"OK." otherButtonTitles: nil];
       [view show];

       
   }
    else
    {
    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/users/session"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
        
        [self.view addSubview:vw];
        spinner=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        spinner.frame=CGRectMake(([UIScreen mainScreen].bounds.size.width-32)/2, ([UIScreen mainScreen].bounds.size.height-32)/2, 32.0f, 32.0f);
        
        [self.view addSubview:spinner];
        
        [spinner startAnimating];
        
 //   NSArray *objects = [NSArray arrayWithObjects:@"ios.test@vymo.in", @"iostest",     nil];
     NSArray *objects = [NSArray arrayWithObjects:text_email.text, text_password.text,     nil];
    NSArray *keys = [NSArray arrayWithObjects:@"email", @"password", nil];
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
    
   
    }*/
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LeadsVW *View = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
    [self.navigationController pushViewController:View animated:YES];
    
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
     [spinner stopAnimating];
    
    
    NSString *authString=responseDict[@"auth_token"];
    NSLog(@"%@",authString);
    
    if(![authString length]>0)
    {
        NSString *errorString=responseDict[@"error"];
        if([errorString isEqualToString:@"Invalid password"])
        {
            UIAlertView *view = [[UIAlertView alloc]
                                 initWithTitle: @"VYMO"
                                 message: @"Invalid password"
                                 delegate: self
                                 cancelButtonTitle: @"OK." otherButtonTitles: nil];
            [view show];
            
        }
        
        if([errorString isEqualToString:@"User not found"])
        {
            UIAlertView *view = [[UIAlertView alloc]
                                 initWithTitle: @"VYMO"
                                 message: @"Invalid User"
                                 delegate: self
                                 cancelButtonTitle: @"OK." otherButtonTitles: nil];
            [view show];
            
        }

    
    }
    else
    {
    [[NSUserDefaults standardUserDefaults]setObject:authString forKey:@"authString_default"];
    
        
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    CalenderVW *View = [storyboard instantiateViewControllerWithIdentifier:@"CalenderVW"];
//    [self.navigationController pushViewController:View animated:YES];
        
        
       // UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       // LeadsVW *View = [storyboard instantiateViewControllerWithIdentifier:@"LeadsVW"];
        //[self.navigationController pushViewController:View animated:YES];
    
    }
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
    {
        if ([UIScreen mainScreen].bounds.size.width==480.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 480, 320);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==568.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 568.0, 320);
        }
        if ([UIScreen mainScreen].bounds.size.width==667.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 667, 375);
        }
        
        if ([UIScreen mainScreen].bounds.size.width==736.0)
        {
            NSLog(@"Lanscapse");
            self.view.frame=CGRectMake(0, 0, 736, 414);
        }
        
    }
    
    if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
    {
        
        if ([UIScreen mainScreen].bounds.size.height==480.0)
        {
            
            NSLog(@"Potrait");
            self.view.frame=CGRectMake(0, 0, 320, 480);
            
        }
        
        
        
    }

    
    [textField resignFirstResponder];
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
 if(textField==text_email || text_password)
 {
     if ([[UIDevice currentDevice] orientation] == UIDeviceOrientationLandscapeLeft || [[UIDevice currentDevice] orientation ]== UIDeviceOrientationLandscapeRight)
     {
         
         NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
          NSLog(@"%f",[UIScreen mainScreen].bounds.size.height);
         
         if ([UIScreen mainScreen].bounds.size.width==480.0)
         {
              NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -80, 480, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==568.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -80, 568, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==667.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -50, 667, 320);
         }
         
         if ([UIScreen mainScreen].bounds.size.width==736.0)
         {
             NSLog(@"Lanscapse");
             self.view.frame=CGRectMake(0, -50, 736, 414);
         }


         
     }
     
     if([[UIDevice currentDevice] orientation] == UIDeviceOrientationPortrait || [[UIDevice currentDevice] orientation] == UIDeviceOrientationPortraitUpsideDown )
     {
         
         if ([UIScreen mainScreen].bounds.size.height==480.0)
         {
         
             NSLog(@"Potrait");
             self.view.frame=CGRectMake(0, -80, 320, 480);
         
         }
         
         
         
     }
 
 }
    
}



@end
