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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    // iOS 15-style: UIButtonTypeCustom, solid dark background, no glass
    self.undergroundButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.undergroundButtonView.frame = CGRectMake(305, 300, 64, 54);
    self.undergroundButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.undergroundButtonView.layer.cornerRadius = 10;
    self.undergroundButtonView.layer.borderWidth = 1.0f;
    self.undergroundButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.undergroundButtonView.clipsToBounds = YES;
    [self.undergroundButtonView addTarget:self action:@selector(wasDragged:withEvent:)
                         forControlEvents:UIControlEventTouchDragInside];
    [win addSubview:self.undergroundButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"UNDER";
    label.backgroundColor = [UIColor clearColor];
    [self.undergroundButtonView addSubview:label];

    self.undergroundSwitch = [[UISwitch alloc] init];
    self.undergroundSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.undergroundSwitch.center = CGPointMake(32, 38);
    self.undergroundSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.undergroundSwitch.thumbTintColor = [UIColor whiteColor];
    [self.undergroundSwitch addTarget:self action:@selector(undergroundSwitchChanged:)
                     forControlEvents:UIControlEventValueChanged];
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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    self.blamybanButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.blamybanButtonView.frame = CGRectMake(375, 300, 64, 54);
    self.blamybanButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.blamybanButtonView.layer.cornerRadius = 10;
    self.blamybanButtonView.layer.borderWidth = 1.0f;
    self.blamybanButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.blamybanButtonView.clipsToBounds = YES;
    [self.blamybanButtonView addTarget:self action:@selector(wasDragged:withEvent:)
                      forControlEvents:UIControlEventTouchDragInside];
    [win addSubview:self.blamybanButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"JetUNDER";
    label.backgroundColor = [UIColor clearColor];
    [self.blamybanButtonView addSubview:label];

    self.blamybanSwitch = [[UISwitch alloc] init];
    self.blamybanSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.blamybanSwitch.center = CGPointMake(32, 38);
    self.blamybanSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.blamybanSwitch.thumbTintColor = [UIColor whiteColor];
    [self.blamybanSwitch addTarget:self action:@selector(blamybanSwitchChanged:)
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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    self.telekillButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.telekillButtonView.frame = CGRectMake(305, 360, 64, 54);
    self.telekillButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.telekillButtonView.layer.cornerRadius = 10;
    self.telekillButtonView.layer.borderWidth = 1.0f;
    self.telekillButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.telekillButtonView.clipsToBounds = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleTelekillDrag:)];
    [self.telekillButtonView addGestureRecognizer:pan];
    [win addSubview:self.telekillButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"Telekill";
    label.backgroundColor = [UIColor clearColor];
    [self.telekillButtonView addSubview:label];

    self.telekillSwitch = [[UISwitch alloc] init];
    self.telekillSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.telekillSwitch.center = CGPointMake(32, 38);
    self.telekillSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.telekillSwitch.thumbTintColor = [UIColor whiteColor];
    [self.telekillSwitch addTarget:self action:@selector(telekillSwitchChanged:)
                  forControlEvents:UIControlEventValueChanged];
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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    self.faketelekillButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.faketelekillButtonView.frame = CGRectMake(375, 360, 64, 54);
    self.faketelekillButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.faketelekillButtonView.layer.cornerRadius = 10;
    self.faketelekillButtonView.layer.borderWidth = 1.0f;
    self.faketelekillButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.faketelekillButtonView.clipsToBounds = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
        initWithTarget:self action:@selector(handlefakeTelekillDrag:)];
    [self.faketelekillButtonView addGestureRecognizer:pan];
    [win addSubview:self.faketelekillButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"KillTELE";
    label.backgroundColor = [UIColor clearColor];
    [self.faketelekillButtonView addSubview:label];

    self.faketelekillSwitch = [[UISwitch alloc] init];
    self.faketelekillSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.faketelekillSwitch.center = CGPointMake(32, 38);
    self.faketelekillSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.faketelekillSwitch.thumbTintColor = [UIColor whiteColor];
    [self.faketelekillSwitch addTarget:self action:@selector(faketelekillSwitchChanged:)
                      forControlEvents:UIControlEventValueChanged];
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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    self.ninjarunButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ninjarunButtonView.frame = CGRectMake(375, 360, 64, 54);
    self.ninjarunButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.ninjarunButtonView.layer.cornerRadius = 10;
    self.ninjarunButtonView.layer.borderWidth = 1.0f;
    self.ninjarunButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.ninjarunButtonView.clipsToBounds = YES;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
        initWithTarget:self action:@selector(handleninjaDrag:)];
    [self.ninjarunButtonView addGestureRecognizer:pan];
    [win addSubview:self.ninjarunButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"NINJA";
    label.backgroundColor = [UIColor clearColor];
    [self.ninjarunButtonView addSubview:label];

    self.ninjaSwitch = [[UISwitch alloc] init];
    self.ninjaSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.ninjaSwitch.center = CGPointMake(32, 38);
    self.ninjaSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.ninjaSwitch.thumbTintColor = [UIColor whiteColor];
    [self.ninjaSwitch addTarget:self action:@selector(ninjaSwitchChanged:)
              forControlEvents:UIControlEventValueChanged];
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
    UIWindow *win = [UIApplication sharedApplication].keyWindow;

    self.ghostButtonView = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ghostButtonView.frame = CGRectMake(305, 244, 64, 54);
    self.ghostButtonView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    self.ghostButtonView.layer.cornerRadius = 10;
    self.ghostButtonView.layer.borderWidth = 1.0f;
    self.ghostButtonView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    self.ghostButtonView.clipsToBounds = YES;
    [self.ghostButtonView addTarget:self action:@selector(wasDraggeGhostd:withEvent:)
                   forControlEvents:UIControlEventTouchDragInside];
    [win addSubview:self.ghostButtonView];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 4, 64, 18)];
    label.textColor = [UIColor colorWithWhite:0.80f alpha:1.0f];
    label.font = [UIFont boldSystemFontOfSize:9];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"GHOST";
    label.backgroundColor = [UIColor clearColor];
    [self.ghostButtonView addSubview:label];

    self.ghostSwitch = [[UISwitch alloc] init];
    self.ghostSwitch.transform = CGAffineTransformMakeScale(0.72f, 0.72f);
    self.ghostSwitch.center = CGPointMake(32, 38);
    self.ghostSwitch.onTintColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    self.ghostSwitch.thumbTintColor = [UIColor whiteColor];
    [self.ghostSwitch addTarget:self action:@selector(ghostSwitchChanged:)
              forControlEvents:UIControlEventValueChanged];
    [self.ghostButtonView addSubview:self.ghostSwitch];

    // Timer label above button
    self.ghostTimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(
        self.ghostButtonView.frame.origin.x,
        self.ghostButtonView.frame.origin.y - 24, 64, 20)];
    self.ghostTimerLabel.text = @"1s";
    self.ghostTimerLabel.textAlignment = NSTextAlignmentCenter;
    self.ghostTimerLabel.textColor = [UIColor colorWithRed:0.20f green:0.90f blue:0.20f alpha:1.0f];
    self.ghostTimerLabel.font = [UIFont boldSystemFontOfSize:15];
    self.ghostTimerLabel.hidden = YES;
    [win addSubview:self.ghostTimerLabel];
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
    if (menuView) return;

    menuView = [UIButton buttonWithType:UIButtonTypeCustom];
    menuView.frame = CGRectMake(305, 185, 64, 64);
    menuView.layer.cornerRadius = 32;
    menuView.backgroundColor = [[UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.88f] colorWithAlphaComponent:0.88f];
    menuView.layer.borderWidth = 1.5f;
    menuView.layer.borderColor = [UIColor colorWithWhite:0.35f alpha:1.0f].CGColor;
    menuView.clipsToBounds = YES;
    [mainWindow addSubview:menuView];

    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
        initWithTarget:self action:@selector(handlePan:)];
    [menuView addGestureRecognizer:panGesture];

    UILabel *aimLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 64, 24)];
    aimLabel.font = [UIFont boldSystemFontOfSize:11];
    aimLabel.textAlignment = NSTextAlignmentCenter;
    aimLabel.backgroundColor = [UIColor clearColor];
    aimLabel.tag = 100;
    aimLabel.text = @"Fake Lag";
    aimLabel.textColor = [UIColor colorWithRed:0.94f green:0.12f blue:0.12f alpha:1.0f];
    [menuView addSubview:aimLabel];

    UIButton *aimButton = [UIButton buttonWithType:UIButtonTypeCustom];
    aimButton.frame = CGRectMake(0, 0, 64, 64);
    aimButton.backgroundColor = [UIColor clearColor];
    [aimButton addTarget:self action:@selector(switchIsChanged:)
       forControlEvents:UIControlEventTouchUpInside];
    [menuView addSubview:aimButton];

    hasGhostBeenDrawn = YES;
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

// ── Color scheme: pure black + red accent (iOS-style cheat menu) ──
style.Colors[ImGuiCol_Text]                  = ImVec4(0.95f, 0.95f, 0.95f, 1.00f);
style.Colors[ImGuiCol_TextDisabled]          = ImVec4(0.50f, 0.50f, 0.50f, 1.00f);
style.Colors[ImGuiCol_WindowBg]              = ImVec4(0.05f, 0.05f, 0.05f, 0.97f);
style.Colors[ImGuiCol_ChildBg]               = ImVec4(0.08f, 0.08f, 0.08f, 1.00f);
style.Colors[ImGuiCol_PopupBg]               = ImVec4(0.08f, 0.08f, 0.08f, 0.95f);
style.Colors[ImGuiCol_Border]                = ImVec4(0.28f, 0.28f, 0.28f, 0.60f);
style.Colors[ImGuiCol_BorderShadow]          = ImVec4(0.00f, 0.00f, 0.00f, 0.00f);
style.Colors[ImGuiCol_FrameBg]               = ImVec4(0.16f, 0.16f, 0.16f, 0.80f);
style.Colors[ImGuiCol_FrameBgHovered]        = ImVec4(0.22f, 0.22f, 0.22f, 0.60f);
style.Colors[ImGuiCol_FrameBgActive]         = ImVec4(0.28f, 0.28f, 0.28f, 0.80f);
style.Colors[ImGuiCol_TitleBg]               = ImVec4(0.10f, 0.10f, 0.10f, 1.00f);
style.Colors[ImGuiCol_TitleBgActive]         = ImVec4(0.14f, 0.14f, 0.14f, 1.00f);
style.Colors[ImGuiCol_TitleBgCollapsed]      = ImVec4(0.08f, 0.08f, 0.08f, 0.80f);
style.Colors[ImGuiCol_MenuBarBg]             = ImVec4(0.10f, 0.10f, 0.10f, 1.00f);
style.Colors[ImGuiCol_ScrollbarBg]           = ImVec4(0.06f, 0.06f, 0.06f, 0.90f);
style.Colors[ImGuiCol_ScrollbarGrab]         = ImVec4(0.35f, 0.35f, 0.35f, 0.60f);
style.Colors[ImGuiCol_ScrollbarGrabHovered]  = ImVec4(0.50f, 0.50f, 0.50f, 0.80f);
style.Colors[ImGuiCol_ScrollbarGrabActive]   = ImVec4(0.70f, 0.70f, 0.70f, 1.00f);
style.Colors[ImGuiCol_CheckMark]             = ImVec4(0.94f, 0.12f, 0.12f, 1.00f);  // red ✓
style.Colors[ImGuiCol_SliderGrab]            = ImVec4(0.85f, 0.85f, 0.85f, 1.00f);
style.Colors[ImGuiCol_SliderGrabActive]      = ImVec4(1.00f, 1.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_Button]                = ImVec4(0.20f, 0.20f, 0.20f, 0.80f);
style.Colors[ImGuiCol_ButtonHovered]         = ImVec4(0.30f, 0.30f, 0.30f, 1.00f);
style.Colors[ImGuiCol_ButtonActive]          = ImVec4(0.42f, 0.42f, 0.42f, 1.00f);
style.Colors[ImGuiCol_Header]                = ImVec4(0.22f, 0.22f, 0.22f, 0.60f);
style.Colors[ImGuiCol_HeaderHovered]         = ImVec4(0.30f, 0.30f, 0.30f, 0.80f);
style.Colors[ImGuiCol_HeaderActive]          = ImVec4(0.40f, 0.40f, 0.40f, 1.00f);
style.Colors[ImGuiCol_Separator]             = ImVec4(0.30f, 0.30f, 0.30f, 0.60f);
style.Colors[ImGuiCol_SeparatorHovered]      = ImVec4(0.50f, 0.50f, 0.50f, 0.78f);
style.Colors[ImGuiCol_SeparatorActive]       = ImVec4(0.70f, 0.70f, 0.70f, 1.00f);
style.Colors[ImGuiCol_ResizeGrip]            = ImVec4(0.30f, 0.30f, 0.30f, 0.25f);
style.Colors[ImGuiCol_ResizeGripHovered]     = ImVec4(0.50f, 0.50f, 0.50f, 0.80f);
style.Colors[ImGuiCol_ResizeGripActive]      = ImVec4(0.70f, 0.70f, 0.70f, 1.00f);
style.Colors[ImGuiCol_Tab]                   = ImVec4(0.12f, 0.12f, 0.12f, 1.00f);
style.Colors[ImGuiCol_TabHovered]            = ImVec4(0.28f, 0.28f, 0.28f, 0.80f);
style.Colors[ImGuiCol_TabActive]             = ImVec4(0.22f, 0.22f, 0.22f, 1.00f);
style.Colors[ImGuiCol_TabUnfocused]          = ImVec4(0.08f, 0.08f, 0.08f, 0.97f);
style.Colors[ImGuiCol_TabUnfocusedActive]    = ImVec4(0.14f, 0.14f, 0.14f, 1.00f);
style.Colors[ImGuiCol_PlotLines]             = ImVec4(0.80f, 0.80f, 0.80f, 1.00f);
style.Colors[ImGuiCol_PlotLinesHovered]      = ImVec4(1.00f, 1.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_PlotHistogram]         = ImVec4(0.80f, 0.80f, 0.80f, 1.00f);
style.Colors[ImGuiCol_PlotHistogramHovered]  = ImVec4(1.00f, 1.00f, 1.00f, 1.00f);
style.Colors[ImGuiCol_TextSelectedBg]        = ImVec4(0.94f, 0.12f, 0.12f, 0.35f);
style.Colors[ImGuiCol_DragDropTarget]        = ImVec4(1.00f, 1.00f, 0.00f, 0.90f);
style.Colors[ImGuiCol_NavHighlight]          = ImVec4(0.94f, 0.12f, 0.12f, 1.00f);
style.Colors[ImGuiCol_NavWindowingHighlight] = ImVec4(1.00f, 1.00f, 1.00f, 0.70f);
style.Colors[ImGuiCol_NavWindowingDimBg]     = ImVec4(0.00f, 0.00f, 0.00f, 0.20f);
style.Colors[ImGuiCol_ModalWindowDimBg]      = ImVec4(0.00f, 0.00f, 0.00f, 0.35f);

style.WindowRounding    = 6.0f;
style.ChildRounding     = 4.0f;
style.FrameRounding     = 3.0f;
style.GrabRounding      = 3.0f;
style.PopupRounding     = 4.0f;
style.ScrollbarRounding = 4.0f;
style.TabRounding       = 4.0f;

// Border sizes
style.WindowBorderSize = 1.0f;
style.FrameBorderSize  = 0.0f;
style.PopupBorderSize  = 1.0f;

// Spacing
style.WindowPadding  = ImVec2(10.0f, 8.0f);
style.FramePadding   = ImVec2(8.0f, 3.0f);
style.ItemSpacing    = ImVec2(8.0f, 5.0f);
style.IndentSpacing  = 14.0f;











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
        CGFloat y = (([UIApplication sharedApplication].windows[0].rootViewController.view.frame.size.height) - 280) / 2;

        ImGui::SetNextWindowPos(ImVec2(x, y), ImGuiCond_FirstUseEver);
        ImGui::SetNextWindowSize(ImVec2(340, 280), ImGuiCond_FirstUseEver);

        if (MenDeal == true)
        {
            ImGui::Begin(ENCRYPT("Monster v3"), &MenDeal,
                         ImGuiWindowFlags_NoCollapse | ImGuiWindowFlags_NoScrollbar);
            ImGui::PushStyleVar(ImGuiStyleVar_ItemSpacing, ImVec2(8, 5));
            ImGui::PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2(8, 3));

            // Helper lambda — section header with extending line
            auto SectionHeader = [](const char* txt) {
                ImVec2 p = ImGui::GetCursorScreenPos();
                float textW = ImGui::CalcTextSize(txt).x + 8.0f;
                float lineY = p.y + ImGui::GetTextLineHeight() * 0.55f;
                float lineX1 = ImGui::GetWindowPos().x + ImGui::GetContentRegionMax().x;
                ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.72f, 0.72f, 0.72f, 1.0f));
                ImGui::Text("%s", txt);
                ImGui::PopStyleColor();
                ImGui::GetWindowDrawList()->AddLine(
                    ImVec2(p.x + textW, lineY), ImVec2(lineX1, lineY),
                    IM_COL32(70, 70, 70, 200), 1.0f);
                ImGui::Spacing();
            };

            if (ImGui::BeginTabBar("##tabs", ImGuiTabBarFlags_FittingPolicyScroll))
            {
                // ══════════════════════════════════════════
                // TAB 1 — ESP
                // ══════════════════════════════════════════
                if (ImGui::BeginTabItem("  ESP  "))
                {
                    ImGui::Spacing();
                    SectionHeader("— VISUAL ESP");

                    ImGui::Checkbox(ENCRYPT("Enable"), &Vars.Enable);
                    ImGui::Separator();
                    ImGui::Spacing();

                    ImGui::Checkbox(ENCRYPT("Line"), &Vars.lines);
                    ImGui::SameLine(0, 14); ImGui::Checkbox(ENCRYPT("Box"), &Vars.Box);
                    ImGui::SameLine(0, 14); ImGui::Checkbox(ENCRYPT("Health"), &Vars.Health);

                    ImGui::Checkbox(ENCRYPT("Name"), &Vars.Name);
                    ImGui::SameLine(0, 14); ImGui::Checkbox(ENCRYPT("Skeleton"), &Vars.skeleton);

                    ImGui::Spacing();
                    ImGui::Separator();
                    ImGui::Checkbox(ENCRYPT("Streamer Mode"), &StreamerMode);

                    ImGui::EndTabItem();
                }

                // ══════════════════════════════════════════
                // TAB 2 — AIMBOT
                // ══════════════════════════════════════════
                if (ImGui::BeginTabItem("  AIMBOT  "))
                {
                    ImGui::Spacing();
                    SectionHeader("— AIMBOT SETTINGS");

                    ImGui::Checkbox(ENCRYPT("Enable Aimbot"), &Vars.Aimbot);
                    ImGui::SameLine(0, 14);
                    ImGui::Checkbox(ENCRYPT("Ignore Knocked"), &Vars.IgnoreKnocked);

                    ImGui::Checkbox(ENCRYPT("VIPBypass"), &Vars.skipwall);
                    ImGui::SameLine(0, 14);
                    ImGui::Checkbox(ENCRYPT("Visible Check"), &Vars.VisibleCheck);

                    ImGui::Checkbox(ENCRYPT("Show FOV Circle"), &Vars.isAimFov);
                    ImGui::SameLine(0, 14);
                    ImGui::Checkbox(ENCRYPT("FOV Glow"), &Vars.fovaimglow);

                    ImGui::Spacing();
                    ImGui::Separator();
                    ImGui::Spacing();

                    ImGui::PushItemWidth(150);
                    ImGui::Combo(ENCRYPT("Aim Dir"),    &Vars.AimWhen,   Vars.dir,         4);
                    ImGui::Combo(ENCRYPT("Target Bone"),&Vars.AimHitbox, Vars.aimHitboxes, 3);
                    ImGui::Combo(ENCRYPT("Aim Style"),  &Vars.aimMode,   Vars.aimmode,     IM_ARRAYSIZE(Vars.aimmode));
                    ImGui::PopItemWidth();

                    ImGui::PushItemWidth(200);
                    ImGui::SliderFloat(ENCRYPT("FOV Radius"), &Vars.AimFov, 0.00f, 500.00f, "%.0f");
                    ImGui::PopItemWidth();

                    ImGui::Separator();
                    ImGui::EndTabItem();
                }

                // ══════════════════════════════════════════
                // TAB 3 — MSL
                // ══════════════════════════════════════════
                if (ImGui::BeginTabItem("  MSL  "))
                {
                    ImGui::Spacing();
                    SectionHeader("— MOVEMENT SPEED");

                    if (ImGui::Checkbox(ENCRYPT("Speed Hack"), &SpeeeX2Enabled))
                        [self toggleSpeedX2:SpeeeX2Enabled];
                    if (ImGui::Checkbox(ENCRYPT("No Recoil"), &NoRecoilEnabled))
                        [self toggleNoRecoil:NoRecoilEnabled];
                    ImGui::Checkbox(ENCRYPT("Fast Reload"), &Fastzbb);
                    ImGui::Checkbox(ENCRYPT("Up Player"),   &Vars.isfly);

                    ImGui::Spacing();
                    SectionHeader("— EXTRA FEATURES");

                    ImGui::Checkbox(ENCRYPT("Bypass"), &BypassEnabled);

                    if (ImGui::Checkbox(ENCRYPT("Under Kill"), &Vars.ShowUndergroundButton)) {
                        if (Vars.ShowUndergroundButton) { if (!self.undergroundButtonView) [self undergroundModeUI]; }
                        else { [self.undergroundButtonView removeFromSuperview]; self.undergroundButtonView = nil; Vars.Underground = false; }
                    }
                    if (ImGui::Checkbox(ENCRYPT("Blamyban"), &Vars.ShowBlamybanButton)) {
                        if (Vars.ShowBlamybanButton) { if (!self.blamybanButtonView) [self blamybanModeUI]; }
                        else { [self.blamybanButtonView removeFromSuperview]; self.blamybanButtonView = nil; Vars.Blamyban = false; }
                    }
                    if (ImGui::Checkbox(ENCRYPT("Ninja Run"), &Vars.ShowNinjaButton)) {
                        if (Vars.ShowNinjaButton) { if (!self.ninjarunButtonView) [self ninjaRunModeUI]; }
                        else { [self.ninjarunButtonView removeFromSuperview]; self.ninjarunButtonView = nil; Vars.Ninjarun = false; }
                    }
                    ImGui::Checkbox(ENCRYPT("Ghost"), &Vars.ShowGhostButton);
                    if (Vars.ShowGhostButton) { if (!self.ghostButtonView) [self ghostModeUI]; }
                    else if (self.ghostButtonView) { [self.ghostButtonView removeFromSuperview]; self.ghostButtonView = nil; }

                    ImGui::Checkbox(ENCRYPT("Teleport Player"), &Vars.Telekill1);
                    if (Vars.Telekill1) { if (!self.telekillButtonView) [self telekillModeUI]; }
                    else if (self.telekillButtonView) { [self.telekillButtonView removeFromSuperview]; self.telekillButtonView = nil; }

                    ImGui::Checkbox(ENCRYPT("KillTele"), &Vars.fakeTelekill1);
                    if (Vars.fakeTelekill1) { if (!self.faketelekillButtonView) [self faketelekillModeUI]; }
                    else if (self.faketelekillButtonView) { [self.faketelekillButtonView removeFromSuperview]; self.faketelekillButtonView = nil; }

                    ImGui::Separator();
                    ImGui::EndTabItem();
                }

                // ══════════════════════════════════════════
                // TAB 4 — EXTRA (Settings)
                // ══════════════════════════════════════════
                if (ImGui::BeginTabItem("  EXTRA  "))
                {
                    ImGui::Spacing();
                    SectionHeader("— SETTINGS");

                    ImGui::Checkbox(ENCRYPT("Reset Guest"), &rsttk);
                    ImGui::Spacing();
                    ImGui::PushStyleColor(ImGuiCol_Text, ImVec4(0.55f, 0.55f, 0.55f, 1.0f));
                    ImGui::Text("MONALISA");
                    ImGui::PopStyleColor();
                    ImGui::Spacing();

                    if (ImGui::Button(ENCRYPT("Telegram"), ImVec2(110, 26))) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@(ENCRYPT("https://t.me/redyuiopk"))]];
                    }
                    ImGui::SameLine();
                    if (ImGui::Button(ENCRYPT("Group"), ImVec2(110, 26))) {
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@(ENCRYPT("https://t.me/monstercheatez"))]];
                    }
                    ImGui::Spacing();
                    if (ImGui::Button(ENCRYPT("Fix Login"), ImVec2(110, 26))) {
                        self.mtkView.hidden = YES;
                        MenDeal = NO;
                        timer(40) {
                            self.mtkView.hidden = NO;
                            MenDeal = YES;
                        });
                    }

                    ImGui::Separator();
                    ImGui::EndTabItem();
                }

                ImGui::EndTabBar();
            }

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
