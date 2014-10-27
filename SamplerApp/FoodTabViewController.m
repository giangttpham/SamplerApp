//
//  FoodTabViewController.m
//  SamplerApp
//
//  Created by Tra` Beo' on 10/21/14.
//  Copyright (c) 2014 Giang Pham. All rights reserved.
//

#import "FoodTabViewController.h"

#define kCountryComponent 0
#define kFoodComponent 1

@interface FoodTabViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *foodPicker;
@property (weak, nonatomic) IBOutlet UISlider *foodSlider;
@property int foodSliderIncrement;
@property (strong, nonatomic) NSDictionary *countryFood;
@property (strong, nonatomic) NSArray *countries;
@property (strong, nonatomic) NSArray *food;
@end

@implementation FoodTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSBundle *bundle = [NSBundle mainBundle];
    NSURL *plistURL = [bundle URLForResource:@"fooddictionary"
                               withExtension:@"plist"];
    self.countryFood = [NSDictionary
                      dictionaryWithContentsOfURL:plistURL];
    NSArray *allCountries = [self.countryFood allKeys];
    NSArray *sortedCountries = [allCountries sortedArrayUsingSelector:
                             @selector(compare:)];
    self.countries = sortedCountries;
    NSString *selectedCountry = self.countries[0];
    self.food = self.countryFood[selectedCountry];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark -
#pragma mark Picker Data Source Methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component {
    if (component == kCountryComponent) {
        return [self.countries count];
    } else {
        self.foodSliderIncrement = (100+ [self.food count] -1)/[self.food count];
        return [self.food count];
    }
}

#pragma mark Picker Delegate Methods
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (component == kCountryComponent) {
        return self.countries[row];
    } else {
        return self.food[row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component
{
    if (component == kCountryComponent) {
        NSString *selectedCountry = self.countries[row];
        self.food = self.countryFood[selectedCountry];
        [self.foodPicker reloadComponent:kFoodComponent];
        [self.foodPicker selectRow:0
                            inComponent:kFoodComponent  
                               animated:YES];
        self.foodSlider.value = 0;
    }
    else {
        self.foodSlider.value = row * self.foodSliderIncrement;
    }
}
- (IBAction)foodSliderChanged:(id)sender {
    int row = roundf(self.foodSlider.value / self.foodSliderIncrement);
    [self.foodPicker selectRow:row
                        inComponent:kFoodComponent
                            animated:YES];
}

@end
