//
//  LPViewController.h
//  layerplayground
//
//  Created by captain on 8/2/14.
//  Copyright (c) 2014 exactly what it sounds like. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRColorPickerView.h"

@interface LPViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *testView;
@property (weak, nonatomic) IBOutlet UISlider *alphaSlider;
@property (weak, nonatomic) IBOutlet UISlider *verticalOffsetSlider;
@property (weak, nonatomic) IBOutlet UISlider *horizontalOffsetSlider;
@property (weak, nonatomic) IBOutlet UISlider *radiusSlider;
@property (weak, nonatomic) IBOutlet UIButton *colorButton;
@property (strong, nonatomic) HRColorPickerView *colorPickerView;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (weak, nonatomic) IBOutlet UILabel *alphaLabel;
@property (weak, nonatomic) IBOutlet UILabel *vOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *hOffsetLabel;
@property (weak, nonatomic) IBOutlet UILabel *radiusLabel;

- (IBAction)alphaSliderChanged:(UISlider *)sender;
- (IBAction)verticalOffsetSliderChanged:(UISlider *)sender;
- (IBAction)horizontalOffsetSliderChanged:(UISlider *)sender;
- (IBAction)radiusSliderChanged:(UISlider *)sender;
- (IBAction)colorButtonTapped:(UIButton *)sender;

@end
