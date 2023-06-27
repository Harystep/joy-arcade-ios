//
//  YCJLaunchViewController.m
//  YCJieJiGame
//
//  Created by John on 2023/6/12.
//

#import "YCJLaunchViewController.h"

@interface YCJLaunchViewController () {
    CGFloat progress;
}
@property (nonatomic, strong) UIImageView       *bgImageV;
@property (nonatomic, strong) UIImageView       *avatarImageV;
@property (nonatomic, strong) UIImageView       *titleImageV;
@property (nonatomic, strong) UIProgressView    *processV;
@property (nonatomic, strong) UILabel           *titleLB;
@end

@implementation YCJLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    progress = 1;
    [self.view addSubview:self.bgImageV];
    [self.view addSubview:self.avatarImageV];
    [self.view addSubview:self.titleImageV];
    [self.view addSubview:self.processV];
    [self.view addSubview:self.titleLB];    
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.titleImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    [self.avatarImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.titleImageV.mas_top).offset(-20);
    }];
    
    [self.processV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.height.mas_equalTo(8);
        make.width.mas_equalTo(kSize(220));
        make.top.equalTo(self.titleImageV.mas_bottom).offset(30);
    }];
    
    [self.titleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.processV.mas_bottom).offset(20);
    }];
    NSString *content = [[NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"zh-Hant"ofType:@"lproj"]] localizedStringForKey:@"确认" value:@""table:nil];
    NSLog(@"content:%@", content);
    [NSTimer scheduledTimerWithTimeInterval:0.045
                                         target:self
                                       selector:@selector(progressChanged:)
                                       userInfo:nil
                                        repeats:YES];
}

-(void)progressChanged:(NSTimer *)timer {
    self.processV.progress += 0.03;
    if (self.processV.progress >= progress) {
        [timer invalidate];
        if (self.completed) {
            self.completed();
        }
    }
}

- (UIImageView *)bgImageV {
    if (!_bgImageV) {
        _bgImageV = [[UIImageView alloc] init];
        _bgImageV.frame = UIScreen.mainScreen.bounds;
        _bgImageV.image = [UIImage imageNamed:@"icon_launch_bg"];
    }
    return _bgImageV;
}

- (UIImageView *)avatarImageV {
    if (!_avatarImageV) {
        _avatarImageV = [[UIImageView alloc] init];
        _avatarImageV.frame = UIScreen.mainScreen.bounds;
        _avatarImageV.image = [UIImage imageNamed:@"icon_launch_avatar"];
    }
    return _avatarImageV;
}

- (UIImageView *)titleImageV {
    if (!_titleImageV) {
        _titleImageV = [[UIImageView alloc] init];
        _titleImageV.frame = UIScreen.mainScreen.bounds;
        _titleImageV.image = [UIImage imageNamed:@"icon_launch_title"];
    }
    return _titleImageV;
}

- (UIProgressView *)processV {
    if (!_processV) {
        _processV = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        // 设置的高度对进度条的高度没影响，整个高度=进度条的高度，进度条也是个圆角矩形
        // 设置进度条颜色
        _processV.trackTintColor = kColorHex(0xA579C2);
        // 设置进度条上进度的颜色
        _processV.progressTintColor = kCommonWhiteColor;
        _processV.cornerRadius = 4;
        // 设置进度默认值，这个相当于百分比，范围在0~1之间，不可以设置最大最小值
        _processV.progress = 0;
    }
    return _processV;
}

- (UILabel *)titleLB {
    if (!_titleLB) {
        _titleLB = [[UILabel alloc] init];
        _titleLB.text = ZCLocalizedString(@"即将进入…", nil);
        _titleLB.textColor = kCommonWhiteColor;
        _titleLB.font = kPingFangRegularFont(14);
    }
    return _titleLB;
}

@end
