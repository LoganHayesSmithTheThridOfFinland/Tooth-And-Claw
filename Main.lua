-- Scripting done by Logan H. Smith (Me :3)
-- For anyone editing this, booleans are 0 and 1. 0 for false and 1 for true. If this is changed to standard true or false operators it will not save properly.
-- If you do want to mod this and have any questions about the coding, email me at mrlogansir8@gmail.com .
-- I don't read emails a lot, so don't be surprised if it takes me a while to respond.

-- Other
local save_ = {}
local colors = { 
    reset = "\27[0m",
    red = "\27[31m",
    green = "\27[32m",
    yellow = "\27[33m",
    blue = "\27[34m",
    magenta = "\27[35m",
    cyan = "\27[36m",
    white = "\27[37m"
}

-- Scene Booleans
local titleScene_ = true
local settingsScene_ = false
local areaScene_ = false
local tutorialScene_ = false
local encounterScene_ = false
local deathScene_ = false

-- Strings
local userResponse_
local lastSceneLoaded_

-- User Based Settings
local textColor_ = "\27[92m"

-- Resource Max Gather Amounts
local sticksMaxForest_ = 10
local leavesMaxForest_ = 16
local smallRocksMaxForest_ = 3
local berriesMaxForest_ = 6
local sticksMaxPlains_ = 7
local leavesMaxPlains_ = 12
local smallRocksMaxPlains_ = 7
local berriesMaxPlains_ = 3
local sticksMaxJungle_ = 8
local leavesMaxJungle_ = 20
local smallRocksMaxJungle_ = 5
local berriesMaxJungle_ = 11
local sticksMaxDesert_ = 8
local smallRocksMaxDesert_ = 9
local berriesMaxDesert_ = 2
local meatHarvestMax_ = 4
local hideHarvestMax_ = 9
local choppingDownTreeWoodAmoutMax_ = 6
local choppingDownTreeWoodAmoutMin_ = 3
local miningRockStoneAmoutMax_ = 7
local miningRockStoneAmoutMin_ = 5
local miningRockIronOreAmoutMax_ = 3
local miningRockIronOreAmoutMin_ = 1

-- Game variables
local biomes_ = {"Forest", "Plains", "Jungle", "Desert"}
local resources_ = {"Trees", "Rocks", "Bushes", "Dead Bushes", "Dead trees"}
local sleepingDamageLines_ = {"You rolled over on a sharp rock in your sleep.", "You woke up to a possum chewing on your leg."}
local scavengingDamageLines_ = {"You accidentally tripped over a rock.", "You stumbled and took a fall.", "You accidentally ran face first into a tree."}
local craftableItems_ = "Bandage (20 Leaves), Stone Hatchet (15 Small Rocks, 9 Sticks, 20 Leaves), Stone Pickaxe (25 Small Rocks, 10 Sticks, 15 leaves), Stone Spear (16 Small Rocks, 28 Sticks, 40 leaves), Base (50 Wood, 20 Stone, 150 Leaves, 30 Hide)"
local huntingMeleeMessages_ = {"You managed to get the jump on a rabbit!", "You managed to sneak up on a squirl!", "You scared a groundhog into running right into your weapon!"}
local travelEncounterMessage_ = {"You suddenly run into a bear!", "You accidentally stumbled into a coyote!", "You are attacked by a wolf!", "You accidentally run into a moose!"}
local sleepingDamageMax_ = 7
local sleepingDamageMin_ = 3
local sleepingDamageChanceMax_ = 7
local scavagingDamageChanceMax_ = 30
local scavengingDamageMax_ = 5
local scavengingDamageMin_ = 2
local forestTempetureMin_ = 62
local forestTempetureMax_ = 72
local plainsTempetureMin_ = 60
local plainsTempetureMax_ = 76
local jungleTempetureMin_ = 74
local jungleTempetureMax_ = 82
local desertTempetureMin_ = 91
local desertTempetureMax_ = 104
local ironChances_ = 3
local amountScavengedMax_ = 4
local travelEnergyRequirement_ = 8
local travelNewBiomeChance_ = 20
local choppingTreeEnergyCost_ = 7
local craftEnergyCost_ = 1
local huntingEnergyCost_ = 6
local travelRandomEncounterChance_ = 25
local currentIngameResources_ = 4
local miningEnergyCost_ = 4
local scavengeFoodUse_ = 1
local day_ = 1
local cookedMeatFoodIncrease_ = 15
local berriesFoodIncrease_ = 1
local currentBiome_
local currenttempeture_

-- Player Variables
local healthMax_ = 100
local health_ = 100
local energyMax_ = 10
local energy_ = 10
local hungerMax_ = 100
local hunger_ = 100
local wood_ = 0
local stone_ = 0
local sticks_ = 0
local leaves_ = 0
local smallRocks_ = 0
local hide_ = 0
local meat_ = 0
local berries_ = 0
local cookedMeat_ = 0
local ironOre_ = 0
local ironIngots_ = 0
local bandages_ = 0
local hasStoneHatchet_ = 0
local hasStonePickaxe_ = 0
local hasStoneSpear_ = 0
local inventory_ = {}

-- Item Variables
local fistsMaxDamage_ = 25
local fistsMinDamage_ = 15
local bandageHealAmount_ = 10
local bandageLeavesAmount_ = 20
local stoneHatchetStoneAmount_ = 15
local stoneHatchetStickAmount_ = 9
local stoneHatchetLeavesAmount_ = 20
local stoneHatchetDamageMax_ = 60
local stoneHatchetDamageMin_ = 35
local stoneHatchetBreakOnUseChance_ = 120
local stonePickaxeRockAmount_ = 25
local stonePickaxeStickAmount_ = 10
local stonePickaxeLeavesAmount_ = 15
local stonePickaxeBreakOnUseChance_ = 200
local stoneSpearRockAmount_ = 16
local stoneSpearStickAmount_ = 28
local stoneSpearLeavesAmount_ = 40
local stoneSpearDamageMax_ = 110
local stoneSpearDamageMin_ = 75
local stoneSpearBreakOnUseChance_ = 145

-- Encounter Variables
local possibleEncounters_ = 4
local currentEncounter_
local bearHealth_ = 120
local bearDamageMax_ = 75
local bearDamageMin_ = 50
local coyoteHealth_ = 40
local coyoteDamageMax_ = 25
local coyoteDamageMin_ = 15
local wolfHealth_ = 55
local wolfDamageMax_ = 40
local wolfDamageMin_ = 30
local mooseHealth_ = 135
local mooseDamageMax_ = 60
local mooseDamageMin_ = 45

-- Base Variables
local baseBuildEnergyCost_ = 10
local hasABase_ = 0
local baseWoodAmount_ = 50
local baseStoneAmount_ = 20
local baseLeavesAmount_ = 150
local baseHideAmount_ = 30
local atBase_ = 0
local baseBiomeLocation_ = "ph" -- placeholder
local baseLocationTempeture_ = 0 -- placeholder
local campFireAtBase_ = 0
local forgeAtBase_ = 0
local campFireWoodCost_ = 10
local campFireStoneCost_ = 15
local campFireSticksCost = 20
local campFireSmallRocksCost_ = 5
local forgeStoneCost_ = 40
local forgeHideCost_ = 45
local forgeSmallRockCost_ = 25

os.execute("color 0a")


function Mysplit(inputstr, sep)
    if inputstr ~= nil then
    if sep == nil then
      sep = "%s"
    end
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(save_, str)
    end
  end
end
  
function Title_ ()
os.execute("cls")
local saveFileR_ = io.open("saved/Save.sv","r")
if saveFileR_ ~= nil then
 Mysplit(saveFileR_:read(), " ")
end
print("=======================================")
print("||___________            __  .__     ||")
print("||\\__    ___/___   _____/  |_|  |__  ||")
print("||  |    | /  _ \\ /  _ \\   __\\  |  \\ ||")
print("||  |    |(  <_> |  <_> )  | |   Y  \\||")   
print("||  |____| \\____/ \\____/|__| |___|  /||")
print("||                                \\/ ||")
print("||  ____                             ||")
print("|| /  _ \\                            ||")
print("|| >  _ </\\                          ||")
print("||/  <_\\ \\/                          ||")
print("||\\_____\\ \\                          ||")
print("||       \\/                          ||")
print("||_________ .__                      ||")
print("||\\_   ___ \\|  | _____ __  _  __     ||")
print("||/    \\  \\/|  | \\__  \\ \\/ \\/ /      ||")
print("||\\     \\___|  |__/ __ \\     /       ||")
print("|| \\______  /____(____  /\\/\\_/       ||")
print("||       \\/          \\/              ||")
print("=======================================")
print("||            Version 0.2            ||")
print("=======================================")
print(" ")
print("(1) Start")
print("(2) Settings")
print("(3) Help")
print(" ")
os.execute("title Tooth and Claw")
end

function Tutorial ()
    os.execute("cls")
print("===========================================================================")
print("|| General: Tooth and Claw is a text based survival game made in lua.    ||")
print("|| The objective is simply to survive as long as possible.               ||")
print("||                                                                       ||")
print("|| Player Stats: The player has basic stats. Health and energy. Health   ||")
print("|| is, as you guessed, the player's health. Energy is like stamina;      ||")
print("|| You need it to do things. Energy is required for harvesting,          ||")
print("|| traveling, and crafting. Sleeping will restore you back to max        ||")
print("|| energy no matter what. Becareful though, because you can take damage  ||")
print("|| in your sleep.                                                        ||")
print("||                                                                       ||")
print("|| Crafting: Crafting requires resources that can be found in the        ||")
print("|| player's inventory. The items that can be crafted can be viewed by    ||")
print("|| typing the command for typing and nothing else. To craft an item,     ||")
print("|| type the craft command followed by the name of the item you want to   ||")
print("|| craft. Items like bandages are automatically used while items like    ||")
print("|| the stone hatchet can be used by typing 'stonehatchet' then followed  ||")
print("|| by what you want to use it for (chopping trees, hunting, etc).        ||")
print("||                                                                       ||")
print("|| Unspecified Commands: One of the major commands is 'Use'. The Use     ||")
print("|| is used to use whatever item is specified. For example: Use Bandage.  ||")
print("|| Some things like the stone hatchet require more detail.               ||")
print("|| For example: Use Stone Hatchet hunt. This would make the player hunt. ||")
print("===========================================================================")
print(" ")
print("(1) Back")
end

function Settings_ ()
os.execute("cls")
print("=======================================")
print("||             Settings              ||")
print("=======================================")
print("|| (1) Text-Color                    ||")
print("||                                   ||")
print("||                                   ||")
print("||                                   ||")
print("||                                   ||")
print("=======================================")
print(" ")
print("(2) Back")
print(" ")
end

function Death_ ()
    os.execute("cls")
    print("\27[31m=======================================")
    print("||               Dead                ||")
    print("=======================================")
    print("||          (1) Continue             ||")
    print("=======================================".. textColor_)
    end
    

function Area_ (msg_)
    local biomeRan_ = math.random(1, #biomes_)
    currentBiome_ = biomes_[biomeRan_]
    if msg_ then
        print(msg_)
    end
    os.execute("cls")
    print("=========================================")
    print("||              AREA INFO              ||")
    print("=========================================")
    print("Biome: ".. currentBiome_)
    if biomeRan_ == 1 then
        local temp_ = tostring(math.random(forestTempetureMin_, forestTempetureMax_))
        currenttempeture_ = temp_
        print("Local Resources: ".. resources_[1], resources_[2], resources_[3])
        print("Tempeture: ".. temp_)
        elseif biomeRan_ == 2 then
            local temp_ = tostring(math.random(plainsTempetureMin_, plainsTempetureMax_))
            currenttempeture_ = temp_
            print("Local Resources: ".. resources_[2], resources_[3])
            print("Tempeture: ".. temp_)
            elseif  biomeRan_ == 3 then
                local temp_ = tostring(math.random(jungleTempetureMin_, jungleTempetureMax_))
                currenttempeture_ = temp_
                print("Local Resources: ".. resources_[1], resources_[2], resources_[3])
                print("Tempeture: ".. temp_)
                elseif biomeRan_ == 4 then
                    local temp_ = tostring(math.random(desertTempetureMin_, desertTempetureMax_))
                    currenttempeture_ = temp_
                    print("Local Resources: ".. resources_[2], resources_[4], resources_[5])
                    print("Tempeture: ".. temp_)
    end
    print(" ")
    print("(1) Character Info")
    print("(2) Scavenge")
    print("(3) Sleep")
    print("(4) Craft")
    print("(5) Travel")
    print("(6) Inventory")
    print("(7) Commands")
end

function AreaRe_ (msg_)
    if msg_ then
        print(msg_)
    end
    os.execute("cls")
    print("=========================================")
    print("||              AREA INFO              ||")
    print("=========================================")
    print("Biome: ".. currentBiome_)
    if currentBiome_ == "Forest" then
        print("Local Resources: ".. resources_[1], resources_[2], resources_[3])
        elseif currentBiome_ == "Plains" then
            print("Local Resources: ".. resources_[2], resources_[3])
            elseif  currentBiome_ == "Jungle" then
                print("Local Resources: ".. resources_[1], resources_[2], resources_[3])
                elseif currentBiome_ == "Desert" then
                    print("Local Resources: ".. resources_[2], resources_[4], resources_[5])
    end
    print("Tempeture: ".. currenttempeture_)
    print(" ")
    print("(1) Character Info")
    print("(2) Scavenge")
    print("(3) Sleep")
    print("(4) Craft")
    print("(5) Travel")
    print("(6) Inventory")
    print("(7) Commands")
end

function IndexArray (arrayVal_)
    for i = 1, #arrayVal_ do
        return arrayVal_[i]
    end
end

Title_()

while true do
    io.flush()
    userResponse_ = io.read()
    userResponse_ = string.lower(userResponse_)
    if userResponse_ == "1" and titleScene_ == true then
        userResponse_ = nil
        Area_()
        tutorialScene_ = false
        titleScene_ = false
        settingsScene_ = false
        areaScene_ = true
    end
    if userResponse_ == "1" and deathScene_ == true then
        os.execute("cls")
        os.execute("start Tooth_And_Claw.bat")
        os.exit()
    end
    if userResponse_ ~= nil and string.match(userResponse_, "1") and encounterScene_ == true then
        os.execute("cls")
        AreaRe_()
        if userResponse_ == "1 stone hatchet" and hasStoneHatchet_ == 1 then
            if currentEncounter_ == "Bear" then
                local damage_ = math.random(bearDamageMin_, bearDamageMax_)
                health_ = health_ - damage_
                print(" ")
                print("You tried all you could but the bear proved too much.")
                print("You had to run away.")
                print(" ")
                print("-".. damage_.. " Health")
                print(" ")
                titleScene_ = false
                settingsScene_ = false
                areaScene_ = true
                tutorialScene_ = false
                deathScene_ = false
                encounterScene_ = false
            end
            if currentEncounter_ == "Coyote" then
                local encounterHealth_ = math.random(coyoteHealth_, coyoteHealth_)
                local attackDamage_ = math.random(stoneHatchetDamageMin_, stoneHatchetDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the coyote!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(coyoteDamageMin_, coyoteDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Wolf" then
                local encounterHealth_ = math.random(wolfHealth_, wolfHealth_)
                local attackDamage_ = math.random(stoneHatchetDamageMin_, stoneHatchetDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the wolf!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(wolfDamageMin_, wolfDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Moose" then
                local encounterHealth_ = math.random(mooseHealth_, mooseHealth_)
                local attackDamage_ = math.random(stoneHatchetDamageMin_, stoneHatchetDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the moose!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(mooseDamageMin_, mooseDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
        end
        if userResponse_ == "1 stone spear" and hasStoneSpear_ == 1 then
            if currentEncounter_ == "Bear" then
                local damage_ = math.random(bearDamageMin_, bearDamageMax_)
                health_ = health_ - damage_
                print(" ")
                print("You tried all you could but the bear proved too much.")
                print("You had to run away.")
                print(" ")
                print("-".. damage_.. " Health")
                print(" ")
                titleScene_ = false
                settingsScene_ = false
                areaScene_ = true
                tutorialScene_ = false
                deathScene_ = false
                encounterScene_ = false
            end
            if currentEncounter_ == "Coyote" then
                local encounterHealth_ = math.random(coyoteHealth_, coyoteHealth_)
                local attackDamage_ = math.random(stoneSpearDamageMin_, stoneSpearDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the coyote!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(coyoteDamageMin_, coyoteDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Wolf" then
                local encounterHealth_ = math.random(wolfHealth_, wolfHealth_)
                local attackDamage_ = math.random(stoneSpearDamageMin_, stoneSpearDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the wolf!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(wolfDamageMin_, wolfDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Moose" then
                local encounterHealth_ = math.random(mooseHealth_, mooseHealth_)
                local attackDamage_ = math.random(stoneSpearDamageMin_, stoneSpearDamageMax_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the moose!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(mooseDamageMin_, mooseDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
        end
        if userResponse_ == "1 fists" then
            if currentEncounter_ == "Bear" then
                local damage_ = math.random(bearDamageMin_, bearDamageMax_)
                health_ = health_ - damage_
                print(" ")
                print("You tried all you could but the bear proved too much.")
                print("You had to run away.")
                print(" ")
                print("-".. damage_.. " Health")
                print(" ")
                titleScene_ = false
                settingsScene_ = false
                areaScene_ = true
                tutorialScene_ = false
                deathScene_ = false
                encounterScene_ = false
            end
            if currentEncounter_ == "Coyote" then
                local encounterHealth_ = math.random(coyoteHealth_, coyoteHealth_)
                local attackDamage_ = math.random(fistsMinDamage_, fistsMaxDamage_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the coyote!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(coyoteDamageMin_, coyoteDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Wolf" then
                local encounterHealth_ = math.random(wolfHealth_, wolfHealth_)
                local attackDamage_ = math.random(fistsMinDamage_, fistsMaxDamage_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the wolf!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(wolfDamageMin_, wolfDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
            if currentEncounter_ == "Moose" then
                local encounterHealth_ = math.random(mooseHealth_, mooseHealth_)
                local attackDamage_ = math.random(fistsMinDamage_, fistsMaxDamage_)
                encounterHealth_ = encounterHealth_ - attackDamage_
                if encounterHealth_ <= 0 then
                    local hideRan_ = math.random(1, hideHarvestMax_)
                    local meatRan_ = math.random(1, meatHarvestMax_)
                    hide_ = hide_ + hideRan_
                    meat_ = meat_ + meatRan_
                    print(" ")
                    print("You managed to slay the moose!")
                    print(" ")
                    print("+".. meat_.. " Meat")
                    print("+".. hideRan_.. " Hide")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
                if encounterHealth_ > 0 then
                    local plrDamage_ = math.random(mooseDamageMin_, mooseDamageMax_)
                    print(" ")
                    print("You were unable to win the fight.")
                    print("You had to run.")
                    print(" ")
                    print("-".. plrDamage_.. " Health")
                    print(" ")
                    titleScene_ = false
                    settingsScene_ = false
                    areaScene_ = true
                    tutorialScene_ = false
                    deathScene_ = false
                    encounterScene_ = false
                end
            end
        end
    end
    if userResponse_ ~= nil and string.match(userResponse_, "2") and encounterScene_ == true then
        os.execute("cls")
        AreaRe_()
        titleScene_ = false
        settingsScene_ = false
        areaScene_ = true
        tutorialScene_ = false
        deathScene_ = false
        encounterScene_ = false
    end
    if userResponse_ == "1" and tutorialScene_ == true then
        userResponse_ = nil
        Title_()
        tutorialScene_ = false
        titleScene_ = true
        settingsScene_ = false
        areaScene_ = false
    end
    if userResponse_ == "1" and deathScene_ == true then
       health_ = healthMax_
       energy_ = energyMax_
       wood_ = 0
       sticks_ = 0
       smallRocks_ = 0
       leaves_ = 0
       hide_ = 0
       meat_ = 0
       bandages_ = 0
       ironOre_ = 0
       ironIngots_ = 0
       hasStoneHatchet_ = 0
       hasStonePickaxe_ = 0
    end
    if userResponse_ == "1" and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        print(" ")
        print("Health: ".. health_.. "/".. healthMax_)
        print("Energy: ".. energy_.. "/".. energyMax_)
        print("Food: ".. hunger_.. "/".. hungerMax_)
        print(" ")
    end
    if userResponse_ == "2" and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        userResponse_ = nil
        if energy_ >= 2 then
            local damageChances_ = math.random(1, scavagingDamageChanceMax_)
            energy_ = energy_ - 2
            hunger_ = hunger_ - scavengeFoodUse_
            if currentBiome_ == "Forest" then
                local harvestAmount_ = math.random(1, amountScavengedMax_)
                if harvestAmount_ == 1 then
                    local ammountGained_= math.random(1, sticksMaxForest_)
                    print(" ")
                    print("+".. ammountGained_.. " Sticks")
                    print(" ")
                    sticks_ = sticks_ + ammountGained_
                end
                if harvestAmount_ == 2 then
                    local ammountGained_= math.random(1, leavesMaxForest_)
                    print(" ")
                    print("+".. ammountGained_.. " Leaves")
                    print(" ")
                    leaves_ = leaves_ + ammountGained_
                end
                if harvestAmount_ == 3 then
                    local ammountGained_= math.random(1, smallRocksMaxForest_)
                    print(" ")
                    print("+".. ammountGained_.. " Small Rocks")
                    print(" ")
                    smallRocks_ = smallRocks_ + ammountGained_
                end
                if harvestAmount_ == 4 then
                    local ammountGained_= math.random(1, berriesMaxForest_)
                    print(" ")
                    print("+".. ammountGained_.. " Berries")
                    print(" ")
                    berries_ = berries_ + ammountGained_
                end
            end
            if currentBiome_ == "Plains" then
                local harvestAmount_ = math.random(1, amountScavengedMax_)
                if harvestAmount_ == 1 then
                    local ammountGained_= math.random(1, sticksMaxPlains_)
                    print(" ")
                    print("+".. ammountGained_.. " Sticks")
                    print(" ")
                    sticks_ = sticks_ + ammountGained_
                end
                if harvestAmount_ == 2 then
                    local ammountGained_= math.random(1, leavesMaxPlains_)
                    print(" ")
                    print("+".. ammountGained_.. " Leaves")
                    print(" ")
                    leaves_ = leaves_ + ammountGained_
                end
                if harvestAmount_ == 3 then
                    local ammountGained_= math.random(1, smallRocksMaxPlains_)
                    print(" ")
                    print("+".. ammountGained_.. " Small Rocks")
                    print(" ")
                    smallRocks_ = smallRocks_ + ammountGained_
                end
                if harvestAmount_ == 4 then
                    local ammountGained_= math.random(1, berriesMaxPlains_)
                    print(" ")
                    print("+".. ammountGained_.. " Berries")
                    print(" ")
                    berries_ = berries_ + ammountGained_
                end
            end
            if currentBiome_ == "Jungle" then
                local harvestAmount_ = math.random(1, amountScavengedMax_)
                if harvestAmount_ == 1 then
                    local ammountGained_= math.random(1, sticksMaxJungle_)
                    print(" ")
                    print("+".. ammountGained_.. " Sticks")
                    print(" ")
                    sticks_ = sticks_ + ammountGained_
                end
                if harvestAmount_ == 2 then
                    local ammountGained_= math.random(1, leavesMaxJungle_)
                    print(" ")
                    print("+".. ammountGained_.. " Leaves")
                    print(" ")
                    leaves_ = leaves_ + ammountGained_
                end
                if harvestAmount_ == 3 then
                    local ammountGained_= math.random(1, smallRocksMaxJungle_)
                    print(" ")
                    print("+".. ammountGained_.. " Small Rocks")
                    print(" ")
                    smallRocks_ = smallRocks_ + ammountGained_
                end
                if harvestAmount_ == 4 then
                    local ammountGained_= math.random(1, berriesMaxJungle_)
                    print(" ")
                    print("+".. ammountGained_.. " Berries")
                    print(" ")
                    berries_ = berries_ + ammountGained_
                end
            end
            if currentBiome_ == "Desert" then
                local harvestAmount_ = math.random(1, amountScavengedMax_)
                if harvestAmount_ == 1 then
                    local ammountGained_= math.random(1, sticksMaxDesert_)
                    print(" ")
                    print("+".. ammountGained_.. " Sticks")
                    print(" ")
                    sticks_ = sticks_ + ammountGained_
                end
                if harvestAmount_ == 2 then
                    local ammountGained_= math.random(1, sticksMaxDesert_)
                    print(" ")
                    print("+".. ammountGained_.. " Sticks")
                    print(" ")
                    sticks_ = sticks_ + ammountGained_
                end
                if harvestAmount_ == 3 then
                    local ammountGained_= math.random(1, smallRocksMaxDesert_)
                    print(" ")
                    print("+".. ammountGained_.. " Small Rocks")
                    print(" ")
                    smallRocks_ = smallRocks_ + ammountGained_
                end
                if harvestAmount_ == 4 then
                    local ammountGained_= math.random(1, berriesMaxDesert_)
                    print(" ")
                    print("+".. ammountGained_.. " Berries")
                    print(" ")
                    berries_ = berries_ + ammountGained_
                end
            end
            if damageChances_ == 1 then
                local ranDamageScav_ = math.random(scavengingDamageMin_, scavengingDamageMax_)
                health_ = health_ - ranDamageScav_
                print("\27[31m".. scavengingDamageLines_[math.random(1, #scavengingDamageLines_)].. textColor_)
                print(" ")
                print("\27[31m-".. ranDamageScav_.. " Health".. textColor_)
                print(" ")
            end
            elseif energy_ <= 2 then
                print(" ")
                print("\27[33mYou do not have enough energy to scavenge!".. textColor_)
                    print(" ")
        end
    end

    if userResponse_ == "2" and settingsScene_ == true then
        userResponse_ = nil
        Title_()
        titleScene_ = true
        settingsScene_ = false
        tutorialScene_ = false
        areaScene_ = false
    end
    if userResponse_ == "2" and titleScene_ == true then
        userResponse_ = nil
        Settings_()
        titleScene_ = false
        settingsScene_ = true
        tutorialScene_ = false
        areaScene_ = false
    end
    if userResponse_ == "3" and encounterScene_ == true then
        print(" ")
        print("Health: ".. health_.. "/".. healthMax_)
        print("Energy: ".. energy_.. "/".. energyMax_)
        print("Wood: ".. wood_)
        print("Sticks: ".. sticks_)
        print("Leaves: ".. leaves_)
        print("Small Rocks: ".. smallRocks_)
        print("Meat: ".. meat_)
        print("Hide: ".. hide_)
        print(" ")
    end
    if userResponse_ == "3" and areaScene_ == true then
        if energy_ < 5 then
            os.execute("cls")
            AreaRe_()
            local damageInSleep_ = math.random(1, sleepingDamageChanceMax_)
        day_ = day_ + 1
        print(" ")
        print("Day ".. day_)
        print(" ")
        energy_ = energy_ + energyMax_
        if energy_ > energyMax_ then
            energy_ = energyMax_
        end
        if damageInSleep_ == 1 and atBase_ == 0 then
            local damage_ = math.random(sleepingDamageMin_, sleepingDamageMax_)
            health_ = health_ - damage_
            print(" ")
            print("\27[31m".. sleepingDamageLines_[math.random(1, #sleepingDamageLines_)].. textColor_)
            print("\27[31m-".. damage_.. " Health".. textColor_)
            print(" ")
            end
        elseif  energy_ > 5 then
            print(" ")
            print("\27[33m You aren't tired enough to sleep!".. textColor_)
            print(" ")
    end
    end
    if userResponse_ == "3" and titleScene_ == true then
        userResponse_ = nil
        Tutorial()
        titleScene_ = false
        settingsScene_ = false
        tutorialScene_ = true
        areaScene_ = false
        end
    if userResponse_ ~= nil and string.match(userResponse_, "4") and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        if userResponse_ == "4 bandage" and energy_ >= craftEnergyCost_ then
            if leaves_ >= bandageLeavesAmount_ then
                leaves_ = leaves_ - bandageLeavesAmount_
                bandages_ = bandages_ + 1
                print(" ")
                print("You've made a bandage!")
            end
        elseif userResponse_ == "4 bandage" and energy_ <= craftEnergyCost_ then
            print(" ")
            print("You're too tired to craft!")
            print(" ")
        end
        if userResponse_ == "4 stone hatchet" and energy_ >= craftEnergyCost_ then
            if leaves_ >= stoneHatchetLeavesAmount_ and smallRocks_ >= stoneHatchetStoneAmount_ and sticks_ >= stoneHatchetStickAmount_ and hasStoneHatchet_ == 0 then
                energy_ = energy_ - craftEnergyCost_
                leaves_ = leaves_ - stoneHatchetLeavesAmount_
                smallRocks_ = smallRocks_ - stoneHatchetStoneAmount_
                sticks_ = sticks_ - stoneHatchetStickAmount_
                hasStoneHatchet_ = 1
                table.insert(inventory_, "stone htchet")
                print(" ")
                print("Stone hatchet made!")
                print(" ")
            end
            if hasStoneHatchet_ == 1 and userResponse_ == "4 stone hatchet" then
                print(" ")
                print("You already have a stone hatchet!")
                print(" ")
            end
            elseif userResponse_ == "4 stone hatchet" and energy_ <= craftEnergyCost_ then
                print(" ")
                print("You're too tired to craft!")
                print(" ")
        end
        if userResponse_ == "4 stone pickaxe" and energy_ >= craftEnergyCost_ then
            if leaves_ >= stonePickaxeLeavesAmount_ and smallRocks_ >= stonePickaxeRockAmount_ and sticks_ >= stonePickaxeStickAmount_ and hasStonePickaxe_ == 0 then
                energy_ = energy_ - craftEnergyCost_
                leaves_ = leaves_ - stonePickaxeLeavesAmount_
                smallRocks_ = smallRocks_ - stonePickaxeRockAmount_
                sticks_ = sticks_ - stonePickaxeStickAmount_
                hasStonePickaxe_ = 1
                table.insert(inventory_, "Stone Pickaxe")
                print(" ")
                print("Stone pickaxe made!")
                print(" ")
            end
            if hasStonePickaxe_ == 1 then
                print(" ")
                print("You already have a stone pickaxe!")
                print(" ")
                end
            elseif userResponse_ == "4 stone pickaxe" and energy_ <= craftEnergyCost_ then
                print(" ")
                print("You're too tired to craft!")
                print(" ")
        end
        if userResponse_ == "4 stone spear" and energy_ >= craftEnergyCost_ then
            if leaves_ >= stoneSpearLeavesAmount_ and smallRocks_ >= stoneSpearRockAmount_ and sticks_ >= stoneSpearStickAmount_ and hasStoneSpear_ == 0 then
                energy_ = energy_ - craftEnergyCost_
                leaves_ = leaves_ - stoneSpearLeavesAmount_
                smallRocks_ = smallRocks_ - stoneSpearRockAmount_
                sticks_ = sticks_ - stoneSpearStickAmount_
                hasStoneSpear_ = 1
                table.insert(inventory_, "Stone Spear")
                print(" ")
                print("Stone spear made!")
                print(" ")
            end
            if hasStoneSpear_ == 1 then
                print(" ")
                print("You already have a stone spear!")
                print(" ")
                end
            elseif userResponse_ == "4 stone spear" and energy_ <= craftEnergyCost_ then
                print(" ")
                print("You're too tired to spear!")
                print(" ")
        end
        if userResponse_ == "4 base" and energy_ >= baseBuildEnergyCost_ then
            if leaves_ >= baseLeavesAmount_ and stone_ >= baseStoneAmount_ and wood_ >= baseWoodAmount_ and hide_ >= baseHideAmount_ and hasABase_ == 0 then
                energy_ = energy_ - baseBuildEnergyCost_
                leaves_ = leaves_ - baseLeavesAmount_
                stone_ = stone_ - baseStoneAmount_
                wood_ = wood_ - baseWoodAmount_
                hide_ = hide_ - baseHideAmount_
                hasABase_ = 1
                atBase_ = 1
                baseBiomeLocation_ = currentBiome_
                baseLocationTempeture_ = currenttempeture_
                print(" ")
                print("Base built!")
                print(" ")
                elseif hasABase_ == 1 then
                    print(" ")
                    print("You already have a base!")
            end
            elseif userResponse_ == "4 base" and energy_ <= baseBuildEnergyCost_ then
                print(" ")
                print("You're too tired to build a base!")
                print(" ")
        end
        if userResponse_ == "4" then
            print(" ")
            print(craftableItems_)
            print(" ")
        end
    end
    if userResponse_ == "5" and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        if energy_ >= travelEnergyRequirement_ then
            local randomChance_ = math.random(1, travelNewBiomeChance_)
            local encounterChance_ = math.random(1, travelRandomEncounterChance_)
            if randomChance_ ~= 1 then
                print(" ")
                print("You've wandered to another part of the ".. currentBiome_.. ".")
                print(" ")
                atBase_ = 0
                energy_ = energy_ - travelEnergyRequirement_
            end
            if randomChance_ == 1 and encounterChance_ ~= 1 then
                energy_ = energy_ - travelEnergyRequirement_
                atBase_ = 0
                print(" ")
                Area_("You've wandered into a new biome!")
                print(" ")
            end
            if encounterChance_ == 1 then
                local encounter_ = math.random(1, possibleEncounters_)
                titleScene_ = false
                settingsScene_ = false
                areaScene_ = false
                tutorialScene_ = false
                deathScene_ = false
                encounterScene_ = true
                if encounter_ == 1 then
                    print(" ")
                    print("\27[31m".. travelEncounterMessage_[1].. textColor_)
                    print(" ")
                    print("(1) Fight")
                    print("(2) Run")
                    print("(3) Character")
                    currentEncounter_ = "Bear"
                end
                if encounter_ == 2 then
                    print(" ")
                    print("\27[31m".. travelEncounterMessage_[2].. textColor_)
                    print(" ")
                    print("(1) Fight")
                    print("(2) Run")
                    print("(3) Character")
                    currentEncounter_ = "Coyote"
                end
                if encounter_ == 3 then
                    print(" ")
                    print("\27[31m".. travelEncounterMessage_[3].. textColor_)
                    print(" ")
                    print("(1) Fight")
                    print("(2) Run")
                    print("(3) Character")
                    currentEncounter_ = "Wolf"
                end
                if encounter_ == 3 then
                    print(" ")
                    print("\27[31m".. travelEncounterMessage_[4].. textColor_)
                    print(" ")
                    print("(1) Fight")
                    print("(2) Run")
                    print("(3) Character")
                    currentEncounter_ = "Moose"
                end
            end
        end
    end
    if userResponse_ == "6" and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        print(" ")
        if wood_ > 1 then
            print("Wood: ".. wood_)
        end
        if stone_ > 1 then
        print("Stone: ".. stone_)
        end
        if sticks_ > 1 then
        print("Sticks: ".. sticks_)
        end
        if leaves_ > 1 then
        print("Leaves: ".. leaves_)
        end
        if smallRocks_ > 1 then
        print("Small Rocks: ".. smallRocks_)
        end
        if meat_ > 1 then
        print("Meat: ".. meat_)
        end
        if hide_ > 1 then
        print("Hide: ".. hide_)
        end
        if ironOre_ > 1 then
        print("Iron Ore: ".. ironOre_)
        end
        if ironIngots_ > 1 then
        print("Iron Ingots: ".. ironIngots_)
        end
        if bandages_ > 1 then
        print("Bandages: ".. bandages_)
        end
        if hasStoneHatchet_ > 1 then
        print("Stone Hatchets: ".. hasStoneHatchet_)
        end
        if hasStonePickaxe_ > 1 then
        print("Stone Pickaxes: ".. hasStonePickaxe_)
        end
        if hasStoneSpear_ > 1 then
        print("Stone Spears: ".. hasStoneSpear_)
        end
        if cookedMeat_ > 1 then
        print("Cooked Meat: ".. cookedMeat_)
        end
        if berries_ > 1 then
        print("Berries: ".. berries_)
        end
        if hasABase_ > 1 then
        print("Bases: ".. hasABase_)
        end
    end
    if userResponse_ == "7" and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        print(" ")
        print("\27[34msave (Will save your game.)")
        print("load (Will load your save.)\27[37m")
        print(" ")
        print("\27[32muse stone hatchet chop (Will chop down a tree with your stone hatchet. (Requires you to have a stone hatchet.))")
        print("use stone hatchet hunt (Will make you hunt with your stone hatchet. (Requires you to have a stone hatchet.))")
        print("use stone spear hunt (Will make you hunt with your stone spear. (Requires you to have a stone spear.))")
        print("use stone pickaxe mine (Will make you mine with your stone pickaxe. (Requires you to have a stone pickaxe.))")
        print("use bandage heal (Will heal you with your bandage. (Requires you to have a bandage.))")
        print("use berries eat (Will make you eat your berries. (Requires you to have berries.))")
        print("use cooked meat eat (Will make you eat your cooked meat. (Requires you to have cooked meat))\27[37m")
        print("")
        print("\27[33mbase return (Will return you to your base. (Requires you to have a base already built.))")
        print("base craft campfire (Will craft a campfire at your base. (Requires you to have a base already built.))")
        print("base craft forge (Will craft a forge at your base. (Requires you to have a base already built.))") 
        print("base forge smelt iron (Will smelt your iron ore into iron. (Requires you to have a base already built, have a forge, and to have at least 1 iron ore and 1 wood.))") 
        print("base campfire cook meat (Will cook your meat. (Requires you to have a base already built, have a campfire, and to have at least 1 meat and 1 wood.))".. textColor_) 
    end
    if userResponse_ ~= nil and string.match(userResponse_, "1") and settingsScene_ == true then
        if userResponse_ == "1 green" then
            userResponse_ = nil
            os.execute("color 0a")
            textColor_ = "27[32m"
        end
        if userResponse_ == "1 cyan" then
            userResponse_ = nil
            os.execute("color 0b")
            textColor_ = "\27[96m"
        end
        if userResponse_ == "1 red" then
            userResponse_ = nil
            os.execute("color 0c")
            textColor_ = "\27[91m"
        end
        if userResponse_ == "1 purple" then
            userResponse_ = nil
            os.execute("color 0d")
            textColor_ = "\27[95m"
        end
        if userResponse_ == "1 yellow" then
            userResponse_ = nil
            os.execute("color 0e")
            textColor_ = "\27[93m"
        end
        if userResponse_ == "1 white" then
            userResponse_ = nil
            os.execute("color 0f")
            textColor_ = "\27[97m"
        end
    end
    if userResponse_ ~= nil and string.match(userResponse_, "use") and areaScene_ == true then
        os.execute("cls")
        AreaRe_()
        if userResponse_ == "use bandage heal" and bandages_ >= 1 then
                health_ = health_ + bandageHealAmount_
                bandages_ = bandages_ - 1
                if health_ > healthMax_ then
                    health_ = healthMax_
                end
                print(" ")
                print("Bandage used! Health is now ".. health_.. ".")
                print(" ")
        end
        if userResponse_ == "use stone hatchet hunt" and energy_ <= huntingEnergyCost_ and hasStoneHatchet_ == 1 then
            print(" ")
            print("\27[33m You are too tired to hunt!".. textColor_)
            print(" ")
            end
        if userResponse_ == "use stone hatchet hunt" and energy_ >= huntingEnergyCost_ and hasStoneHatchet_ == 1  then
            local hideRan_ = math.random(1, hideHarvestMax_)
            local meatRan_ = math.random(1, meatHarvestMax_)
            local breakChance_ = math.random(1, stoneHatchetBreakOnUseChance_)
            hide_ = hide_ + hideRan_
            meat_ = meat_ + meatRan_
            energy_ = energy_ - huntingEnergyCost_
            print(" ")
            print(huntingMeleeMessages_[math.random(1, #huntingMeleeMessages_)])
            print("+".. meat_.. " Meat")
            print("+".. hideRan_.. " Hide")
            print(" ")
            if breakChance_ == 1 then
                hasStoneHatchet_ = 0
                print("\27[31m Your stone hatchet broke!".. textColor_)
            end
        end
        if userResponse_ == "use stone spear hunt" and energy_ <= huntingEnergyCost_ and hasStoneSpear_ == 1 then
            print(" ")
            print("\27[33m You are too tired to hunt!".. textColor_)
            print(" ")
            end
        if userResponse_ == "use stone spear hunt" and energy_ >= huntingEnergyCost_ and hasStoneSpear_ == 1  then
            local hideRan_ = math.random(1, hideHarvestMax_)
            local meatRan_ = math.random(1, meatHarvestMax_)
            local breakChance_ = math.random(1, stoneSpearBreakOnUseChance_)
            hide_ = hide_ + hideRan_
            meat_ = meat_ + meatRan_
            energy_ = energy_ - huntingEnergyCost_
            print(" ")
            print(huntingMeleeMessages_[math.random(1, #huntingMeleeMessages_)])
            print("+".. meat_.. " Meat")
            print("+".. hideRan_.. " Hide")
            print(" ")
            if breakChance_ == 1 then
                hasStoneSpear_ = 0
                print("\27[31m Your stone spear broke!".. textColor_)
            end
        end
        if userResponse_ == "use stone hatchet chop" and energy_ <= choppingTreeEnergyCost_ and hasStoneHatchet_ == 1 then
            print(" ")
            print("\27[33m You are too tired to chop down trees!".. textColor_)
            print(" ")
            end
            if userResponse_ == "use stone hatchet chop" and currentBiome_ == "Plains" and hasStoneHatchet_ == 1 then
                print(" ")
                print("\27[33m There are no trees around!".. textColor_)
                print(" ")
                end
        if userResponse_ == "use stone hatchet chop" and energy_ >= choppingTreeEnergyCost_ and hasStoneHatchet_ == 1  then
            local woodRan_ = math.random(choppingDownTreeWoodAmoutMin_, choppingDownTreeWoodAmoutMax_)
            local breakChance_ = math.random(1, stoneHatchetBreakOnUseChance_)
            wood_ = wood_ + woodRan_
            energy_ = energy_ - huntingEnergyCost_
            print(" ")
            print("You manage to chop down a tree!")
            print("+".. woodRan_.. " Wood")
            print(" ")
            if breakChance_ == 1 then
                hasStoneHatchet_ = 0
                print("\27[31m Your stone hatchet broke!".. textColor_)
            end
        end
        if userResponse_ == "use stone pickaxe mine" and energy_ <= miningEnergyCost_ and hasStonePickaxe_ == 1 then
            print(" ")
            print("\27[33m You are too tired to mine!".. textColor_)
            print(" ")
            end
        if userResponse_ == "use stone pickaxe mine" and energy_ >= miningEnergyCost_ and hasStonePickaxe_ == 1  then
            local stoneRan_ = math.random(miningRockStoneAmoutMin_, miningRockStoneAmoutMax_)
            local ironChanceRan_ = math.random(1, ironChances_)
            local breakChance_ = math.random(1, stonePickaxeBreakOnUseChance_)
            stone_ = stone_ + stoneRan_
            energy_ = energy_ - miningEnergyCost_
            print(" ")
            print("You manage to mine a rock!")
            print("+".. stoneRan_.. " Stone")
            if ironChanceRan_ == 1 then
                local ironAmount_ = math.random(miningRockIronOreAmoutMin_, miningRockIronOreAmoutMax_)
                ironOre_ = ironOre_ + ironAmount_
                print("+".. ironAmount_.. " Iron Ore")
            end
            if breakChance_ == 1 then
                hasStoneHatchet_ = 0
                print("\27[31m Your stone pickaxe broke!".. textColor_)
            end
        end
        if userResponse_ == "use stone hatchet" and  hasStoneHatchet_ == 1 then
            print(" ")
            print("Please define the action.")
            print("Command suffixes:")
            print("chop, hunt")
            print(" ")
        end
        if userResponse_ == "use stone pickaxe" and hasStonePickaxe_ == 1 then
            print(" ")
            print("Please define the action.")
            print("Command suffixes:")
            print("mine")
            print(" ")
        end
        if userResponse_ == "use cooked meat eat" and cookedMeat_ >= 1 then
            hunger_ = hunger_ + cookedMeatFoodIncrease_
            print(" ")
            print("Food consumed!")
            print("+".. cookedMeatFoodIncrease_.. " Hunger")
            print(" ")
            if hunger_ > hungerMax_ then
                hunger_ = hungerMax_
            end
        end
        if userResponse_ == "use berries eat" and berries_ >= 1 and berries_ < 5 then
            hunger_ = hunger_ + berriesFoodIncrease_
            berries_ = berries_ - 1
            print(" ")
            print("Food consumed!")
            print("+".. berriesFoodIncrease_.. " Hunger")
            print(" ")
            if hunger_ > hungerMax_ then
                hunger_ = hungerMax_
            end
        end
        if userResponse_ == "use berries eat" and berries_ >= 5  and hunger_ <= 95 then
            hunger_ = hunger_ + berriesFoodIncrease_ * 5
            berries_ = berries_ - 5
            print(" ")
            print("Food consumed!")
            print("+5 Hunger")
            print(" ")
            if hunger_ > hungerMax_ then
                hunger_ = hungerMax_
            end
            end
    end
    if userResponse_ ~= nil and string.match(userResponse_, "base") and areaScene_ == true then
        if userResponse_ == "base return" and hasABase_ == 1 then
            currentBiome_ = baseBiomeLocation_
            currenttempeture_ = baseLocationTempeture_
            atBase_ = 1
            AreaRe_()
            elseif hasABase_ == 0 and userResponse_ ~= "base return" then
                os.execute("cls")
                AreaRe_()
                print("\27[33m You do not have a base built!".. textColor_)
        end
        if userResponse_ == "base craft campfire" and hasABase_ == 1 and energy_ >= craftEnergyCost_ and atBase_ == 1 then
            if wood_ >= campFireWoodCost_ and stone_ >= campFireStoneCost_ and sticks_ >= campFireSticksCost and smallRocks_ >= campFireSmallRocksCost_ and campFireAtBase_ == 0 then
                os.execute("cls")
                AreaRe_()
                campFireAtBase_ = 1
                print(" ")
                print("Campfire made!")
                print(" ")
            end
            elseif userResponse_ == "base craft campfire" and hasABase_ == 0 then
                os.execute("cls")
                AreaRe_()
                print(" ")
                print("You don't have a base!")
                print(" ")
                elseif userResponse_ == "base craft campfire" and energy_ <= craftEnergyCost_ then
                    os.execute("cls")
                    AreaRe_()
                    print(" ")
                    print("You're too tired to craft!")
                    print(" ")
        end
        if userResponse_ == "base craft forge" and hasABase_ == 1 and energy_ >= craftEnergyCost_ and atBase_ == 1 then
            if stone_ >= forgeStoneCost_ and smallRocks_ >= forgeSmallRockCost_ and hide_ >= forgeHideCost_ and forgeAtBase_ == 0 then
                os.execute("cls")
                AreaRe_()
                forgeAtBase_ = 1
                print(" ")
                print("Forge made!")
                print(" ")
            end
            elseif userResponse_ == "base craft forge" and hasABase_ == 0 then
                os.execute("cls")
                AreaRe_()
                print(" ")
                print("You don't have a base!")
                print(" ")
                elseif userResponse_ == "base craft forge" and energy_ <= craftEnergyCost_ then
                    os.execute("cls")
                    AreaRe_()
                    print(" ")
                    print("You're too tired to craft!")
                    print(" ")
        end
        if userResponse_ == "base campfire cook meat" and campFireAtBase_ == 1 and meat_ >= 1 and wood_ >= 1 and atBase_ == 1 then
            meat_ = meat_ - 1
            wood_ = wood_ - 1
            cookedMeat_ = cookedMeat_ + 1
            print(" ")
            print("Meat cooked!")
            print("+1 Cooked Meat")
            print(" ")
        end
        if userResponse_ == "base forge smelt iron" and forgeAtBase_ == 1 and ironOre_ >= 1 and wood_ >= 1 and atBase_ == 1 then
            ironOre_ = ironOre_ - 1
            wood_ = wood_ - 1
            ironIngots_ = ironIngots_ + 1
            print(" ")
            print("Iron smelted!")
            print("+1 iron ingot")
            print(" ")
        end
        if userResponse_ == "base campfire" and campFireAtBase_ == 0 then
            print(" ")
            print("\27[33m You do not have a campfire!".. textColor_)
            print(" ")
        end
        if userResponse_ == "base forge" and forgeAtBase_ == 0 then
            print(" ")
            print("\27[33m You do not have a forge!".. textColor_)
            print(" ")
        end
        if userResponse_ == "base craft" and hasABase_ == 1 then
            print(" ")
            print("Please define the action.")
            print("Command suffixes:")
            print("campfire")
            print(" ")
            print("Craftable items:")
            print("Campfire (10 Wood, 15 Stone, 20 Sticks, 5 Small Rocks)")
            print(" ")
        end
        if userResponse_ == "base" and hasABase_ == 1 then
            print(" ")
            print("Please define the action.")
            print("Command suffixes:")
            print("return, craft")
            print(" ")
        end
    end
    if userResponse_ == "save" and areaScene_ == true then
        print("Saved!")
        local saveFileW_ = io.open("saved/Save.sv","w")
        if saveFileW_ ~= nil then
            saveFileW_:write(health_, " ", energy_, " ", wood_, " ", stone_, " ", sticks_, " ", leaves_, " ", smallRocks_, " ", hide_, " ", meat_, " ", ironOre_, " ", ironIngots_, " ", bandages_, " ", hasStoneHatchet_, " ", hasStonePickaxe_, " ", hasStoneSpear_, " ", currentBiome_, " ", currenttempeture_, " ", hasABase_, " ", baseBiomeLocation_, " ", baseLocationTempeture_, " ", atBase_, " ", day_, " ", campFireAtBase_, " ", cookedMeat_, " ", hunger_, " ", berries_, forgeAtBase_)
           saveFileW_:close()
           local saveFileR_ = io.open("saved/Save.sv","r")
           if saveFileR_ ~= nil then
            Mysplit(saveFileR_:read(), " ")
           end
        end
    end 
    if userResponse_ == "load" and areaScene_ == true then
        if save_[1] ~= nil then
        print("Loaded!")
        health_ = tonumber(save_[1])
        energy_ = tonumber(save_[2])
        wood_ = tonumber(save_[3])
        stone_ = tonumber(save_[4])
        sticks_ = tonumber(save_[5])
        leaves_ = tonumber(save_[6])
        smallRocks_ = tonumber(save_[7])
        hide_ = tonumber(save_[8])
        meat_ = tonumber(save_[9])
        ironOre_ = tonumber(save_[10])
        ironIngots_ = tonumber(save_[11])
        bandages_ = tonumber(save_[12])
        hasStoneHatchet_ = tonumber(save_[13])
        hasStonePickaxe_ = tonumber(save_[14])
        hasStoneSpear_ = tonumber(save_[15])
        currentBiome_ = save_[16]
        currenttempeture_ = tonumber(save_[17])
        hasABase_ = tonumber(save_[18])
        baseBiomeLocation_ = save_[19]
        baseLocationTempeture_ = tonumber(save_[20])
        atBase_ = tonumber(save_[21])
        day_ = tonumber(save_[22])
        campFireAtBase_ = tonumber(save_[23])
        cookedMeat_ = tonumber(save_[24])
        hunger_ = tonumber(save_[25])
        berries_ = tonumber(save_[26])
        forgeAtBase_ = tonumber(save_[27])
        AreaRe_()
        elseif save_[1] == nil then
            print(" ")
            print("\27[33mThere is no save to load!".. textColor_)
            print(" ")
        end
    end

    if health_ <= 0 then
        titleScene_ = false
        settingsScene_ = false
        areaScene_ = false
        deathScene_ = true
        Death_()
    end
end