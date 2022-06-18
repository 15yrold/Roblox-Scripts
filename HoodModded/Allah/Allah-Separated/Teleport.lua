local Players = game:GetService('Players')
local TweenService = game:GetService("TweenService")
local Client = Players.LocalPlayer
local CFrame = CFrame.new

local Settings = {
    Teleport = {
        TeleportSpeed = 4.5;
    };
    GunTeleport = {
        TacticalSG = CFrame(176.713, 411.948, -383.493);
        DoubleBarrelSG = CFrame(-1013.3, 330.654, -56.6453);
        ShotGun = CFrame(-555.914, 317.212, -542.346);
        Revolver = CFrame(-618.418, 330.647, 80.6274);
        DrumGun = CFrame(-58.0846, 331.475, 117.489);
        Tec9 = CFrame(-1113.94, 330.654, -38.5044);
        Smg = CFrame(-552.663, 317.212, -516.501);
        Ump = CFrame(-568.963, 317.212, -534.727);
        Sniper = CFrame(-569.648, 317.212, -534.393);
        SilencerAR = CFrame(-569.676, 317.212, -541.191);
        AR = CFrame(-569.813, 317.212, -547.714);
        P90 = CFrame(-568.581, 317.212, -546.479);
        AK47 = CFrame(-561.856, 317.212, -546.782);
        Silencer = CFrame(-554.938, 317.212, -546.871);
        Deagle = CFrame(-1020.16, 330.654, -55.4148);
    };
    ArmorTeleport = {
        HouseArmor1 = CFrame(-581.349, 319.247, -592.036);
        PoliceArmor = CFrame(-231.801, 330.697, 123.306);
        HighMedArmor = CFrame(-909.098, 280.383, 777.966);
        HighArmor = CFrame(-1226.61, 336.684, -515.175);
    };
    FoodTeleport = {
        JaquaviesHotChicken = {
            Cranberry = CFrame(-1134.4, 330.721, 82.3636);
            Chicken = CFrame(-1140.27, 330.721, 82.0354);
            Pizza = CFrame(-1145.74, 330.721, 82.0561);
        };
        MovieTheater = {
            Popcorn = CFrame(-967.607, 333.504, 47.5425);
        };
        School = {
            Pizza = CFrame(-576.981, 330.758, 515.173);
            Hamburger = CFrame(-576.569, 330.758, 500.121);
            Cranberry = CFrame(-576.739, 330.758, 487.602);
        };
        Bank = {
            Pizza = CFrame(-301.037, 332.58, -91.6711);
            Chicken = CFrame(-301.213, 332.58, -86.2648);
            Cranberry = CFrame(-301.411, 332.58, -80.1773);
        };
    };
    PlaceTeleports = {
        Bank = CFrame(-385.684, 330.648, -80.2923);
        PoliceStation = CFrame(-244.548, 330.152, 72.3879);
        FireStation = CFrame(-105.264, 330.177, 72.7521);
        HooKicks = CFrame(-163.837, 330.652, -207.035);
        Hospital = CFrame(112.539, 330.652, -279.928);
        Church = CFrame(80.011, 343.345, -597.927);
        HoodFitness = CFrame(-49.1041, 330.652, -394.143);
        BoxingClub = CFrame(-191.685, 330.652, -916.291);
        Casino = CFrame(-876.987, 330.156, 34.4326);
        School = CFrame(-628.947, 330.633, 466.754);
    };
}

getgenv().TeleportTo = function(Place)
    tween = TweenService:Create(Client.Character.HumanoidRootPart, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {CFrame = Place})
    tween:Play()
end

TeleportTo(Settings.GunTeleport.Revolver)
