#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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
    NSURL *url=[NSURL URLWithString:@"http://vymo-ios.herokuapp.com/users/session"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:@"POST"];
    NSArray *objects = [NSArray arrayWithObjects:@"ios.test@vymo.in", @"iostest",     nil];
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
@end
