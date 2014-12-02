//
//  QuickAddViewController.m
//  Eddress
//
//  Created by student on 11/20/14.
//  Copyright (c) 2014 Gemmell, Kubota, Teller. All rights reserved.
//

#import "QuickAddViewController.h"
#import "FMDatabase.h"

@interface QuickAddViewController ()

@end

@implementation QuickAddViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

-(IBAction) done:(id) sender
{
    if(self.locationToEdit != nil)
    {
        self.locationToEdit.name = self.nameTextField.text;
        self.locationToEdit.latitude = self.latitudeTextField.text;
        self.locationToEdit.longitude = self.longitudeTextField.text;
        
        if(![self validate:self.locationToEdit])
        {
            [Utility showAlert:@"Error" message:@"Validation Failed!"];
            return;
        }
        
        [self.delegate addQuickAddViewController:self didEditLocation:self.locationToEdit];
    }
    
    else
    {
        Location *location = [[Location alloc] init];
        location.name = self.nameTextField.text;
        location.latitude = self.latitudeTextField.text;
        location.longitude = self.longitudeTextField.text;
        
        if(![self validate:location])
        {
            [Utility showAlert:@"Error" message:@"Validation Failed!"];
            return;
        }
        
        [self.delegate addQuickAddViewController:self didAddLocation:location];
    }
    
}

-(BOOL) validate:(Location *)l
{
    if(([l.name length] == 0) || ([l.latitude length] == 0) || ([l.longitude length] == 0))
    {
        return NO;
    }
    
    return YES;
}

-(IBAction)cancel:(id)sender
{
    [self.delegate addQuickAddViewControllerDidCancel:self];
}

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.locationToEdit != nil)
    {
        self.title = [NSString stringWithFormat:@"%@ %@",self.locationToEdit.name,self.locationToEdit.latitude, self.locationToEdit.longitude];
        self.nameTextField.text = self.locationToEdit.name;
        self.latitudeTextField.text = self.locationToEdit.latitude;
        self.longitudeTextField.text = self.locationToEdit.longitude;
        
    }
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
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

@end
