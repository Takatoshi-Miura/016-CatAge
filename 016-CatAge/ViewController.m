//
//  ViewController.m
//  016-CatAge
//
//  Created by Takatoshi Miura on 2020/10/19.
//

#import "ViewController.h"

@interface ViewController ()

// UIの設定
@property (weak, nonatomic) IBOutlet UITextField *catAgeField;
@property (weak, nonatomic) IBOutlet UILabel *humanAgeLabel;

// メソッドの宣言
- (double)catAgeToHumanAge:(double)catAge;

@end

@implementation ViewController

// ライフサイクルメソッド
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 計算処理
- (IBAction)calc:(id)sender {
    // 猫年齢計算
    double catAge = [_catAgeField.text doubleValue];
    double humanAge = [self catAgeToHumanAge:catAge];
    
    // ラベル表示
    NSString *ans;
    ans = [NSString stringWithFormat:@"%.1f歳",humanAge];
    _humanAgeLabel.text = ans;
}

// 猫年齢計算メソッド
- (double)catAgeToHumanAge:(double)catAge {
    double age;
    
    if (catAge <= 1) {
        age = 20*catAge;
    } else if (catAge <= 5) {
        age = catAge*6 + 15;
    } else if (catAge <= 10) {
        age = catAge*5 + 20;
    } else if (catAge <= 15) {
        age = catAge*4 + 30;
    } else {
        age = catAge*3 + 45;
    }
    
    return age;
}

// 猫年齢入力制限
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(nonnull NSString *)string {
    // 値の取得
    NSMutableString *tmp = [_catAgeField.text mutableCopy];
    [tmp replaceCharactersInRange:range withString:string];
    
    // 年齢100以下かつ4文字以内ならOK
    BOOL isAgeLimit = [tmp doubleValue] <= 100;
    BOOL isLengthLimit = [tmp length] <= 4;
    return isAgeLimit && isLengthLimit;
}

@end
