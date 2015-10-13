//
//  ViewController.m
//  iWeather
//
//  Created by Mieu Mi on 10/13/15.
//  Copyright © 2015 Thong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *Celcius;

@end

@implementation ViewController
{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes=@[@"Làm việc đừng mong dễ thành, vì việc dễ thành thì lòng thường kiêu ngạo.",@"Đừng so sánh mình với bất cứ ai trong thế giới này. Nếu bạn làm như vậy có nghĩa bạn đang sỉ nhục chính bản thân mình.",@"Ta không được chọn nơi mình sinh ra. Nhưng ta được chọn cách mình sẽ sống.",@"Không có hoàn cảnh nào tuyệt vọng, chỉ có người tuyệt vọng vì hoàn cảnh."];
    locations=@[@"Ho Chi Minh, Viet Nam",@"Da Nang, Viet Nam",@"Can Tho, Viet Nam",@"Vung Tau, Viet Nam",@"Dong Thap, Viet Nam"];
    photoFiles=@[@"thunder",@"sunny",@"windy",@"rain"];
}
- (IBAction)Farenheight:(id)sender {
    self.Celcius.text= @"F";// Khi click vao se chuyen tu C sang F
    }
- (IBAction)updateWeather:(id)sender {
    
    int quoteIndex= arc4random_uniform(quotes.count);
    self.quote.text=quotes[quoteIndex];
    
    int locationIndex= arc4random_uniform(locations.count);
    self.location.text=locations[locationIndex];
    
    int photoFileIndex= arc4random_uniform(photoFiles.count);
    self.weatherIcon.image= [UIImage imageNamed:photoFiles[photoFileIndex]];
    
    self.Celcius.text=@"C";//Khi click vao se chuyen tu F sang C
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    
    
}
//Có dấu trừ trước khai báo là instant method
//Có dấu cộng trước khai báo là class method
- (float) getTemperature {
        return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
