#include <unordered_map>
    #import "vinhtran.hpp"
    #import "loading.hxx"
    #include <fstream>
    #define FMT_HEADER_ONLY
    #include "fmt/core.h"
    #include <chrono>
    #include "hook/hook.h"
    #include <vector>
   
    #include <string>





    #include <map>
    #define nullptr NULL
    #define stone 0x1 

        static float MOSSX = 0.0f;
        static float MOSSY = 0.0f;
        static float MOSSZ = 0.0f;
        static float FlyHack3 = 2.0f;

        namespace Save {


             struct KillEntry_t {
        std::string KillerName;
        std::string VictimName;
        std::string WeaponName;
        std::chrono::steady_clock::time_point Timestamp;
    };

    inline std::vector<KillEntry_t> KillHistory; 
}
    



enum EFireState {
    IDLE = 0,
    FIRING = 1,
    RELOAD = 2
};

enum EFireType {
    SINGLE = 0,
    AUTO = 1,
    BURST = 2
};


    bool POFFNNMOOBM = false;
    int GDKLMFLNNGM = 0;
    bool AimKill = false;
    bool autochangeweapon = false;
    bool SowDamage = false;
    static clock_t lastWeaponSwapTime = 0;
    static const float weaponSwapDelay = 0.07f;

    namespace Save{
        void* DamageInfo;
        std::vector<void*> LoggedDeaths;
        clock_t AimDelay;
        int AimFPS = 15; 

    std::map<void*, float> enemyOriginalY;
    float localOriginalY = 0.0f;
    bool UpPlayer = false;
    bool cameraAdjusted = false;
    bool SpeedFire = false;
    
    

    bool Noreload = false;
    bool isDescending = false;    

    struct Vars_t
    {
        int Target = {};
        bool Enable = {};
        bool AimbotEnable = {};
        bool Aimbot = {};
        float AimFov = {};
        int AimCheck = {};
        int AimType = {};
        int AimWhen = {};
        bool isAimFov = {};
        int AimHitbox = 0; // 0: Head, 1: Neck, 2: Body
        const char* aimHitboxes[3] = {"Head", "Neck", "Body"};
        const char *dir[4] = {"Auto", "Fire", "Scope", "Fire + Scope"};
        const char *aimmode[3] = {"Aim Fov", "Aim 180", "Aim 360"};
        int aimMode = 0;
        bool lines = {};
        bool Box = {};
        bool Outline = {};
        bool Name = {};
        bool Health = {};
        bool Distance = {};
        bool fovaimglow = {};
        bool circlepos = {};
        bool skeleton = {};
        bool OOF = {};
        bool counts = {};
        ImVec4 boxColor = ImVec4(0.0f, 0.0f, 0.0f, 1.0f);
        float AimSpeed = 9999.0f;
        float localOriginalY = 0.0f;
        bool ShowGhostButton = false;
        bool Ninjarun = false;
        bool EnableGhost = false;
        bool VisibleCheck = false;
        bool IgnoreKnocked = false;
        bool AITelekill = false;
        float CrosshairRange = 50.0f;        
        float TelekillMaxDistance = 100.0f;  
        bool SkipWallCheck = true;           
        bool skipwall = false;
        bool UpPlayer = false;
        bool Telekill = false;
        bool Telekill1 = false;
        bool fakeTelekill1 = false;
        bool fakeTelekill = false;
        bool isfly = false;
        bool Underground = false;
        bool ShowUndergroundButton = false; 
        bool ShowNinjaButton = false;
        bool Blamyban = false;             
        bool ShowBlamybanButton = false;   
        bool ShowUplayerButton = false;   
        bool ShowAikilButton = false;
        bool ShowFly2mButton = false;
        bool ShowFlyv2mButton = false;
        bool Show360Button = false; 
        bool ShowmapButton = false;  
        bool ShowtstButton = false;
        bool ShowZBButton = false; 
        bool FlyEnabled = false;   
        bool SpinBot360 = false;
        bool SpinBot390 = false;
        bool FlyMap = false;
        bool FlyUltra = false;
        bool ShowFly2skymButton = false;
        
        bool autofire = false; 

        bool SilentAim = false;
        bool SkyFly = false;
        bool hasJumped = false;
        float currentSkyHeight = 0.0f;  
        bool Fly2m = false; 
        float timer = 0.0f;
        bool fly = false;
        float flySpeed = 0.0f;
        bool FlyV2 = false; 
        bool flyaltura = false;
        bool ShowAimKillButton = false; 
        bool FlyV3 = false;  
        bool telehack = false; 
        bool SuperBackJump = false;             
        bool FlyV333 = false;               
        bool FlyhtmlEnabled = false; 
        bool ShowHhhButton = false;
         bool TeleportMarkr = false;
        bool ShowHhhBdtton = false;
        bool Auto_TeleportMarkr = false;
        bool isMovedToMark = false;
        bool SmartAttack  = false;
        bool Fly = false;

        float FlySpeeed = 0.0f;
         float FlyHeigght = 0.0f;
        bool InfiniteJump = false; // إضافة هذا المتغي
         bool TelekillSliderEnabled = false; 
    float TeleX = 0.0f; // تأكد أن المدى في الـ UI هو 0-70
    float TeleY = 0.0f; // تأكد أن المدى في الـ UI هو 0-70


        bool Auto_Teleport = false; // تفعيل أو تعطيل التيلبورت التلقائي
        int NewRound_CallCount = 0; // عداد الجولات

        float MaxDistance = 100.0f;
            Vector3 LockedPos = Vector3::zero(); 


        bool b_SuperFly = false;
            bool ShowZBBButton = false;
            bool ShowZBBBBBBBBBBBBButton = false;
            bool ShowSAMWILButton = false;
            bool ShowddButton = false;
            int CurrentRoundCount = 0;
             bool AutoTelekillRound = false;
             bool ShowMapLine = true; // لتفعيل/تعطيل الخط من القائمة
             float flyHeighteezz = 0.0f;
             bool flyV39 = false; 
             bool fly3838 = false; 

             float ForwardFly = 0.0f;
             float JumpUp = 0.0f;



        float FlyHeight = 18.5f;
        bool SmoothFly = false;
        float flyHeightLimit = 15.0f; // الارتفاع المطلوب
        float descentSpeed = 0.05f;   // سرعة الهبوط (كلما قل الرقم كان أبطأ)
          bool SpeedHack = false;
          bool MagnetEnemy = false;
             float FlyHeighte = 5.0f; 
             float FlyHeightee = 5.0f; 
          bool NoRecoil = false;
         bool TeleportToMark = false; 
          bool HasSavedMark = false; 
          bool AutoTeleportSlowMarkr = false; 
          bool TelekillSkyEnabled = false; 
          bool AirWalkVisibleauto = false; 
          Vector3 SavedMarkPos = {0,0,0};  
            bool ShowKillFeed = true;
                ImVec4 MyNameColor = ImVec4(0.0f, 0.5f, 1.0f, 1.0f);
            const char* CurrentWeaponName = "Desert Eagle"; // يمكن جلب هذا برمجياً لاحقاً
                bool AirWalkVisible = false;
                     float AirHeightVisible = 180.0f;
                     float AirHeightVisibleauto = 180.0f;
                    float AirHeight = 0.0f;








        
        

        Vector3 originalPos; 




    } Vars;



} // namespace Save

using namespace Save;



class game_sdk_t
{
public:
    void init();
    int (*GetHp)(void *player);
    void *(*Curent_Match)();
    void *(*GetLocalPlayer)(void *Game);
    void *(*GetHeadPositions)(void *player);
    Vector3 (*get_position)(void *player);
    void *(*Component_GetTransform)(void *player);
    void *(*get_camera)();
    Vector3 (*WorldToViewpoint)(void*, Vector3, int);
    bool (*get_isVisible)(void *player);
    bool (*get_isLocalTeam)(void *player);
    bool (*get_IsDieing)(void *player);
    int (*get_MaxHP)(void *player);
    Vector3 (*GetForward)(void *player);
    void (*set_aim)(void *, Quaternion look);
    bool (*get_IsSighting)(void *player);
    bool (*get_IsFiring)(void *player);
    monoString *(*name)(void *player);
    void *(*_GetHeadPositions)(void *);
    void *(*_newHipMods)(void *);
    void *(*_GetLeftAnkleTF)(void *);
    void *(*_GetRightAnkleTF)(void *);
    void *(*_GetLeftToeTF)(void *);
    void *(*_GetRightToeTF)(void *);
    void *(*_getLeftHandTF)(void *);
    void *(*_getRightHandTF)(void *);
    void *(*_getLeftForeArmTF)(void *);
    void *(*_getRightForeArmTF)(void *);
};

game_sdk_t *game_sdk = new game_sdk_t();

void game_sdk_t::init()
{
    this->GetHp = (int (*)(void *))getRealOffset(oxo("0x543592C"));
    this->Curent_Match = (void *(*)())getRealOffset(oxo("0x55C4DA4"));
    this->GetLocalPlayer = (void *(*)(void *))getRealOffset(oxo("0x2FFE494"));
    this->GetHeadPositions = (void *(*)(void *))getRealOffset(oxo("0x54547E0"));
    this->get_position = (Vector3(*)(void *))getRealOffset(oxo("0x91CA56C"));
    this->Component_GetTransform = (void *(*)(void *))getRealOffset(oxo("0x91B82E4"));
    this->get_camera = (void *(*)())getRealOffset(oxo("0x915E9E4"));

    this->WorldToViewpoint = (Vector3(*)(void*, Vector3, int))getRealOffset(oxo("0x915E364"));

    this->get_isVisible = (bool (*)(void *))getRealOffset(oxo("0x53C8894"));

    this->get_isLocalTeam = (bool (*)(void *))getRealOffset(oxo("0x53E20C4"));

    this->get_IsDieing = (bool (*)(void *))getRealOffset(oxo("0x53AA18C"));

    this->get_MaxHP = (int (*)(void *))getRealOffset(oxo("0x5435A3C"));

    this->GetForward = (Vector3(*)(void *))getRealOffset(oxo("0x91CAF64"));

    this->set_aim = (void (*)(void *, Quaternion))getRealOffset(oxo("0x53C4534"));

    this->get_IsSighting = (bool (*)(void *))getRealOffset(oxo("0x53B769C"));

    this->get_IsFiring = (bool (*)(void *))getRealOffset(oxo("0x53ACC9C"));

    this->name = (monoString * (*)(void *player)) getRealOffset(oxo("0x53BE8E0"));

    this->_GetHeadPositions = (void *(*)(void *))getRealOffset(oxo("0x54547E0"));
    this->_newHipMods = (void *(*)(void *))getRealOffset(oxo("0x5454990"));
    this->_GetLeftAnkleTF = (void *(*)(void *))getRealOffset(oxo("0x5454DE0"));
    this->_GetRightAnkleTF = (void *(*)(void *))getRealOffset(oxo("0x5454EEC"));
    this->_GetLeftToeTF = (void *(*)(void *))getRealOffset(oxo("0x5454FF8"));
    this->_GetRightToeTF = (void *(*)(void *))getRealOffset(oxo("0x5455104"));
    this->_getLeftHandTF = (void *(*)(void *))getRealOffset(oxo("0x53C3608"));
    this->_getRightHandTF = (void *(*)(void *))getRealOffset(oxo("0x53C370C"));
    this->_getLeftForeArmTF = (void *(*)(void *))getRealOffset(oxo("0x53C3810"));
    this->_getRightForeArmTF = (void *(*)(void *))getRealOffset(oxo("0x53C3914"));
}


static void SwapWeapon(void *player, int POFFNNMOOBM, bool GDKLMFLNNGM) {
    void (*_SwapWeapon)(void *player, int POFFNNMOOBM, bool GDKLMFLNNGM) = (void (*)(void *, int, bool))getRealOffset(ENCRYPTOFFSET("0x56E75DC"));
    _SwapWeapon(player, POFFNNMOOBM, GDKLMFLNNGM);
}


   

    static Vector3 Transform_INTERNAL_GetPosition(void *player) {
        Vector3 out = Vector3::zero();
        void (*_Transform_INTERNAL_GetPosition)(void *transform, Vector3 * out) = (void (*)(void *, Vector3 *))getRealOffset(ENCRYPTOFFSET("0x91CA5D0"));
        _Transform_INTERNAL_GetPosition(player, &out);
        return out;
    }

    static void Transform_INTERNAL_SetPosition(void *player, Vvector3 inn) {
        void (*_Transform_INTERNAL_SetPosition)(void *transform, Vvector3 in) = (void (*)(void *, Vvector3))getRealOffset(ENCRYPTOFFSET("0x91CA6A8"));
        _Transform_INTERNAL_SetPosition(player, inn);
    }

namespace Camera$$WorldToScreen
{
ImVec2 Regular(Vector3 pos) {
    auto cam = game_sdk->get_camera();
    if (!cam) return {0,0};

    Vector3 worldPoint = game_sdk->WorldToViewpoint(cam,pos, 2);
    Vector3 location;

    int ScreenWidth = ImGui::GetIO().DisplaySize.x;
    int ScreenHeight = ImGui::GetIO().DisplaySize.y;

    location.x = ScreenWidth * worldPoint.x;
    location.y = ScreenHeight - worldPoint.y * ScreenHeight;
    location.z  = worldPoint.z;

    return {location.x, location.y};
}

ImVec2 Checker(Vector3 pos, bool &checker) {
    auto cam = game_sdk->get_camera();
    if (!cam) return {0, 0};
   
    Vector3 worldPoint = game_sdk->WorldToViewpoint(cam,pos, 4);
    Vector3 location;
 
    int ScreenWidth = ImGui::GetIO().DisplaySize.x;
    int ScreenHeight = ImGui::GetIO().DisplaySize.y;
 
    location.x = ScreenWidth * worldPoint.x;
    location.y = ScreenHeight - worldPoint.y * ScreenHeight;
    location.z = worldPoint.z;
 
    checker = location.z > 1;
 
    return {location.x, location.y};
}
}

Vector3 GetBonePosition(void *player, void *(*transformGetter)(void *)) {
    if (!player || !transformGetter)
        return Vector3();
    void *transform = transformGetter(player);
    return transform ? game_sdk->get_position(game_sdk->Component_GetTransform(transform)) : Vector3();
}

Vector3 GetHitboxPosition(void* player, int hitbox) {
    if (!player) return Vector3::zero();
    
    switch (hitbox) {
        case 0: return GetBonePosition(player, game_sdk->GetHeadPositions);
        case 1: {
            Vector3 headPos = GetBonePosition(player, game_sdk->GetHeadPositions);
            return headPos == Vector3::zero() ? headPos : Vector3(headPos.x, headPos.y - 0.1f, headPos.z);
        }
        case 2: {
            Vector3 headPos = GetBonePosition(player, game_sdk->GetHeadPositions);
            return headPos == Vector3::zero() ? headPos : Vector3(headPos.x, headPos.y - 0.2f, headPos.z);
        }
        default: return GetBonePosition(player, game_sdk->GetHeadPositions);
    }
}

Vector3 getPosition(void *player) {
    return game_sdk->get_position(game_sdk->Component_GetTransform(player));
}

Vector3 GetHeadPosition(void *player) {
    return game_sdk->get_position(game_sdk->GetHeadPositions(player));
}

static Vector3 CameraMain(void *player) {
    return game_sdk->get_position(*(void **)((uint64_t)player + oxo("0x380")));
}

Quaternion GetRotationToTheLocation(Vector3 Target, float Height, Vector3 MyEnemy) {
    Vector3 direction = (Target + Vector3(0, Height, 0)) - MyEnemy;
    return Quaternion::LookRotation(direction, Vector3(0, 1, 0));
}

Quaternion GetCurrentRotation(void* player) {
    void* transform = game_sdk->Component_GetTransform(player);
    if (!transform) return Quaternion();
    return Quaternion::LookRotation(game_sdk->GetForward(transform), Vector3(0, 1, 0));
}

#include "Helper/Ext.h"

class tanghinh {
public:
    static Vector3 Transform_GetPosition(void *player) {
       Vector3 out = Vector3::zero();
        void (*_Transform_GetPosition)(void *transform, Vector3 *out) = (void (*)(void *, Vector3 *))getRealOffset(oxo("0x91CA5D0"));
        _Transform_GetPosition(player, &out);
        return out;
    }


        static void Transform_SetPosition(void* player, Vvector3 inn) {
        typedef void (*TransformSetPosition_fn)(void*, Vvector3);
        
        TransformSetPosition_fn _Transform_SetPosition = (TransformSetPosition_fn)getRealOffset(ENCRYPTOFFSET("0x91CA6A8"));
        
        if (_Transform_SetPosition != nullptr) {
            _Transform_SetPosition(player, inn);
        }
    }


    static void *Player_GetHeadCollider(void *player)
    {
        void *(*_Player_GetHeadCollider)(void *players) = (void *(*)(void *))getRealOffset(oxo("0x53C2630"));
        return _Player_GetHeadCollider(player);
    }

    static bool Physics_Raycast(Vector3 camLocation, Vector3 headLocation, unsigned int LayerID, void *collider)
    {
        bool (*_Physics_Raycast)(Vector3 camLocation, Vector3 headLocation, unsigned int LayerID, void *collider) = (bool (*)(Vector3, Vector3, unsigned int, void *))getRealOffset(oxo("0x5FE855C"));
        return _Physics_Raycast(camLocation, headLocation, LayerID, collider);
    }

    static bool isVisible(void *enemy) {
        if (enemy != NULL) {
            void *hitObj = NULL;
            auto Camera = Transform_GetPosition(game_sdk->Component_GetTransform(game_sdk->get_camera()));
            auto Target = Transform_GetPosition(game_sdk->Component_GetTransform(Player_GetHeadCollider(enemy)));
            return !Physics_Raycast(Camera, Target, 12, &hitObj);
        }
        return false;
    }
};


   void DrawLine(ImDrawList* drawList, ImVec2 start, ImVec2 end, float thickness, bool isDead = false, bool isVisible = false) {
        if (!drawList) return;
        ImColor color = isDead ? ImColor(255, 0, 0) : isVisible ? ImColor(0, 255, 0) : ImColor(255, 255, 255);
        drawList->AddLine(start, end, color, thickness);
    }

void DrawSkeleton(void *player, ImDrawList *drawList)
{
    if (!player || !drawList)
        return;
    bool isPlayerVisible = tanghinh::isVisible(player);
    Vector3 headPos = GetBonePosition(player, game_sdk->_GetHeadPositions);
    Vector3 hipPos = GetBonePosition(player, game_sdk->_newHipMods);
    Vector3 leftAnklePos = GetBonePosition(player, game_sdk->_GetLeftAnkleTF);
    Vector3 rightAnklePos = GetBonePosition(player, game_sdk->_GetRightAnkleTF);
    Vector3 leftToePos = GetBonePosition(player, game_sdk->_GetLeftToeTF);
    Vector3 rightToePos = GetBonePosition(player, game_sdk->_GetRightToeTF);
    Vector3 leftHandPos = GetBonePosition(player, game_sdk->_getLeftHandTF);
    Vector3 rightHandPos = GetBonePosition(player, game_sdk->_getRightHandTF);
    Vector3 leftForeArmPos = GetBonePosition(player, game_sdk->_getLeftForeArmTF);
    Vector3 rightForeArmPos = GetBonePosition(player, game_sdk->_getRightForeArmTF);

    bool visible;
    ImVec2 headScreen = Camera$$WorldToScreen::Checker(headPos, visible);
    if (!visible)
        return;

    ImVec2 hipScreen = Camera$$WorldToScreen::Regular(hipPos);
    ImVec2 leftAnkleScreen = Camera$$WorldToScreen::Regular(leftAnklePos);
    ImVec2 rightAnkleScreen = Camera$$WorldToScreen::Regular(rightAnklePos);
    ImVec2 leftToeScreen = Camera$$WorldToScreen::Regular(leftToePos);
    ImVec2 rightToeScreen = Camera$$WorldToScreen::Regular(rightToePos);
    ImVec2 leftHandScreen = Camera$$WorldToScreen::Regular(leftHandPos);
    ImVec2 rightHandScreen = Camera$$WorldToScreen::Regular(rightHandPos);
    ImVec2 leftForeArmScreen = Camera$$WorldToScreen::Regular(leftForeArmPos);
    ImVec2 rightForeArmScreen = Camera$$WorldToScreen::Regular(rightForeArmPos);
    ImColor boneColor = isPlayerVisible ? ImColor(0, 255, 0) : ImColor(255, 255, 255);
    float thickness = 1.0f;

    drawList->AddCircle(headScreen, 2.0f, boneColor, 12, thickness);

    drawList->AddLine(headScreen, hipScreen, boneColor, thickness);
    drawList->AddLine(headScreen, leftForeArmScreen, boneColor, thickness);
    drawList->AddLine(headScreen, rightForeArmScreen, boneColor, thickness);
    drawList->AddLine(leftForeArmScreen, leftHandScreen, boneColor, thickness);
    drawList->AddLine(rightForeArmScreen, rightHandScreen, boneColor, thickness);

    drawList->AddLine(hipScreen, leftAnkleScreen, boneColor, thickness);
    drawList->AddLine(hipScreen, rightAnkleScreen, boneColor, thickness);
    drawList->AddLine(leftAnkleScreen, leftToeScreen, boneColor, thickness);
    drawList->AddLine(rightAnkleScreen, rightToeScreen, boneColor, thickness);
}



bool isFov(Vector3 vec1, Vector3 vec2, int radius)
{
    int x = vec1.x;
    int y = vec1.y;
    int x0 = vec2.x;
    int y0 = vec2.y;
    if ((pow(x - x0, 2) + pow(y - y0, 2)) <= pow(radius, 2))
    {
        return true;
    }
    return false;
}






void* GetClosestEnemy() {
    try {
        float shortestMetric = 120.0f;
        void* closestEnemy = NULL;

        void* match = game_sdk->Curent_Match();
        if (!match) return NULL;

        void* localPlayer = game_sdk->GetLocalPlayer(match);
        if (!localPlayer) return NULL;

        if (!Vars.Aimbot && !Vars.Enable) return NULL;

        Dictionary<uint8_t*, void**>* players = *(Dictionary<uint8_t*, void**>**)((long)match + 0x148);
        if (!players) return NULL;

        auto values = players->getValues();
        if (values.empty()) return NULL;

        Vector3 localPos = getPosition(localPlayer);
        ImVec2 center = ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2);

        void* camera = game_sdk->get_camera();
        if (!camera) return NULL;
        Vector3 cameraForward = game_sdk->GetForward(game_sdk->Component_GetTransform(camera));

        for (int i = 0; i < values.size(); i++) {
            void* player = values[i];
            if (!player || player == localPlayer || !game_sdk->get_MaxHP(player) || game_sdk->get_isLocalTeam(player))
                continue;

            if (Vars.IgnoreKnocked && game_sdk->get_IsDieing(player))
                continue;
            if (Vars.VisibleCheck && !tanghinh::isVisible(player))
                continue;

            Vector3 playerPos = GetHitboxPosition(player, Vars.AimHitbox);
            float distance = Vector3::Distance(localPos, playerPos);
            if (distance >= 120.0f) continue;

            if (Vars.aimMode == 0) { // Aim Fov
                Vector3 dir = Vector3::Normalized(playerPos - localPos);
                float angle = Vector3::Angle(dir, cameraForward) * 100.0f;
                ImVec2 screenPos = Camera$$WorldToScreen::Regular(playerPos);
                bool onScreen = isFov(Vector3(screenPos.x, screenPos.y, 0), Vector3(center.x, center.y, 0), Vars.AimFov);

                if (angle <= Vars.AimFov && onScreen && angle < shortestMetric) {
                    shortestMetric = angle;
                    closestEnemy = player;
                }
            }
            else if (Vars.aimMode == 1) { // Aim 180
                Vector3 dir = Vector3::Normalized(playerPos - localPos);
                float angle = Vector3::Angle(dir, cameraForward) * 100.0f;
                if (angle <= 180.0f && angle < shortestMetric) {
                    shortestMetric = angle;
                    closestEnemy = player;
                }
            }
            else if (Vars.aimMode == 2) { // Aim 360
                if (distance < shortestMetric) {
                    shortestMetric = distance;
                    closestEnemy = player;
                }
            }
        }
        return closestEnemy;
    } catch (...) {
        return NULL;
    }
}



void *GetClosestEnemyForTelekill() {
    try {
        void *match = game_sdk->Curent_Match();
        if (!match) return NULL;

        void *local = game_sdk->GetLocalPlayer(match);
        if (!local) return NULL;

        auto players = *(Dictionary<uint8_t*, void**>**)((long)match + 0x148);
        if (!players) return NULL;

        auto values = players->getValues();

        void *closestEnemy = NULL;
        float shortestDistance = 99999.0f;

        for (auto enemy : values) {
            if (!enemy || enemy == local) continue;
            if (!game_sdk->Component_GetTransform(enemy)) continue;
            if (!game_sdk->get_MaxHP(enemy)) continue;
            if (game_sdk->get_IsDieing(enemy)) continue;
            if (game_sdk->GetHp(enemy) <= 0) continue;
            if (game_sdk->get_isLocalTeam(enemy)) continue;

            Vector3 enemyPos = game_sdk->get_position(game_sdk->Component_GetTransform(enemy));
            Vector3 localPos = game_sdk->get_position(game_sdk->Component_GetTransform(local));
            float dist = Vector3::Distance(localPos, enemyPos);
            if (dist < shortestDistance) {
                shortestDistance = dist;
                closestEnemy = enemy;
            }
        }
        return closestEnemy;
    } catch (...) {
        return NULL;
    }
}



















    















    void *GetClosestEnemyForfakeTelekill() {
    try {
        float shortestDistance = 300.0f;
        void *closestEnemy = NULL;

        void *match = game_sdk->Curent_Match();
        if (!match) return NULL;

        void *local = game_sdk->GetLocalPlayer(match);
        if (!local || !game_sdk->Component_GetTransform(local)) return NULL;

        auto players = *(Dictionary<uint8_t*, void**>**)((long)match + 0x148);
        if (!players) return NULL;

        auto values = players->getValues();

        Vector3 localPos = getPosition(local);

        for (auto player : values) {
            if (!player || player == local) continue;
            if (!game_sdk->get_MaxHP(player)) continue;
            if (game_sdk->get_isLocalTeam(player)) continue;
            if (game_sdk->get_IsDieing(player)) continue;

            Vector3 pos = getPosition(player);
            float distance = Vector3::Distance(localPos, pos);

            if (distance >= 300.0f) continue;

            if (distance < shortestDistance) {
                shortestDistance = distance;
                closestEnemy = player;
            }
        }
        return closestEnemy;

    } catch (...) {
        return NULL;
    }
}


















static inline void CheckSession() {
    // login removed - no key required
}



 


























void ProcessAimbot() {
    if (!Vars.Aimbot)
        return;

    void *CurrentMatch = game_sdk->Curent_Match();
    if (!CurrentMatch)
        return;

    void *LocalPlayer = game_sdk->GetLocalPlayer(CurrentMatch);
    if (!LocalPlayer || !game_sdk->Component_GetTransform(LocalPlayer))
        return;

    void *closestEnemy = GetClosestEnemy();
    if (!closestEnemy || !game_sdk->Component_GetTransform(closestEnemy))
        return;

    Vector3 EnemyLocation = GetHitboxPosition(closestEnemy, Vars.AimHitbox);
    if (EnemyLocation == Vector3::zero())
        return;

    Vector3 PlayerLocation = CameraMain(LocalPlayer);
    if (PlayerLocation == Vector3::zero())
        return;

    bool IsScopeOn = game_sdk->get_IsSighting(LocalPlayer);
    bool IsFiring = game_sdk->get_IsFiring(LocalPlayer);

    bool shouldAim =
        (Vars.AimWhen == 0) ||
        (Vars.AimWhen == 1 && IsFiring) ||
        (Vars.AimWhen == 2 && IsScopeOn) ||
        (Vars.AimWhen == 3 && (IsFiring || IsScopeOn));

    if (shouldAim && (!Vars.VisibleCheck || tanghinh::isVisible(closestEnemy))) {

        if (game_sdk->get_IsDieing(closestEnemy) && Vars.IgnoreKnocked) {

            float shortestDistance = 100.0f;
            void *newTarget = NULL;

            Dictionary<uint8_t *, void **> *players =
                *(Dictionary<uint8_t *, void **> **)((long)CurrentMatch + oxo("0x148"));

            if (players) {

                auto values = players->getValues();

                if (!values.empty()) {

                    for (int u = 0; u < values.size(); u++) {

                        void *Player = values[u];

                        if (!Player || Player == LocalPlayer || !game_sdk->get_MaxHP(Player) ||
                            game_sdk->get_isLocalTeam(Player) || Player == closestEnemy)
                            continue;

                        if (Vars.IgnoreKnocked && game_sdk->get_IsDieing(Player))
                            continue;

                        if (Vars.VisibleCheck && !tanghinh::isVisible(Player))
                            continue;

                        Vector3 PlayerPos = GetHitboxPosition(Player, Vars.AimHitbox);
                        float distance = Vector3::Distance(PlayerLocation, PlayerPos);

                        if (distance < 300 && distance < shortestDistance) {
                            shortestDistance = distance;
                            newTarget = Player;
                        }
                    }
                }
            }

            if (AimKill && game_sdk->get_IsFiring(LocalPlayer))
                return;

            if (newTarget) {
                EnemyLocation = GetHitboxPosition(newTarget, Vars.AimHitbox);
                closestEnemy = newTarget;
            } else {
                return;
            }
        }

        Quaternion TargetLook = GetRotationToTheLocation(EnemyLocation, 0.05f, PlayerLocation);
        game_sdk->set_aim(LocalPlayer, TargetLook);
    }

    if (AimKill) {
    }
}




void* GetEnemyByShortestDistance(void* localPlayer, void* match) {
    void* closestEnemy = nullptr;
    float minDistance = 99999.0f;

    Dictionary<uint8_t *, void **> *players =
        *(Dictionary<uint8_t *, void **> **)((long)match + 0x148);

    if (!players)
        return nullptr;

    auto values = players->getValues();
    if (values.empty())
        return nullptr;

    for (int i = 0; i < values.size(); i++) {
        void *enemy = values[i];

        // شروط الاستبعاد الأساسية
        if (!enemy || enemy == localPlayer ||
            game_sdk->get_isLocalTeam(enemy) ||
            game_sdk->get_IsDieing(enemy))
            continue;

        void* enemyTF = game_sdk->Component_GetTransform(enemy);
        void* localTF = game_sdk->Component_GetTransform(localPlayer);

        if (enemyTF && localTF) {
            float dist = Vector3::Distance(
                game_sdk->get_position(localTF),
                game_sdk->get_position(enemyTF)
            );

            if (dist < minDistance) {
                minDistance = dist;
                closestEnemy = enemy;
            }
        }
    }

    return closestEnemy;
}








   void get_players() {
        ImDrawList *draw_list = ImGui::GetBackgroundDrawList();
        int numberOfBots = 0;
        int numberOfPlayersAround = 0;
          // AutoHookSilentFire();
        if (!draw_list)
            return;
        if (!Vars.Enable)
            return;


        


        





       


















       




        



        /// Reset camera and player positions when both Underground & Blamyban are disabled
if (!Vars.Underground && !Vars.Blamyban && cameraAdjusted) {
    cameraAdjusted = false;

    void *match = game_sdk->Curent_Match();
    if (!match) return;

    // ================= Restore camera =================
    void *camera = game_sdk->get_camera();
    void *camTF = camera ? game_sdk->Component_GetTransform(camera) : nullptr;

    if (camTF) {
        Vector3 camPos = game_sdk->get_position(camTF);
        camPos.y += 5.0f;
        Transform_INTERNAL_SetPosition(camTF, Vvector3(camPos.x, camPos.y, camPos.z));
    }

    // ================= Restore local player =================
    void *local = game_sdk->GetLocalPlayer(match);
    if (local) {
        void *localTF = game_sdk->Component_GetTransform(local);
        if (localTF) {
            Vector3 localPos = game_sdk->get_position(localTF);

            if (localOriginalY != 0.0f) {
                localPos.y = localOriginalY;
                localOriginalY = 0.0f;
            } else {
                localPos.y = 0.0f; // fallback
            }

            Transform_INTERNAL_SetPosition(localTF, Vvector3(localPos.x, localPos.y, localPos.z));
        }
    }

    // ================= Restore enemies =================
    Dictionary<uint8_t *, void **> *players =
        *(Dictionary<uint8_t *, void **> **)((uintptr_t)match + 0x148);

    if (players) {
        auto values = players->getValues();
        int count = (int)values.size();

        if (values.size() > 0) {
            for (int i = 0; i < count; i++) {
                void *enemy = values[i];

                if (!enemy || enemy == local)
                    continue;

                void *enemyTF = game_sdk->Component_GetTransform(enemy);
                if (!enemyTF)
                    continue;

                auto it = enemyOriginalY.find(enemy);
                if (it != enemyOriginalY.end()) {
                    Vector3 enemyPos = game_sdk->get_position(enemyTF);
                    enemyPos.y = it->second;

                    Transform_INTERNAL_SetPosition(
                        enemyTF,
                        Vvector3(enemyPos.x, enemyPos.y, enemyPos.z)
                    );
                }
            }
        }

        enemyOriginalY.clear();
    }
}



        

        try {
            if (Vars.Aimbot) {
                ProcessAimbot();
            }

            void *current_Match = game_sdk->Curent_Match();
    if (!current_Match)
        return;






    void *local_player = game_sdk->GetLocalPlayer(current_Match);
    if (!local_player)
        return;




 
    if (Vars.TeleportToMark) {
        // RunSmartAttackMerg(local_player);
    }














    
   if (Vars.MagnetEnemy) {
    void* localTransform = game_sdk->Component_GetTransform(local_player);
    if (localTransform) {
        Vector3 myPos = game_sdk->get_position(localTransform);

        Dictionary<uint8_t *, void **> *players =
            *(Dictionary<uint8_t *, void **> **)((uintptr_t)current_Match + 0x148);

        if (players) {

            auto values = players->getValues(); // FIX
            int count = values.size();        // FIX

            for (int i = 0; i < count; i++) {
                void *enemy = values[i];

                if (!enemy || enemy == local_player ||
                    game_sdk->get_isLocalTeam(enemy) ||
                    game_sdk->get_IsDieing(enemy))
                    continue;

                void *enemyTransform = game_sdk->Component_GetTransform(enemy);
                if (enemyTransform) {
                    Vector3 enemyPos = game_sdk->get_position(enemyTransform);

                    float dx = myPos.x - enemyPos.x;
                    float dy = myPos.y - enemyPos.y;
                    float dz = myPos.z - enemyPos.z;
                    float distance = sqrt(dx*dx + dy*dy + dz*dz);

                    if (distance > 0.1f && distance <= 7.0f) {
                        Transform_INTERNAL_SetPosition(
                            enemyTransform,
                            Vvector3(myPos.x + 1.2f, myPos.y, myPos.z)
                        );
                    }
                }
            }
        }
    }
}

    
    void* PlayerAttributes = *(void**)((uint64_t)local_player + 0x708);
    if (!PlayerAttributes)
        return;

    

            Dictionary<uint8_t *, void **> *players = *(Dictionary<uint8_t *, void **> **)((long)current_Match + 0x148);
            if (!players)
                return;

             

   



            void *camera = game_sdk->get_camera();
            if (!camera)
                return;


            


            // One-shot Telekill: runs once when Telekill turns ON, then stops until you turn it OFF and ON again
            static bool _tk_fired = false;  // persists across frames

if (!Vars.Telekill) {
    // switch OFF -> re-arm
    _tk_fired = false;
} 
else if (!_tk_fired) 
{
    void* enemy = GetClosestEnemyForTelekill();
    if (enemy) 
    {
        void* enemy_tf = game_sdk->Component_GetTransform(enemy);
        void* local_tf = game_sdk->Component_GetTransform(local_player);

        if (enemy_tf && local_tf) 
        {
            Vector3 pos = Transform_INTERNAL_GetPosition(enemy_tf);
            Transform_INTERNAL_SetPosition(local_tf, Vvector3(pos.x, pos.y, pos.z));

            _tk_fired = true; // consumed this ON toggle
        }
    }
}


// ================= FAKE TELEKILL =================
// ================= FAKE TELEKILL =================
if (Vars.fakeTelekill)
{
    void* enemy = GetClosestEnemyForfakeTelekill();

    if (enemy)
    {
            void* enemyTransform = game_sdk->Component_GetTransform(enemy);
            void* localTransform = game_sdk->Component_GetTransform(local_player);

            if (enemyTransform && localTransform)
            {
                Vector3 enemyPos = tanghinh::Transform_GetPosition(enemyTransform);

                // ignore invalid positions
                if (!((enemyPos.x == 0 && enemyPos.y == 0 && enemyPos.z == 0) ||
                      enemyPos.y > 300.0f || enemyPos.y < -30.0f))
                {
                    Vvector3 newPos;
                    newPos.X = enemyPos.x + 1.4f;
                    newPos.Y = enemyPos.y;
                    newPos.Z = enemyPos.z + 1.4f;

                    Transform_INTERNAL_SetPosition(localTransform, newPos);
                }
            }
    }
}


// ================= TELEKILL SLIDER =================
if (Vars.TelekillSliderEnabled && local_player != nullptr)
{
    void* match = game_sdk->Curent_Match();
    void* enemy = (match ? GetEnemyByShortestDistance(local_player, match) : nullptr);

    if (enemy != nullptr)
    {
        void* enemyTF = game_sdk->Component_GetTransform(enemy);
        void* localTF = game_sdk->Component_GetTransform(local_player);

        if (enemyTF && localTF)
        {
            Vector3 enemyPos = game_sdk->get_position(enemyTF);

            enemyPos.x += Vars.TeleX;
            enemyPos.y += Vars.TeleY;

            Transform_INTERNAL_SetPosition(
                localTF,
                Vvector3(enemyPos.x, enemyPos.y, enemyPos.z)
            );
        }
    }
}
// -------------------------------------------------------



            for (int u = 0; u < players->getValues().size(); u++) {
                void *closestEnemy = players->getValues()[u];
                if (!closestEnemy ||
                    !game_sdk->Component_GetTransform(closestEnemy) ||
                    closestEnemy == local_player ||
                    !game_sdk->get_MaxHP(closestEnemy) ||
                    game_sdk->get_isLocalTeam(closestEnemy)) {
                    continue;
                    }
                    numberOfPlayersAround++;

                Vector3 pos = getPosition(closestEnemy);
                Vector3 pos2 = getPosition(local_player);
                float distance = Vector3::Distance(pos, pos2);
                 if (distance > Vars.MaxDistance)
                    continue;

                bool isEnemyDead = game_sdk->get_IsDieing(closestEnemy);
                bool isEnemyVisible = tanghinh::isVisible(closestEnemy);

                bool w2sc;
                ImVec2 top_pos = Camera$$WorldToScreen::Regular(pos + Vector3(0, 1.6, 0));
                ImVec2 bot_pos = Camera$$WorldToScreen::Regular(pos);
                ImVec2 pos_3 = Camera$$WorldToScreen::Checker(pos, w2sc);
                auto pmtXtop = top_pos.x;
                auto pmtXbottom = bot_pos.x;
                if (top_pos.x > bot_pos.x) {
                    pmtXtop = bot_pos.x;
                    pmtXbottom = top_pos.x;
                }
                Camera$$WorldToScreen::Checker(pos + Vector3(0, 0.75f, 0), w2sc);
                float calculatedPosition = fabs((top_pos.y - bot_pos.y) * (0.0092f / 0.019f) / 2);

                ImRect rect(
                    ImVec2(pmtXtop - calculatedPosition, top_pos.y),
                            ImVec2(pmtXbottom + calculatedPosition, bot_pos.y));
                const auto &viewpos = game_sdk->get_position(game_sdk->Component_GetTransform(game_sdk->get_camera()));

                if (w2sc) {


                    if (Vars.lines) {
        ImVec2 startPos = ImVec2(ImGui::GetIO().DisplaySize.x * 0.5f, 0.0f);
        ImVec2 endPos = ImVec2(rect.GetCenter().x, rect.Min.y);

        // 1. رسم "التوهج" (Glow) - خطوط عريضة شفافة تعطي إحساس الضوء
        draw_list->AddLine(startPos, endPos, ImColor(255, 255, 255, 40), 4.5f); // توهج خارجي عريض
        draw_list->AddLine(startPos, endPos, ImColor(255, 255, 255, 80), 2.5f); // توهج داخلي متوسط

        // 2. الخط الأساسي - أبيض ناصع جداً وقوي في المنتصف
        draw_list->AddLine(startPos, endPos, ImColor(255, 255, 255, 255), 1.2f);
    }
                    

                    if (Vars.Box) {
                        DrawLine(draw_list, rect.Min, ImVec2(rect.Max.x, rect.Min.y), 1.0f, isEnemyDead, isEnemyVisible);
                        DrawLine(draw_list, ImVec2(rect.Max.x, rect.Min.y), rect.Max, 1.0f, isEnemyDead, isEnemyVisible);
                        DrawLine(draw_list, rect.Max, ImVec2(rect.Min.x, rect.Max.y), 1.0f, isEnemyDead, isEnemyVisible);
                        DrawLine(draw_list, ImVec2(rect.Min.x, rect.Max.y), rect.Min, 1.0f, isEnemyDead, isEnemyVisible);

                        if (Vars.Outline) {
                            draw_list->AddRect(rect.Min - ImVec2(1, 1), rect.Max + ImVec2(1, 1), ImColor(0, 0, 0, 200), 0.0f, 0, 1.0f);
                            draw_list->AddRect(rect.Min + ImVec2(1, 1), rect.Max - ImVec2(1, 1), ImColor(0, 0, 0, 200), 0.0f, 0, 1.0f);
                        }
                    }

                    if (Vars.Health) {
                        auto health = game_sdk->GetHp(closestEnemy);
                        auto maxhealth = game_sdk->get_MaxHP(closestEnemy);
                        float health_multiplier = (float)health / (float)maxhealth;
                        
                        if (health_multiplier < 0.0f) health_multiplier = 0.0f;
                        if (health_multiplier > 1.0f) health_multiplier = 1.0f;

                        float barWidth = 2.0f;
                        float health_bar_pos = rect.Min.x - 5.0f;
                        
                        ImVec2 barStart = ImVec2(health_bar_pos, rect.Min.y);
                        ImVec2 barEnd = ImVec2(health_bar_pos, rect.Max.y);
                        float currentHealthHeight = (barEnd.y - barStart.y) * health_multiplier;

                        draw_list->AddRectFilled(ImVec2(barStart.x - 1, barStart.y - 1), ImVec2(barStart.x + barWidth + 1, barEnd.y + 1), ImColor(0, 0, 0, 200));

                        ImColor healthColor = ImColor::HSV(health_multiplier * 0.33f, 0.9f, 0.9f, 1.0f);

                        if (health > 0) {
                            draw_list->AddRectFilled(ImVec2(barStart.x, barEnd.y - currentHealthHeight), ImVec2(barStart.x + barWidth, barEnd.y), healthColor);
                        }
                    }

                    if (Vars.Name) {
                        auto pname = game_sdk->name(closestEnemy);
                        std::string names = "Unknown";
                        if (pname)
                            names = pname->toCPPString();

                        std::transform(names.begin(), names.end(), names.begin(), ::toupper);

                        float fontSize = 10.0f;
                        ImVec2 text_size = verdana_smol->CalcTextSizeA(fontSize, FLT_MAX, 0, names.c_str());
                        
                        ImVec2 name_pos = {
                            rect.Min.x + (rect.GetWidth() / 2.0f) - (text_size.x / 2.0f),
                            rect.Min.y - text_size.y - 5.0f
                        };

                        draw_list->AddText(verdana_smol, fontSize, name_pos + ImVec2(1, 1), ImColor(0, 0, 0, 200), names.c_str());
                        
                        draw_list->AddText(verdana_smol, fontSize, name_pos, ImColor(255, 255, 255, 255), names.c_str());
                    }

                    if (Vars.Distance)
        {
            std::string distancestr = fmt::format(oxorany("[{}M]"), static_cast<int>(distance));

            ImVec2 distance_pos = {
                rect.Min.x + (rect.GetWidth() / 2),
                rect.Max.y + 2
            };

            ImVec2 text_size = verdana_smol->CalcTextSizeA(12, FLT_MAX, 0, distancestr.c_str());

            distance_pos.x -= text_size.x / 2;

            AddText(verdana_smol, 12, false, Vars.Outline, distance_pos, ImColor(255, 255, 255), distancestr.c_str());
        }

                    if (Vars.skeleton) {
                        DrawSkeleton(closestEnemy, draw_list);
                    }
                }

                if (Vars.OOF) {
                    if ((pos_3.x < 0 || pos_3.x > disp.width) || (pos_3.y < 0 || pos_3.y > disp.height) || !w2sc) {
                        constexpr int maxpixels = 150;
                        int pixels = maxpixels;
                        if (w2sc) {
                            if (pos_3.x < 0)
                                pixels = clamp((int)-pos_3.x, 0, (int)maxpixels);
                            if (pos_3.y < 0)
                                pixels = clamp((int)-pos_3.y, 0, (int)maxpixels);

                            if (pos_3.x > disp.width)
                                pixels = clamp((int)pos_3.x - (int)disp.width, 0, (int)maxpixels);
                            if (pos_3.y > disp.height)
                                pixels = clamp((int)pos_3.y - (int)disp.height, 0, (int)maxpixels);
                        }

                        float opacity = (float)pixels / (float)maxpixels;

                        float size = 3.5f;
                        Vector3 viewdir = game_sdk->GetForward(game_sdk->Component_GetTransform(game_sdk->get_camera()));
                        Vector3 targetdir = Vector3::Normalized(pos - viewpos);

                        float viewangle = atan2(viewdir.z, viewdir.x) * Rad2Deg;
                        float targetangle = atan2(targetdir.z, targetdir.x) * Rad2Deg;

                        if (viewangle < 0)
                            viewangle += 360;
                        if (targetangle < 0)
                            targetangle += 360;

                        float angle = targetangle - viewangle;

                        while (angle < 0)
                            angle += 360;
                        while (angle > 360)
                            angle -= 360;

                        angle = 360 - angle;
                        angle -= 90;
                        OtFovV1(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2, 90 + distance * 2,
                                angle - size,
                                angle + size,
                                ImColor(1.f, 1.f, 1.f, 1.f * opacity), 1);
                    }
                }
            }





            if (Vars.counts) {
                ImDrawList* draw_list = ImGui::GetBackgroundDrawList();
                
                std::string fullText = "Enemies: " + std::to_string(numberOfPlayersAround) + "  Bots: " + std::to_string(numberOfBots);

                float fontSize = 13.0f; 
                ImVec2 textSize = verdana_smol->CalcTextSizeA(fontSize, FLT_MAX, 0.0f, fullText.c_str());
                
                ImVec2 textPos = ImVec2(
                    (ImGui::GetIO().DisplaySize.x * 0.5f) - (textSize.x * 0.5f), 
                    50.0f 
                );

                draw_list->AddText(verdana_smol, fontSize, textPos + ImVec2(1, 1), ImColor(0, 0, 0, 255), fullText.c_str());
                draw_list->AddText(verdana_smol, fontSize, textPos + ImVec2(-1, -1), ImColor(0, 0, 0, 255), fullText.c_str());
                draw_list->AddText(verdana_smol, fontSize, textPos + ImVec2(1, -1), ImColor(0, 0, 0, 255), fullText.c_str());
                draw_list->AddText(verdana_smol, fontSize, textPos + ImVec2(-1, 1), ImColor(0, 0, 0, 255), fullText.c_str());

                draw_list->AddText(verdana_smol, fontSize, textPos, ImColor(255, 0, 0, 255), fullText.c_str());
            }
        } catch (...) {
            return;
        }
    }

    void aimbot() {
        ImVec2 center = ImVec2(ImGui::GetIO().DisplaySize.x / 2, ImGui::GetIO().DisplaySize.y / 2);
        if (!Vars.Aimbot)
            return;
        ImDrawList *draw_list = ImGui::GetBackgroundDrawList();
        if (!draw_list)
            return;
        void *Match = game_sdk->Curent_Match();
        if (!Match)
            return;

        if (Vars.Aimbot && Vars.isAimFov) {
            if (Vars.fovaimglow)
                drawcircleglow(draw_list, center, Vars.AimFov, ImColor(1.0f, 1.0f, 1.0f, 1.0f), 999, 1, 12);
            else
                draw_list->AddCircle(center, Vars.AimFov, ImColor(1.0f, 1.0f, 1.0f, 1.0f), 100);
        }

        void *LocalPlayer = game_sdk->GetLocalPlayer(Match);
        if (!LocalPlayer || !game_sdk->Component_GetTransform(LocalPlayer))
            return;

        void *playertarget = GetClosestEnemy();
        if (!playertarget)
            return;

        ImVec2 EnemyLocation = Camera$$WorldToScreen::Regular(GetHitboxPosition(playertarget, Vars.AimHitbox));
        ImColor aimbotColor = ImColor(255, 255, 255);

        ProcessAimbot();
    }
