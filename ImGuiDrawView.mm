#import "Esp/ImGuiDrawView.h"
#import <Metal/Metal.h>
#include "hook/hook.h"
#import <MetalKit/MetalKit.h>
#import <Foundation/Foundation.h>
#define ICON_FA_COG u8"\uf013"
#define ICON_FA_EXTRA u8"\uf067"
#include <iostream>
#include <UIKit/UIKit.h>
#include <vector>
#include "iconcpp.h"
#import "pthread.h"
#include <array>
#include <cmath>
#include <deque>
#include <fstream>
#include <algorithm>
#include <string>
#include <sstream>
#include <cstring>
#include <cstdlib>
#include <cstdio>
#include <cstdint>
#include <cerrno>
#include <cctype>
static int style_idx = 0; // 0=Dark, 1=Red, 2=Classic
// Imgui library
#import "JRMemory.framework/Headers/MemScan.h"
#import "Esp/CaptainHook.h"
#import "Esp/ImGuiDrawView.h"
#import "IMGUI/imgui.h"
#import "IMGUI/imgui_internal.h"
#import "IMGUI/imgui_impl_metal.h"
#import "IMGUI/zzz.h"
#include "oxorany/oxorany_include.h"
#import "Helper/Mem.h"
#include "font.h"
#import "Esp/Includes.h"
#import "Helper/Vector3.h"
#import "Helper/Vector2.h"
#import "Helper/Quaternion.h"
#import "Helper/Monostring.h"
#include "Helper/font.h"
#include "Helper/data.h"

ImFont* verdana_smol;
ImFont* pixel_big = {};
ImFont* pixel_smol = {};
#include "Helper/Obfuscate.h"
#import "Helper/Hooks.h"
#import "IMGUI/zzz.h"
#include <OpenGLES/ES2/gl.h>
#include <OpenGLES/ES2/glext.h>
#include <unistd.h>
#include <string.h>
#define timer(sec) dispatch_after(dispatch_time(DISPATCH_TIME_NOW, sec * NSEC_PER_SEC), dispatch_get_main_queue(), ^
#define kWidth  [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
#define kScale [UIScreen mainScreen].scale
#define UIColorFromHex(hexColor) [UIColor colorWithRed:((float)((hexColor & 0xFF0000) >> 16))/255.0 green:((float)((hexColor & 0xFF00) >> 8))/255.0 blue:((float)(hexColor & 0xFF))/255.0 alpha:1.0]

// Ghost Mode Variables
int FUNC_GHOST(void *instance) {
    return 31278;
}

int FUNC_TELEKILL(void *instance) {
    return 31279;
}
bool func_telekill = false;
bool telekillState = false;



UIWindow *mainWindow;
UIButton *menuView;
@interface ImGuiDrawView () <MTKViewDelegate>
@property (nonatomic, strong) id <MTLDevice> device;
@property (nonatomic, strong) id <MTLCommandQueue> commandQueue;
@property (nonatomic, assign) int ghostSeconds;
@property (nonatomic, strong) UILabel *ghostTimerLabel;
@property (nonatomic, strong) NSTimer *ghostTimer;
@property (nonatomic, strong) UIButton *ghostButtonView;
@property (nonatomic, strong) UISwitch *ghostSwitch;
@property (nonatomic, strong) UIButton *telekillButtonView;
@property (nonatomic, strong) UISwitch *telekillSwitch;
@property (nonatomic, strong) UIButton *faketelekillButtonView;
@property (nonatomic, strong) UISwitch *faketelekillSwitch;
@property (nonatomic, strong) UISwitch *ninjaSwitch;
@property (nonatomic, strong) UIButton *ninjarunButtonView;
@property (nonatomic, strong) UIButton *undergroundButtonView;
@property (nonatomic, strong) UISwitch *undergroundSwitch;
@property (nonatomic, strong) UIButton *blamybanButtonView;
@property (nonatomic, strong) UISwitch *blamybanSwitch;
@end





@implementation ImGuiDrawView
ImFont *_espFont;
ImFont* verdanab;
ImFont* icons;
ImFont* interb;
ImFont* Urbanist;
static bool MenDeal = true;
static bool ShowGhostUI = false;
void* ghostTarget = nullptr;
bool ghostState = false;
bool func_ghost = false;
bool cc;
BOOL hasGhostBeenDrawn = NO;
static bool StreamerMode = true;
static bool saveSettingg = false;
bool fakeLagEnabled = false;
bool FastReloadEnabled = true;
bool undergroundState = false;
bool ninjaState = false;

bool SpeeeX2Enabled = false;
bool NoRecoilEnabled = false;
bool WallGlowEnabled = false;
BOOL hasTelekillBeenDrawn = NO;
BOOL hasfakeTelekillBeenDrawn = NO;
BOOL hasninjaBeenDrawn = NO;
bool WallFlyEnabled = false;
bool WallHackEnabled = false;
bool ScopeEnabled = false;
bool BypassEnabled = true;
bool Underground = false; // Underground
bool ShowUndergroundButton = false; // Nút Underground
bool Ninjarun = false; // Underground
bool ShowNinjarunButton = false; // Nút Underground

bool Blamyban = false;             // UI-only toggle state
bool ShowBlamybanButton = false;   // show/hide the floating button

bool Fastzbb = false;
bool FlyHack = false;




bool fastreload(void* _this){
    if (Fastzbb){
     return true;
    } else { return true;
}
}


bool rsttk = false;
bool Guest(void* _this){
    if (rsttk){
     return true;
    } else { return true;
}
}


bool antiban(void* instance) {
    return false;
}



- (void)saveSettings {
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];

    [saveSetting setBool:Vars.Box forKey:@"box"];
    [saveSetting setBool:Vars.Health forKey:@"health"];
    [saveSetting setBool:Vars.Name forKey:@"name"];
    [saveSetting setBool:Vars.skeleton forKey:@"skeleton"];

    [saveSetting setFloat:Vars.Aimbot forKey:@"Aimbot"];
    [saveSetting setBool:Vars.IgnoreKnocked forKey:@"IgnoreKnocked"];

    [saveSetting setBool:Vars.fovaimglow forKey:@"fovaimglow"];
    [saveSetting setBool:Vars.VisibleCheck forKey:@"VisibleCheck"];
    [saveSetting setBool:Vars.skipwall forKey:@"skipwall"];

    [saveSetting setInteger:Vars.AimWhen forKey:@"AimWhen"];
    [saveSetting setFloat:Vars.isAimFov forKey:@"isAimFov"];
    [saveSetting setInteger:Vars.AimHitbox forKey:@"AimHitbox"];
    [saveSetting setInteger:Vars.aimMode forKey:@"aimMode"];
    [saveSetting setBool:Vars.AimFov forKey:@"AimFov"];

    [saveSetting synchronize];
}




- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveSettings];
}



- (void)loadSettings {
    NSUserDefaults *saveSetting = [NSUserDefaults standardUserDefaults];

    Vars.Box = [saveSetting boolForKey:@"box"];
    Vars.Health = [saveSetting boolForKey:@"health"];
    Vars.Name = [saveSetting boolForKey:@"name"];
    Vars.skeleton = [saveSetting boolForKey:@"skeleton"];

    Vars.Aimbot = [saveSetting floatForKey:@"Aimbot"];
    Vars.IgnoreKnocked = [saveSetting boolForKey:@"IgnoreKnocked"];

    Vars.fovaimglow = [saveSetting boolForKey:@"fovaimglow"];
    Vars.VisibleCheck = [saveSetting boolForKey:@"VisibleCheck"];
    Vars.skipwall = [saveSetting boolForKey:@"skipwall"];

    Vars.AimWhen = [saveSetting integerForKey:@"AimWhen"];
    Vars.isAimFov = [saveSetting floatForKey:@"isAimFov"];
    Vars.AimHitbox = [saveSetting integerForKey:@"AimHitbox"];
    Vars.aimMode = [saveSetting integerForKey:@"aimMode"];
    Vars.AimFov = [saveSetting boolForKey:@"AimFov"];
}














- (void)toggleSpeedX2:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x200000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            uint64_t search = 4397530849764387586;
            engine->JRScanMemory(range, &search, JR_Search_Type_ULong);
            results = engine->getAllResults();
        });

        uint64_t modify = 4366458311853765201;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_ULong);
        }
    } else {
        uint64_t modify = 4397530849764387586; // Original value
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_ULong);
        }
        onceToken = 0;
        results.clear();
    }
    delete engine;
}












- (void)undergroundModeUI {
    if (self.undergroundButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.undergroundButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 300, 58, 54)];
    self.undergroundButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.undergroundButtonView.alpha = 1.0f;
    self.undergroundButtonView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.undergroundButtonView.layer.borderWidth = 1.5f;
    self.undergroundButtonView.layer.cornerRadius = 8;
    self.undergroundButtonView.layer.shadowOpacity = 0;
    self.undergroundButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.undergroundButtonView.layer.shadowRadius = 0;

    [self.undergroundButtonView addTarget:self action:@selector(wasDragged:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [mainWindow addSubview:self.undergroundButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"UNDER";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 1001;
    [self.undergroundButtonView addSubview:label];

    self.undergroundSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.undergroundSwitch.layer.borderWidth = 2.5;
    self.undergroundSwitch.layer.cornerRadius = 8;
    self.undergroundSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.undergroundSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.undergroundSwitch.backgroundColor = [UIColor clearColor];
    self.undergroundSwitch.thumbTintColor = [UIColor whiteColor];
    self.undergroundSwitch.onTintColor = [UIColor redColor];
    [self.undergroundSwitch addTarget:self action:@selector(undergroundSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.undergroundButtonView addSubview:self.undergroundSwitch];
}


- (void)wasDragged:(UIControl *)c withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:self.view];
    c.center = location;
}





- (void)undergroundSwitchChanged:(UISwitch *)sender {
    Vars.Underground = sender.on;
    undergroundState = sender.on;
}



- (void)blamybanModeUI {
    if (self.blamybanButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.blamybanButtonView = [[UIButton alloc] initWithFrame:CGRectMake(370, 300, 58, 54)];
    self.blamybanButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.blamybanButtonView.alpha = 1.0f;
    self.blamybanButtonView.layer.borderColor = [UIColor clearColor].CGColor;
    self.blamybanButtonView.layer.borderWidth = 1.5f;
    self.blamybanButtonView.layer.cornerRadius = 8;
    self.blamybanButtonView.layer.shadowOpacity = 0;
    self.blamybanButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.blamybanButtonView.layer.shadowRadius = 0;

    // reuse your drag handler
    [self.blamybanButtonView addTarget:self
                                action:@selector(wasDragged:withEvent:)
                      forControlEvents:UIControlEventTouchDragInside];

    [mainWindow addSubview:self.blamybanButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"F-UNDER";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 2101;
    [self.blamybanButtonView addSubview:label];

    self.blamybanSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.blamybanSwitch.layer.borderWidth = 2.5;
    self.blamybanSwitch.layer.cornerRadius = 8;
    self.blamybanSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.blamybanSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.blamybanSwitch.backgroundColor = [UIColor clearColor];
    self.blamybanSwitch.thumbTintColor = [UIColor whiteColor];
    self.blamybanSwitch.onTintColor = [UIColor magentaColor];
    [self.blamybanSwitch addTarget:self
                            action:@selector(blamybanSwitchChanged:)
                  forControlEvents:UIControlEventValueChanged];

    [self.blamybanButtonView addSubview:self.blamybanSwitch];
}

- (void)blamybanSwitchChanged:(UISwitch *)sender {
    Vars.Blamyban = sender.on; // UI-only flag
}






- (void)toggleNoRecoil:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x160000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            uint32_t search = 1016018816; // Original value to search for
            engine->JRScanMemory(range, &search, JR_Search_Type_UInt);
            results = engine->getAllResults();
        });

        uint32_t modify = 180; // New value to write
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_UInt);
        }
    } else {
        uint32_t modify = 1016018816; // Original value to restore
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_UInt);
        }
        onceToken = 0;
        results.clear();
    }
    delete engine;
}

- (void)toggleWallGlow:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x160000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            float search = 1.22f;
            engine->JRScanMemory(range, &search, JR_Search_Type_Float);
            results = engine->getAllResults();
        });


        float modify = 965.0f;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
    } else {
        float modify = 1.22f;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
        onceToken = 0;
        results.clear();
    }
    delete engine;
}




- (void)telekillModeUI {
    if (self.telekillButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.telekillButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 330, 58, 54)];
    self.telekillButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.telekillButtonView.alpha = 1.0f;

    // تعديل حدود الزر لتكون مشابهة لزر الـ Ghost
    self.telekillButtonView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.telekillButtonView.layer.borderWidth = 1.5f;
    self.telekillButtonView.layer.cornerRadius = 13;
    self.telekillButtonView.layer.shadowOpacity = 0;
    self.telekillButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.telekillButtonView.layer.shadowRadius = 0;

    // إضافة إمكانية سحب الزر (Drag)
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleTelekillDrag:)];
    [self.telekillButtonView addGestureRecognizer:panGesture];

    [mainWindow addSubview:self.telekillButtonView];

    // إعداد عنوان الزر (Label)
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"Tele";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 1001;
    [self.telekillButtonView addSubview:label];

    // إعداد مفتاح التفعيل (UISwitch)
    self.telekillSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.telekillSwitch.layer.borderWidth = 2.5;
    self.telekillSwitch.layer.cornerRadius = 9;
    self.telekillSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.telekillSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.telekillSwitch.backgroundColor = [UIColor clearColor];
    self.telekillSwitch.thumbTintColor = [UIColor whiteColor];
    self.telekillSwitch.onTintColor = [UIColor blackColor];
    [self.telekillSwitch addTarget:self action:@selector(telekillSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.telekillButtonView addSubview:self.telekillSwitch];
}



- (void)handleTelekillDrag:(UIPanGestureRecognizer *)gesture {
    if (!gesture || !gesture.view) return;

    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];

    if (!draggedView.superview) return;

    draggedView.center = CGPointMake(
        draggedView.center.x + translation.x,
        draggedView.center.y + translation.y
    );

    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}



- (void)telekillSwitchChanged:(UISwitch *)sender {
    Vars.Telekill = sender.on; // Amr
}



- (void)faketelekillModeUI {
    if (self.faketelekillButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.faketelekillButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 330, 58, 54)];
    self.faketelekillButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.faketelekillButtonView.alpha = 1.0f;

    // تعديل حدود الزر لتكون مشابهة لزر الـ Ghost
    self.faketelekillButtonView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.faketelekillButtonView.layer.borderWidth = 1.5f;
    self.faketelekillButtonView.layer.cornerRadius = 13;
    self.faketelekillButtonView.layer.shadowOpacity = 0;
    self.faketelekillButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.faketelekillButtonView.layer.shadowRadius = 0;

    // إضافة إمكانية سحب الزر (Drag)
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlefakeTelekillDrag:)];
    [self.faketelekillButtonView addGestureRecognizer:panGesture];

    [mainWindow addSubview:self.faketelekillButtonView];

    // إعداد عنوان الزر (Label)
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"F-Tele";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 1001;
    [self.faketelekillButtonView addSubview:label];

    // إعداد مفتاح التفعيل (UISwitch)
    self.faketelekillSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.faketelekillSwitch.layer.borderWidth = 2.5;
    self.faketelekillSwitch.layer.cornerRadius = 9;
    self.faketelekillSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.faketelekillSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.faketelekillSwitch.backgroundColor = [UIColor clearColor];
    self.faketelekillSwitch.thumbTintColor = [UIColor whiteColor];
    self.faketelekillSwitch.onTintColor = [UIColor magentaColor];
    [self.faketelekillSwitch addTarget:self action:@selector(faketelekillSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.faketelekillButtonView addSubview:self.faketelekillSwitch];
}



- (void)handlefakeTelekillDrag:(UIPanGestureRecognizer *)gesture {
    if (!gesture || !gesture.view) return;

    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];

    if (!draggedView.superview) return;

    draggedView.center = CGPointMake(
        draggedView.center.x + translation.x,
        draggedView.center.y + translation.y
    );

    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}



- (void)faketelekillSwitchChanged:(UISwitch *)sender {
    Vars.fakeTelekill = sender.on; // Amr
}






- (void)ninjaRunModeUI {
    if (self.ninjarunButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.ninjarunButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 330, 58, 54)];
    self.ninjarunButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.ninjarunButtonView.alpha = 1.0f;

    // تعديل حدود الزر لتكون مشابهة لزر الـ Ghost
    self.ninjarunButtonView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.ninjarunButtonView.layer.borderWidth = 1.5f;
    self.ninjarunButtonView.layer.cornerRadius = 8;
    self.ninjarunButtonView.layer.shadowOpacity = 0;
    self.ninjarunButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.ninjarunButtonView.layer.shadowRadius = 0;

    // إضافة إمكانية سحب الزر (Drag)
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleninjaDrag:)];
    [self.ninjarunButtonView addGestureRecognizer:panGesture];

    [mainWindow addSubview:self.ninjarunButtonView];

    // إعداد عنوان الزر (Label)
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"Ninja";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 1001;
    [self.ninjarunButtonView addSubview:label];

    // إعداد مفتاح التفعيل (UISwitch)
    self.ninjaSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.ninjaSwitch.layer.borderWidth = 2.5;
    self.ninjaSwitch.layer.cornerRadius = 9;
    self.ninjaSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.ninjaSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.ninjaSwitch.backgroundColor = [UIColor clearColor];
    self.ninjaSwitch.thumbTintColor = [UIColor whiteColor];
    self.ninjaSwitch.onTintColor = [UIColor blueColor];
    [self.ninjaSwitch addTarget:self action:@selector(ninjaSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.ninjarunButtonView addSubview:self.ninjaSwitch];
}





- (void)handleninjaDrag:(UIPanGestureRecognizer *)gesture {
    if (!gesture || !gesture.view) return;

    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];

    if (!draggedView.superview) return;

    draggedView.center = CGPointMake(
        draggedView.center.x + translation.x,
        draggedView.center.y + translation.y
    );

    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}



- (void)ninjaSwitchChanged:(UISwitch *)sender {
    Vars.Ninjarun = sender.on; // Amr
}








- (void)ghostModeUI {
    if (self.ghostButtonView) return;

    UIWindow *mainWindow = [UIApplication sharedApplication].keyWindow;

    self.ghostButtonView = [[UIButton alloc] initWithFrame:CGRectMake(305, 265, 58, 54)];
    self.ghostButtonView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    self.ghostButtonView.alpha = 1.0f;
    self.ghostButtonView.layer.borderColor = [[UIColor clearColor] CGColor];
    self.ghostButtonView.layer.borderWidth = 1.5f;
    self.ghostButtonView.layer.cornerRadius = 8;
    self.ghostButtonView.layer.shadowOpacity = 0;
    self.ghostButtonView.layer.shadowColor = [UIColor clearColor].CGColor;
    self.ghostButtonView.layer.shadowRadius = 0;

    [self.ghostButtonView addTarget:self action:@selector(wasDraggeGhostd:withEvent:) forControlEvents:UIControlEventTouchDragInside];
    [mainWindow addSubview:self.ghostButtonView];

    // عنوان Ghost
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(7, 1, 72, 20.8)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"CourierNewPS-BoldMT" size:10];
    label.numberOfLines = 1;
    label.text = @"Ghost";
    label.shadowColor = [UIColor clearColor];
    label.shadowOffset = CGSizeMake(1.1, 1.1);
    label.backgroundColor = [UIColor clearColor];
    label.tag = 1001;
    [self.ghostButtonView addSubview:label];

    // مفتاح التفعيل UISwitch
    self.ghostSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(3.5, 20, 51, 31)];
    self.ghostSwitch.layer.borderWidth = 2.5;
    self.ghostSwitch.layer.cornerRadius = 11;
    self.ghostSwitch.layer.borderColor = [UIColor clearColor].CGColor;
    self.ghostSwitch.transform = CGAffineTransformMakeScale(1.00, 1.00);
    self.ghostSwitch.backgroundColor = [UIColor clearColor];
    self.ghostSwitch.thumbTintColor = [UIColor whiteColor];
    self.ghostSwitch.onTintColor = [UIColor orangeColor];
    [self.ghostSwitch addTarget:self action:@selector(ghostSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    [self.ghostButtonView addSubview:self.ghostSwitch];

    // ✅ عداد الثواني فوق الزر
    self.ghostTimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.ghostButtonView.frame.origin.x, self.ghostButtonView.frame.origin.y - 25, 80, 20)];
    self.ghostTimerLabel.text = @"1s";
    self.ghostTimerLabel.textAlignment = NSTextAlignmentCenter;
    self.ghostTimerLabel.textColor = [UIColor greenColor];
    self.ghostTimerLabel.font = [UIFont boldSystemFontOfSize:17];
    self.ghostTimerLabel.tag = 2025;
    self.ghostTimerLabel.hidden = YES; // تبدأ مخفية
    [mainWindow addSubview:self.ghostTimerLabel];
}



- (void)wasDraggeGhostd:(UIButton *)button withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint previousLocation = [touch previousLocationInView:button.superview];
    CGPoint location = [touch locationInView:button.superview];

    CGFloat deltaX = location.x - previousLocation.x;
    CGFloat deltaY = location.y - previousLocation.y;

    // تحريك الزر
    button.center = CGPointMake(button.center.x + deltaX, button.center.y + deltaY);

    // تحريك العداد ليبقى فوق الزر
    if (self.ghostTimerLabel) {
        CGRect frame = self.ghostTimerLabel.frame;
        frame.origin.x = button.frame.origin.x;
        frame.origin.y = button.frame.origin.y - 25;
        self.ghostTimerLabel.frame = frame;
    }
}



- (void)updateGhostTimer {
    self.ghostSeconds++;
    self.ghostTimerLabel.text = [NSString stringWithFormat:@"%ds", self.ghostSeconds];

    if (self.ghostSeconds >= 5) {
        self.ghostTimerLabel.textColor = [UIColor redColor];  // بعد 5 ثواني يصبح أحمر
    } else {
        self.ghostTimerLabel.textColor = [UIColor greenColor]; // قبل 5 ثواني باللون الأسود
    }
}





- (void)ghostSwitchChanged:(UISwitch *)sender {
    Vars.EnableGhost = sender.on;

    static bool ghostState = false;
    void* ghostMain = (void*)getRealOffset(ENCRYPTOFFSET("0x105C0DC8C")); // main ghost effect

    if (sender.on && !ghostState) {
        // فعل الـ Ghost
        hook((void*[]){ ghostMain },
             (void*[]){ (void*)FUNC_GHOST },
             1);
        func_ghost = true;
        ghostState = true;

        // إعداد وإظهار العداد
        self.ghostSeconds = 1;
        self.ghostTimerLabel.hidden = NO;
        self.ghostTimerLabel.textColor = [UIColor greenColor];
        self.ghostTimerLabel.text = @"1s";

        self.ghostTimer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                           target:self
                                                         selector:@selector(updateGhostTimer)
                                                         userInfo:nil
                                                          repeats:YES];

    } else if (!sender.on && ghostState) {
        // إيقاف الـ Ghost
        unhook(ghostMain);
        func_ghost = false;
        ghostState = false;

        // إخفاء العداد وإيقاف التايمر
        [self.ghostTimer invalidate];
        self.ghostTimer = nil;
        self.ghostTimerLabel.hidden = YES;
        self.ghostSeconds = 1;
    }
}


- (void)handleGhostDrag:(UIPanGestureRecognizer *)gesture {
    UIView *draggedView = gesture.view;
    CGPoint translation = [gesture translationInView:draggedView.superview];
    CGPoint newCenter = CGPointMake(draggedView.center.x + translation.x, draggedView.center.y + translation.y);
    draggedView.center = newCenter;
    [gesture setTranslation:CGPointZero inView:draggedView.superview];
}


- (void)toggleWallFly:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x160000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            float search = 1.5f;
            engine->JRScanMemory(range, &search, JR_Search_Type_Float);
            results = engine->getAllResults();
        });

        float modify = 900.0f;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
    } else {
        float modify = 1.5f;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
        onceToken = 0;
        results.clear();
    }
    delete engine;
}



- (void)toggleWallHack:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x160000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            float search = 2;
            engine->JRScanMemory(range, &search, JR_Search_Type_Float);
            float search1 = 0.10000000149;
            engine->JRNearBySearch(0x20, &search1, JR_Search_Type_Float);
            float search2 = 3;
            engine->JRScanMemory(range, &search2, JR_Search_Type_Float);
            float search3 = 4.2038954e-45;
            engine->JRScanMemory(range, &search3, JR_Search_Type_Float);
            float search4 = 4.2038954e-45;
            engine->JRNearBySearch(0x20, &search4, JR_Search_Type_Float);
            results = engine->getAllResults();
        });

        float modify = -99;
        float modify1 = -1;
        float modify2 = -999;
        float modify3 = 1.3998972e-42;
        float modify4 = 1.3998972e-42;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
    } else {
        // Note: Original values not provided in the original code
        // You would need to restore the original values here
        onceToken = 0;
        results.clear();
    }
    delete engine;
}


- (void)ghost {
    mainWindow = [[UIApplication sharedApplication] keyWindow];



    if (!menuView) {
        // Tạo menuView với nền tròn màu đen nhạt
        menuView = [UIButton buttonWithType:UIButtonTypeCustom]; // Thay đổi ở đây
        menuView.frame = CGRectMake(305, 265, 70, 70);
        menuView.layer.cornerRadius = menuView.bounds.size.width / 2; // Hình tròn
        menuView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.6]; // Nền đen nhạt
        menuView.alpha = 1.0f;

        // Đảm bảo chỉ thêm vào cửa sổ chính một lần
        [mainWindow addSubview:menuView];

        // Thêm sự kiện kéo nút sử dụng UIPanGestureRecognizer
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [menuView addGestureRecognizer:panGesture];

        // Thêm nhãn cho trạng thái Aimbot
        UILabel *aimLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 70, 20)]; // Đặt đúng vị trí
        aimLabel.font = [UIFont fontWithName:@"CoreAddition-Arial.ttf" size:12];
        aimLabel.textAlignment = NSTextAlignmentCenter; // Canh giữa
        aimLabel.backgroundColor = [UIColor clearColor]; // Không có nền
        aimLabel.tag = 100; // Gán thẻ để truy xuất sau

        // Thêm nhãn vào menuView
        [menuView addSubview:aimLabel];

        // Đặt văn bản cho nhãn
        aimLabel.text = @"Fake Lag";
        aimLabel.textColor = [UIColor redColor]; // Màu chữ bắt đầu là đỏ (tắt)

        // Tạo nút để bật/tắt Aimbot
        UIButton *aimButton = [UIButton buttonWithType:UIButtonTypeCustom];
        aimButton.frame = CGRectMake(0, 0, 100, 100); // Kích thước giống như menuView
        aimButton.layer.cornerRadius = aimButton.bounds.size.width / 2; // Tạo hình tròn
        aimButton.backgroundColor = [UIColor clearColor]; // Nền trong suốt
        [aimButton addTarget:self action:@selector(switchIsChanged:) forControlEvents:UIControlEventTouchUpInside];

        // Thêm nút vào menuView
        [menuView addSubview:aimButton];

        hasGhostBeenDrawn = YES; // Đánh dấu menu đã được vẽ
    }
}


- (void)removeGhost {
    if (menuView) {
        [menuView removeFromSuperview];
        menuView = nil;
        hasGhostBeenDrawn = NO;
    }
}

- (void)toggleScope:(BOOL)enable {
    static dispatch_once_t onceToken;
    static vector<void*> results;

    JRMemoryEngine *engine = new JRMemoryEngine(mach_task_self());
    AddrRange range = {0x100000000, 0x160000000};

    if (enable) {
        dispatch_once(&onceToken, ^{
            float search = 0.03f;
            engine->JRScanMemory(range, &search, JR_Search_Type_Float);
            results = engine->getAllResults();
        });

        float modify = 10.0f;
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
    } else {
        float modify = 0.03f; // Original value
        for(int i = 0; i < results.size(); i++) {
            engine->JRWriteMemory((unsigned long long)(results[i]), &modify, JR_Search_Type_Float);
        }
        onceToken = 0;
        results.clear();
    }
    delete engine;
}

- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    _device = MTLCreateSystemDefaultDevice();
    _commandQueue = [_device newCommandQueue];

    if (!self.device) abort();

    IMGUI_CHECKVERSION();
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO(); (void)io;
    ImGuiStyle& style = ImGui::GetStyle();

// Color settings
style.Colors[ImGuiCol_Text]                   = ImVec4(0.95f, 0.95f, 0.95f, 1.00f);
style.Colors[ImGuiCol_TextDisabled]           = ImVec4(0.60f, 0.60f, 0.60f, 1.00f);
style.Colors[ImGuiCol_WindowBg]               = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);  // أسود نصف شفاف
style.Colors[ImGuiCol_ChildBg]                = ImVec4(0.00f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_PopupBg]                = ImVec4(0.08f, 0.00f, 0.00f, 0.90f);
style.Colors[ImGuiCol_Border]                 = ImVec4(0.50f, 0.00f, 0.00f, 0.50f);
style.Colors[ImGuiCol_BorderShadow]           = ImVec4(0.5f, 0.0f, 0.0f, 0.7f);
style.Colors[ImGuiCol_FrameBg]                = ImVec4(0.20f, 0.00f, 0.00f, 0.54f);
style.Colors[ImGuiCol_FrameBgHovered]         = ImVec4(0.40f, 0.00f, 0.00f, 0.40f);
style.Colors[ImGuiCol_FrameBgActive]          = ImVec4(0.50f, 0.00f, 0.00f, 0.67f);
style.Colors[ImGuiCol_TitleBg]                = ImVec4(0.30f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_TitleBgActive]          = ImVec4(0.50f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_TitleBgCollapsed]       = ImVec4(0.6f, 0.0f, 0.0f, 0.9f);
style.Colors[ImGuiCol_MenuBarBg]              = ImVec4(0.6f, 0.0f, 0.0f, 1.0f);
style.Colors[ImGuiCol_ScrollbarBg]            = ImVec4(0.50f, 0.00f, 0.00f, 0.90f);
style.Colors[ImGuiCol_ScrollbarGrab]          = ImVec4(1.0f, 0.4f, 0.4f, 0.6f);//
style.Colors[ImGuiCol_ScrollbarGrabHovered]   = ImVec4(0.9f, 0.2f, 0.2f, 0.8f);
style.Colors[ImGuiCol_ScrollbarGrabActive]    = ImVec4(1.0f, 0.0f, 0.0f, 1.0f);  // أحمر نيون ساطع وبدون شفافية
style.Colors[ImGuiCol_CheckMark]              = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);  // أحمر نيون فاتح وقوي
style.Colors[ImGuiCol_SliderGrab]             = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);  // أحمر مع لمسة نيوني وردي فاتح
style.Colors[ImGuiCol_SliderGrabActive]       = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);//
style.Colors[ImGuiCol_Button]                 = ImVec4(0.50f, 0.00f, 0.00f, 0.60f);
style.Colors[ImGuiCol_ButtonHovered]          = ImVec4(0.70f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_ButtonActive]           = ImVec4(0.80f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_Header]                 = ImVec4(0.50f, 0.00f, 0.00f, 0.31f);
style.Colors[ImGuiCol_HeaderHovered]          = ImVec4(1.00f, 0.00f, 0.00f, 0.67f); // أحمر غامق
style.Colors[ImGuiCol_HeaderActive]           = ImVec4(1.00f, 0.00f, 0.00f, 0.95f);
style.Colors[ImGuiCol_Separator]              = ImVec4(0.6f, 0.1f, 0.1f, 0.5f);
style.Colors[ImGuiCol_SeparatorHovered]       = ImVec4(0.60f, 0.00f, 0.00f, 0.78f);
style.Colors[ImGuiCol_SeparatorActive]        = ImVec4(0.70f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_ResizeGrip]             = ImVec4(1.00f, 0.00f, 0.00f, 0.25f);
style.Colors[ImGuiCol_ResizeGripHovered]      = ImVec4(0.60f, 0.00f, 0.00f, 0.80f);
style.Colors[ImGuiCol_ResizeGripActive]       = ImVec4(0.70f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_Tab]                    = ImVec4(0.50f, 0.00f, 0.00f, 0.86f);
style.Colors[ImGuiCol_TabHovered]             = ImVec4(0.70f, 0.00f, 0.00f, 0.80f);
style.Colors[ImGuiCol_TabActive]              = ImVec4(0.80f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_TabUnfocused]           = ImVec4(0.3f, 0.1f, 0.1f, 0.97f);
style.Colors[ImGuiCol_TabUnfocusedActive]     = ImVec4(0.5f, 0.0f, 0.0f, 1.00f);
style.Colors[ImGuiCol_PlotLines]              = ImVec4(1.0f, 0.3f, 0.3f, 1.00f);
style.Colors[ImGuiCol_PlotLinesHovered]       = ImVec4(0.90f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_PlotHistogram]          = ImVec4(0.80f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_PlotHistogramHovered]   = ImVec4(0.90f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_TextSelectedBg]         = ImVec4(1.00f, 0.00f, 0.00f, 0.35f);
style.Colors[ImGuiCol_DragDropTarget]         = ImVec4(0.90f, 0.00f, 0.00f, 0.90f);
style.Colors[ImGuiCol_NavHighlight]           = ImVec4(1.00f, 0.00f, 0.00f, 1.00f);
style.Colors[ImGuiCol_NavWindowingHighlight]  = ImVec4(0.80f, 0.00f, 0.00f, 0.70f);
style.Colors[ImGuiCol_NavWindowingDimBg]      = ImVec4(0.50f, 0.00f, 0.00f, 0.20f);
style.Colors[ImGuiCol_ModalWindowDimBg]       = ImVec4(0.20f, 0.00f, 0.00f, 0.35f);

style.WindowRounding = 10.0f;
style.ChildRounding = 10.0f;
style.FrameRounding = 7.0f;
style.GrabRounding = 12.0f;
style.PopupRounding = 10.0f;
style.ScrollbarRounding = 10.0f;
style.TabRounding = 10.0f;

// Border sizes
style.WindowBorderSize = 1.0f;
style.FrameBorderSize = 1.0f;
style.PopupBorderSize = 1.0f;

// Spacing
style.WindowPadding = ImVec2(10.0f, 8.0f);
style.FramePadding = ImVec2(12.0f, 4.0f);
style.ItemSpacing = ImVec2(6.0f, 2.0f);











    static const ImWchar icons_ranges[] = { 0xf000, 0xf3ff, 0 };
    ImFontConfig icons_config;
    ImFontConfig CustomFont;
    CustomFont.FontDataOwnedByAtlas = false;
    icons_config.MergeMode = true;
    icons_config.PixelSnapH = true;
    io.Fonts->AddFontFromMemoryTTF(const_cast<std::uint8_t*>(Custom), sizeof(Custom), 21.f, &CustomFont);
    io.Fonts->AddFontFromMemoryCompressedTTF(font_awesome_data, font_awesome_size, 19.0f, &icons_config, icons_ranges);
    io.Fonts->AddFontDefault();
    ImFont* font = io.Fonts->AddFontFromMemoryTTF(sansbold, sizeof(sansbold), 21.0f, NULL, io.Fonts->GetGlyphRangesCyrillic());
    verdana_smol = io.Fonts->AddFontFromMemoryTTF(verdana, sizeof verdana, 40, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_big = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 400, NULL, io.Fonts->GetGlyphRangesCyrillic());
    pixel_smol = io.Fonts->AddFontFromMemoryTTF((void*)smallestpixel, sizeof smallestpixel, 10*2, NULL, io.Fonts->GetGlyphRangesCyrillic());
    ImGui_ImplMetal_Init(_device);

    return self;
}

+ (void)showChange:(BOOL)open {
    MenDeal = open;
}

+ (BOOL)isMenuShowing {
    return MenDeal;
}

- (MTKView *)mtkView {
    return (MTKView *)self.view;
}

- (void)loadView
{
    CGFloat w = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width;
    CGFloat h = [UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height;
    self.view = [[MTKView alloc] initWithFrame:CGRectMake(0, 0, w, h)];
void* address[] = {
(void*)getRealOffset(ENCRYPTOFFSET("0x44C752C")),


    };
    void* function[] = {
        (void*)Guest,
    };
    hook(address, function, 1);

}
- (void)viewDidLoad {
    [super viewDidLoad];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        mainWindow = [UIApplication sharedApplication].keyWindow;
        // [self text]; ← تم حذفه
    });

    self.mtkView.device = self.device;
    if (!self.mtkView.device) {
        return;
    }

    self.mtkView.delegate = self;
    self.mtkView.clearColor = MTLClearColorMake(0, 0, 0, 0);
    self.mtkView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    self.mtkView.clipsToBounds = YES;
}


#pragma mark - Interaction

- (void)updateIOWithTouchEvent:(UIEvent *)event
{
    UITouch *anyTouch = event.allTouches.anyObject;
    CGPoint touchLocation = [anyTouch locationInView:self.view];
    ImGuiIO &io = ImGui::GetIO();
    io.MousePos = ImVec2(touchLocation.x, touchLocation.y);

    BOOL hasActiveTouch = NO;
    for (UITouch *touch in event.allTouches)
    {
        if (touch.phase != UITouchPhaseEnded && touch.phase != UITouchPhaseCancelled)
        {
            hasActiveTouch = YES;
            break;
        }
    }
    io.MouseDown[0] = hasActiveTouch;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self updateIOWithTouchEvent:event];
}




// أضف قبل drawInMTKView

#pragma mark - MTKViewDelegate
- (void)drawInMTKView:(MTKView *)view {
    ImGuiIO& io = ImGui::GetIO();
    io.DisplaySize.x = view.bounds.size.width;
    io.DisplaySize.y = view.bounds.size.height;

    CGFloat framebufferScale = view.window.screen.nativeScale ?: UIScreen.mainScreen.nativeScale;
    io.DisplayFramebufferScale = ImVec2(framebufferScale, framebufferScale);
    io.DeltaTime = 1 / float(view.preferredFramesPerSecond ?: 60);




    id<MTLCommandBuffer> commandBuffer = [self.commandQueue commandBuffer];

    hideRecordTextfield.secureTextEntry = StreamerMode;

    if (MenDeal == true)
    {
        [self.view setUserInteractionEnabled:YES];
        [self.view.superview setUserInteractionEnabled:YES];
        [menuTouchView setUserInteractionEnabled:YES];
    }
    else if (MenDeal == false)
    {
        [self.view setUserInteractionEnabled:NO];
        [self.view.superview setUserInteractionEnabled:NO];
        [menuTouchView setUserInteractionEnabled:NO];
    }

    MTLRenderPassDescriptor* renderPassDescriptor = view.currentRenderPassDescriptor;
    if (renderPassDescriptor != nil)
    {
        id<MTLRenderCommandEncoder> renderEncoder = [commandBuffer renderCommandEncoderWithDescriptor:renderPassDescriptor];
        [renderEncoder pushDebugGroup:@"ImGui Jane"];

        ImGui_ImplMetal_NewFrame(renderPassDescriptor);
        ImGui::NewFrame();
        ImGuiStyle& style = ImGui::GetStyle();
        ImFont* font = ImGui::GetFont();
        font->Scale = 16.f / font->FontSize;

        CGFloat x = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.width) - 340) / 2;
        CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 250) / 2;

ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(340, 250), ImGuiCond_FirstUseEver);


        if (MenDeal == true)
        {
            ImGui::Begin(ENCRYPT("VIG4R IOS V1"), &MenDeal);
            ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(9, 4));
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(9, 4));

            if (ImGui::BeginTabBar("Tab", ImGuiTabBarFlags_FittingPolicyScroll))
            {
                // Tab Visuals
                if (ImGui::BeginTabItem(ICON_FA_EYE " Esp"))
{

ImGui::Columns(2, "ESPColumns", false);

    ImGui::Checkbox(ENCRYPT("Enable Esp"), &Vars.Enable);

    ImGui::NextColumn();


    ImGui::Checkbox(ENCRYPT("Streaim Mode"), &StreamerMode);

ImGui::Columns(1);
    ImGui::Separator();


    ImGui::Checkbox(ENCRYPT("Esp Line"), &Vars.lines);
    ImGui::Checkbox(ENCRYPT("Esp Name"), &Vars.Name);
    ImGui::Checkbox(ENCRYPT("Esp Box"), &Vars.Box);
    ImGui::Checkbox(ENCRYPT("Esp Skeleton"), &Vars.skeleton);

    ImGui::Checkbox(ENCRYPT("Esp Vida"), &Vars.Health);



ImGui::Separator();


    ImGui::EndTabItem();
}



                if (ImGui::BeginTabItem(ICON_FA_CROSSHAIRS " Aimbot"))

                {




ImGui::Columns(2, "AimBotColumns", false);

                    ImGui::Checkbox(ENCRYPT("Enale Aimbot"), &Vars.Aimbot);
                  ImGui::Checkbox(ENCRYPT("Ingore Knocked"), &Vars.IgnoreKnocked);
                  ImGui::Checkbox(ENCRYPT("Aim Wukong"), &Vars.skipwall);
  ImGui::NextColumn();


                    ImGui::Checkbox(ENCRYPT("Ignore Visibility Check"), &Vars.VisibleCheck);
                    ImGui::Checkbox(ENCRYPT("Show FOV Circle"), &Vars.isAimFov);
                    ImGui::Checkbox(ENCRYPT("Aim Fov"), &Vars.fovaimglow);
ImGui::Columns(1);


                    ImGui::Separator();


ImGui::PushItemWidth(190);
                    ImGui::Combo(ENCRYPT("AimDir"), &Vars.AimWhen, Vars.dir, 4);
                    ImGui::Combo(ENCRYPT("Target"), &Vars.AimHitbox, Vars.aimHitboxes, 3);
                    ImGui::Combo(ENCRYPT("Style Aim"), &Vars.aimMode, Vars.aimmode, IM_ARRAYSIZE(Vars.aimmode));


ImGui::PopItemWidth();

ImGui::PushItemWidth(210);


ImGui::SliderFloat(ENCRYPT("Regular Fov"), &Vars.AimFov, 0.00f, 500.00f, "[ %.1f ]", ImGuiSliderFlags_None);


ImGui::PopItemWidth();
                    // Push/Pop cân bằng
                    ImGui::Separator();

                    ImGui::EndTabItem();
                }

                // Tab Misc
                if (ImGui::BeginTabItem(ICON_FA_FIRE " Misc"))

{



if (ImGui::Combo("Cor Do Painel", &style_idx, "Roxo\0Azul\0Clássico\0")) {
    ImGuiStyle& style = ImGui::GetStyle(); // نقل تعريف المتغير خارج الـ switch

    switch (style_idx) {
        case 0:
style.Colors[ImGuiCol_Text] = ImVec4(1.00f, 1.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_TextDisabled] = ImVec4(0.50f, 0.50f, 0.50f, 1.00f);
style.Colors[ImGuiCol_WindowBg] = ImVec4(0.06f, 0.06f, 0.06f, 0.94f);
style.Colors[ImGuiCol_ChildBg] = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
style.Colors[ImGuiCol_PopupBg] = ImVec4(0.08f, 0.08f, 0.08f, 0.94f);
style.Colors[ImGuiCol_Border] = ImVec4(0.43f, 0.43f, 0.50f, 0.50f);
style.Colors[ImGuiCol_FrameBg] = ImVec4(0.16f, 0.00f, 0.29f, 0.54f);         // بنفسجي غامق
style.Colors[ImGuiCol_FrameBgHovered] = ImVec4(0.45f, 0.00f, 0.75f, 0.40f);  // بنفسجي فاتح
style.Colors[ImGuiCol_FrameBgActive] = ImVec4(0.45f, 0.00f, 0.75f, 0.67f);    // بنفسجي ساطع
style.Colors[ImGuiCol_TitleBg] = ImVec4(0.04f, 0.04f, 0.04f, 1.00f);
style.Colors[ImGuiCol_TitleBgActive] = ImVec4(0.25f, 0.00f, 0.50f, 1.00f);    // بنفسجي داكن
style.Colors[ImGuiCol_CheckMark] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f);        // بنفسجي نيون
style.Colors[ImGuiCol_SliderGrab] = ImVec4(0.55f, 0.00f, 0.80f, 1.00f);      // بنفسجي متوسط
style.Colors[ImGuiCol_SliderGrabActive] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f); // بنفسجي ساطع
style.Colors[ImGuiCol_Button] = ImVec4(0.45f, 0.00f, 0.75f, 0.40f);          // بنفسجي شفاف
style.Colors[ImGuiCol_ButtonHovered] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f);   // بنفسجي نيون
style.Colors[ImGuiCol_Header] = ImVec4(0.45f, 0.00f, 0.75f, 0.31f);          // بنفسجي شفاف
style.Colors[ImGuiCol_HeaderHovered] = ImVec4(0.70f, 0.00f, 1.00f, 0.80f);   // بنفسجي فاتح
style.Colors[ImGuiCol_HeaderActive] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f);

// إكمال إعدادات الألوان لتحقيق التناسق البنفسجي
style.Colors[ImGuiCol_Tab] = ImVec4(0.20f, 0.00f, 0.35f, 0.86f);            // لون تبويب غير النشط
style.Colors[ImGuiCol_TabHovered] = ImVec4(0.45f, 0.00f, 0.75f, 0.80f);     // تبويب عند التحويم
style.Colors[ImGuiCol_TabActive] = ImVec4(0.35f, 0.00f, 0.60f, 1.00f);      // تبويب نشط
style.Colors[ImGuiCol_TabUnfocused] = ImVec4(0.10f, 0.00f, 0.20f, 0.97f);   // تبويب غير مركز
style.Colors[ImGuiCol_TabUnfocusedActive] = ImVec4(0.25f, 0.00f, 0.45f, 1.00f);

// ألوان عناصر التمرير
style.Colors[ImGuiCol_ScrollbarBg] = ImVec4(0.08f, 0.00f, 0.15f, 0.90f);    // خلفية شريط التمرير
style.Colors[ImGuiCol_ScrollbarGrab] = ImVec4(0.45f, 0.00f, 0.75f, 0.60f);  // زر التمرير
style.Colors[ImGuiCol_ScrollbarGrabHovered] = ImVec4(0.60f, 0.00f, 0.90f, 0.80f);
style.Colors[ImGuiCol_ScrollbarGrabActive] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f);

// ألوان العناصر الإضافية
style.Colors[ImGuiCol_Separator] = ImVec4(0.50f, 0.00f, 0.80f, 0.50f);      // فاصل
style.Colors[ImGuiCol_SeparatorHovered] = ImVec4(0.70f, 0.00f, 1.00f, 0.78f);
style.Colors[ImGuiCol_SeparatorActive] = ImVec4(0.80f, 0.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_ResizeGrip] = ImVec4(0.45f, 0.00f, 0.75f, 0.60f);     // مقبض التغيير
style.Colors[ImGuiCol_ResizeGripHovered] = ImVec4(0.60f, 0.00f, 0.90f, 0.80f);
style.Colors[ImGuiCol_ResizeGripActive] = ImVec4(0.70f, 0.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_PlotLines] = ImVec4(0.80f, 0.00f, 1.00f, 1.00f);      // خطوط الرسوم
style.Colors[ImGuiCol_PlotHistogram] = ImVec4(0.80f, 0.00f, 1.00f, 1.00f);  // أشرطة الرسوم
  // بنفسجي ساطع
            break;
        case 1:
            ImGui::StyleColorsDark();
            break;
        case 2:
            ImGui::StyleColorsClassic();
            break;

            case 3:
            // 🎨 ثيم أبيض
            ImGui::StyleColorsLight();
            style.Colors[ImGuiCol_Text] = ImVec4(0.00f, 0.00f, 0.00f, 1.00f); // نص أسود
            style.Colors[ImGuiCol_Button] = ImVec4(1.00f, 1.00f, 1.00f, 0.80f); // زر أبيض
            style.Colors[ImGuiCol_ButtonHovered] = ImVec4(0.90f, 0.90f, 0.90f, 1.00f);
            style.Colors[ImGuiCol_ButtonActive] = ImVec4(0.80f, 0.80f, 0.80f, 1.00f);
            break;
    }
}



 ImGui::Separator();


                 //   ImGui::Columns(2, "MiscColumns", false);
                    if (ImGui::Checkbox(ENCRYPT("Speed "), &SpeeeX2Enabled)) {
    [self toggleSpeedX2:SpeeeX2Enabled];
}
ImGui::SameLine();
ImGui::TextDisabled("");
if (ImGui::IsItemHovered())
    ImGui::SetTooltip("");





if (ImGui::Checkbox(ENCRYPT("No Recoil"), &NoRecoilEnabled)) {
    [self toggleNoRecoil:NoRecoilEnabled];
}
ImGui::SameLine();
ImGui::TextDisabled("");
if (ImGui::IsItemHovered())
    ImGui::SetTooltip("");


 ImGui::Checkbox(ENCRYPT("Bypass"), &BypassEnabled);
ImGui::Checkbox(ENCRYPT("Up Player "), &Vars.isfly);
 ImGui::Checkbox(ENCRYPT("Teleport Player"), &Vars.Telekill1);  // boutton activity aw9
 ImGui::Checkbox(ENCRYPT("fake tele"), &Vars.fakeTelekill1);  // boutton activity aw9
ImGui::Checkbox(ENCRYPT("Fast Reload"), &Fastzbb);






 if (ImGui::Checkbox(oxorany("Under KIll"), &Vars.ShowUndergroundButton)) {
                        if (Vars.ShowUndergroundButton) {
                            if (!self.undergroundButtonView) {
                                [self undergroundModeUI];
                            }
                        } else {
                            if (self.undergroundButtonView) {
                                [self.undergroundButtonView removeFromSuperview];
                                self.undergroundButtonView = nil;
                            }
                            Vars.Underground = false;
                        }
                    }


if (ImGui::Checkbox(oxorany("Blamyban"), &Vars.ShowBlamybanButton)) {
    if (Vars.ShowBlamybanButton) {
        if (!self.blamybanButtonView) {
            [self blamybanModeUI];
        }
    } else {
        if (self.blamybanButtonView) {
            [self.blamybanButtonView removeFromSuperview];
            self.blamybanButtonView = nil;
        }
        Vars.Blamyban = false; // ensure OFF when hidden
    }
}




if (Vars.Telekill1) {
    if (!self.telekillButtonView) {
        [self telekillModeUI];
    }
} else {
    if (self.telekillButtonView) {
        [self.telekillButtonView removeFromSuperview];
        self.telekillButtonView = nil;
    }
}

if (Vars.fakeTelekill1) {
    if (!self.faketelekillButtonView) {
        [self faketelekillModeUI];
    }
} else {
    if (self.faketelekillButtonView) {
        [self.faketelekillButtonView removeFromSuperview];
        self.faketelekillButtonView = nil;
    }
}




if (ImGui::Checkbox(oxorany("Ninja Run"), &Vars.ShowNinjaButton)) {
                        if (Vars.ShowNinjaButton) {
                            if (!self.ninjarunButtonView) {
                                [self ninjaRunModeUI];
                            }
                        } else {
                            if (self.ninjarunButtonView) {
                                [self.ninjarunButtonView removeFromSuperview];
                                self.ninjarunButtonView = nil;
                            }
                            Vars.Ninjarun = false;
                        }
                    }







 ImGui::Checkbox(ENCRYPT("Ghost"), &Vars.ShowGhostButton);
if (Vars.ShowGhostButton) {
    if (!self.ghostButtonView) {
        [self ghostModeUI];
    }
} else {
    if (self.ghostButtonView) {
        [self.ghostButtonView removeFromSuperview];
        self.ghostButtonView = nil;
    }
}








                    ImGui::Separator();




    ImGui::EndTabItem();
}

                if (ImGui::BeginTabItem(ICON_FA_COG " Setting"))
{
    // هنا يمكنك إضافة عناصر واجهة المستخدم الخاصة بـ Settings
    ImGui::Checkbox(ENCRYPT("Reset Guest"), &rsttk);
    ImGui::Text("VIGAR KING");

    if (ImGui::Button(ENCRYPT("Telegram"), ImVec2(120, 30)))

            {
                NSString *urlStr = @(ENCRYPT("https://t.me/Vig4r"));

                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
            }

            ImGui::SameLine();

            if (ImGui::Button("Group", ImVec2(120, 30)))
            {
                NSString *urlStr = @(ENCRYPT("https://t.me/+EaVfFi4BqFgyMGU0"));


                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
            }
if (ImGui::Button(ENCRYPT("Fix Login"), ImVec2(120, 30)))
    {
        self.mtkView.hidden = YES;
        MenDeal = NO;
        timer(40) {
            self.mtkView.hidden = NO;
            MenDeal = YES;
        });
    }




    //if (ImGui::Button("Save Settings")){
        //[self saveSettings];
    //}

    ImGui::EndTabItem();
}
                ImGui::EndTabBar();
            }

            // Khôi phục style vars
            ImGui::PopStyleVar(2);
            ImGui::End();
        }
        if (cc && !hasGhostBeenDrawn) { // Kiểm tra cc và biến cờ
            [self ghost];
        } else if (!cc) {
            [self removeGhost];
           }

        ImDrawList* draw_list = ImGui::GetBackgroundDrawList();
        get_players();
        aimbot();
        game_sdk->init();

        if (Vars.isAimFov && Vars.AimFov > 0) {
    ImVec2 center = ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2);

    if (Vars.fovaimglow) {
        static float rainbowHue = 0.0f;
        rainbowHue += ImGui::GetIO().DeltaTime * 0.8f;
        if (rainbowHue > 1.0f) rainbowHue = 0.0f;

        drawcircleglow(
            draw_list,
            center,
            Vars.AimFov,
            ImColor::HSV(rainbowHue, 0.8f, 1.0f),
            100,
            2.0f,
            12
        );
    } else {
        draw_list->AddCircle(
            center,
            Vars.AimFov,
            ImColor(1.0f, 1.0f, 1.0f, 1.0f),
            100,
            2.0f
        );
    }
}


        ImGui::Render();
        ImDrawData* draw_data = ImGui::GetDrawData();
        ImGui_ImplMetal_RenderDrawData(draw_data, commandBuffer, renderEncoder);
        [renderEncoder popDebugGroup];
        [renderEncoder endEncoding];
        [commandBuffer presentDrawable:view.currentDrawable];
        [commandBuffer commit];
    }
}

- (void)mtkView:(MTKView*)view drawableSizeWillChange:(CGSize)size {}


@end
