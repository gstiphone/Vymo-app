//
//  UpdateHistory.m
//  Vymo_test
//
//  Created by Administrator on 12/10/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "UpdateHistory.h"

@interface UpdateHistory ()

@end

@implementation UpdateHistory

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myDictionary = [[NSUserDefaults standardUserDefaults] dictionaryForKey:@"dictionaryKey"];
    NSLog(@"%@",myDictionary);
    NSLog(@"%@",[myDictionary valueForKey:@"states"]);
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnBack:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
@end
