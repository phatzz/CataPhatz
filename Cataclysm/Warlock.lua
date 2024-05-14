if UnitClassBase( 'player' ) ~= 'WARLOCK' then return end

local addon, ns = ...
local Hekili = _G[ addon ]
local class, state = Hekili.Class, Hekili.State

local FindUnitBuffByID = ns.FindUnitBuffByID

local spec = Hekili:NewSpecialization( 9 )

spec:RegisterResource( Enum.PowerType.Mana )

-- Talents
spec:RegisterTalents( {
    aftermath = { 11197, 2, 85113, 85114 },
    amplify_curse = { 6542, 1, 18288 },
    ancient_grimoire = { 11188, 2, 85109, 85110 },
    aura_of_foreboding = { 11814, 2, 89604, 89605 },
    backdraft = { 10978, 3, 47258, 47259, 47260 },
    backlash = { 10958, 3, 34935, 34938, 34939 },
    bane = { 10938, 3, 17788, 17789, 17790 },
    bane_of_havoc = { 10962, 1, 80240 },
    burning_embers = { 11182, 2, 85112, 91986 },
    cataclysm = { 941, 3, 17778, 17779, 17780 },
    chaos_bolt = { 10986, 1, 50796 },
    conflagrate = { 968, 1, 17962 },
    contagion = { 6562, 5, 30060, 30061, 30062, 30063, 30064 },
    cremation = { 11199, 2, 85103, 85104 },
    curse_of_exhaustion = { 18223, 1, 18223 },
    dark_arts = { 10992, 3, 18694, 85283, 85284 },
    deaths_embrace = { 11142, 3, 47198, 47199, 47200 },
    decimation = { 11034, 2, 63156, 63158 },
    demonic_aegis = { 11190, 2, 30143, 30144 },
    demonic_brutality = { 3059, 3, 18705, 18706, 18707 },
    demonic_embrace = { 10994, 3, 18697, 18698, 18699 },
    demonic_empowerment = { 3047, 2, 47193, 54509 },
    demonic_knowledge = { 3031, 3, 35691, 35692, 35693 },
    demonic_pact = { 11042, 1, 47236 },
    demonic_power = { 983, 2, 18126, 18127 },
    demonic_quickness = { 3089, 2, 80228, 80229 },
    demonic_rebirth = { 11713, 2, 88446, 88447 },
    demonic_resilience = { 3027, 3, 30319, 30320, 30321 },
    demonic_tactics = { 3033, 5, 30242, 30245, 30246, 30247, 30248 },
    designer_notes = { 7451, 1, 80557 },
    destructive_reach = { 964, 2, 17917, 17918 },
    doom_and_gloom = { 11100, 2, 18827, 18829 },
    emberstorm = { 11181, 2, 17954, 17955 },
    empowered_corruption = { 1764, 3, 32381, 32382, 32383 },
    empowered_imp = { 10982, 2, 47220, 47221 },
    eradication = { 11134, 3, 47195, 47196, 47197 },
    everlasting_affliction = { 11150, 3, 47201, 47202, 47203 },
    fel_concentration = { 6540, 3, 17783, 17784, 17785 },
    fel_domination = { 1226, 1, 18708 },
    fel_synergy = { 11206, 2, 47230, 47231 },
    fel_vitality = { 3005, 3, 18731, 18743, 18744 },
    fire_and_brimstone = { 1890, 5, 47266, 47267, 47268, 47269, 47270 },
    grim_reach = { 6544, 2, 18218, 18219 },
    hand_of_guldan = { 11201, 1, 71521 },
    haunt = { 11152, 1, 48181 },
    impending_doom = { 11198, 3, 85106, 85107, 85108 },
    improved_corruption = { 6528, 5, 17810, 17811, 17812, 17813, 17814 },
    improved_curse_of_weakness = { 6530, 2, 18179, 18180 },
    improved_demonic_tactics = { 3037, 3, 54347, 54348, 54349 },
    improved_fear = { 11114, 2, 53754, 53759 },
    improved_health_funnel = { 10998, 2, 18703, 18704 },
    improved_howl_of_terror = { 11140, 2, 30054, 30057 },
    improved_immolate = { 961, 3, 17815, 17833, 17834 },
    improved_imp = { 3051, 2, 18695, 18696 },
    improved_life_tap = { 11110, 2, 18182, 18183 },
    improved_sayaad = { 3063, 3, 18754, 18755, 18756 },
    improved_searing_pain = { 11196, 2, 17927, 17929 },
    improved_soul_fire = { 10940, 2, 18119, 18120 },
    improved_soul_leech = { 1889, 1, 54118 },
    inferno = { 11189, 1, 85105 },
    intensity = { 985, 2, 18135, 18136 },
    jinx = { 11214, 2, 18179, 85479 },
    malediction = { 6568, 3, 32477, 32483, 32484 },
    mana_feed = { 11020, 2, 30326, 85175 },
    master_conjuror = { 3077, 2, 18767, 18768 },
    master_demonologist = { 3079, 5, 23785, 23822, 23823, 23824, 23825 },
    master_summoner = { 11014, 2, 18709, 18710 },
    metamorphosis = { 11044, 1, 59672 },
    molten_core = { 11024, 3, 47245, 47246, 47247 },
    molten_skin = { 1887, 3, 63349, 63350, 63351 },
    nemesis = { 3097, 2, 63117, 63121 },
    nether_protection = { 10964, 2, 30299, 30301 },
    nether_ward = { 12120, 1, 91713 },
    nightfall = { 11122, 2, 18094, 18095 },
    pandemic = { 11200, 2, 85099, 85100 },
    ruin = { 967, 5, 17959, 59738, 59739, 59740, 59741 },
    shadow_and_flame = { 10936, 3, 17793, 17796, 17801 },
    shadow_embrace = { 11124, 3, 32385, 32387, 32392 },
    shadow_mastery = { 6558, 5, 18271, 18272, 18273, 18274, 18275 },
    shadowburn = { 10948, 1, 17877 },
    shadowfury = { 10980, 1, 30283 },
    siphon_life = { 11420, 2, 63108, 86667 },
    soul_leech = { 10970, 2, 30293, 30295 },
    soul_link = { 3065, 1, 19028 },
    soul_siphon = { 11112, 2, 17804, 17805 },
    soul_swap = { 11366, 1, 86121 },
    soulburn_seed_of_corruption = { 11419, 1, 86664 },
    summon_felguard = { 3095, 1, 30146 },
    unholy_power = { 3071, 5, 18769, 18770, 18771, 18772, 18773 },
    unstable_affliction = { 6572, 1, 30108 },
} )


-- Auras
spec:RegisterAuras( {
    -- Dazed.
    aftermath = {
        id = 18118,
        duration = 5,
        max_stack = 1,
    },
    -- Reduced cast time and global cooldown for your non-channeled Destruction spells by $s1%.
    backdraft = {
        id = 54277,
        duration = 15,
        max_stack = 1,
        copy = { 54277, 54276, 54274 },
    },
    backlash = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=34939)
        id = 34939,
        duration = 3600,
        max_stack = 1,
        copy = { 34939, 34938, 34936, 34935 },
    },
    -- Invulnerable, but unable to act.
    banish = {
        id = 18647,
        duration = 30,
        max_stack = 1,
        copy = { 710, 18647 },
    },
    -- Taunted.
    challenging_howl = {
        id = 59671,
        duration = 6,
        max_stack = 1,
    },
    -- Fire damage every $t2 seconds.
    conflagrate = {
        id = 17962,
        duration = 6,
        max_stack = 1,
    },
    -- $s1 Shadow damage every $t1 seconds.
    corruption = {
        id = 47813,
        duration = function() return ( 18 * haste)	end,
        tick_time = function() return ( 3 * haste)	end,
        max_stack = 1,
        copy = { 172, 6222, 6223, 7648, 11671, 11672, 25311, 27216, 47812, 47813 },
    },
    -- $o1 Shadow damage over $d.
    curse_of_agony = {
        id = 47864,
        duration = function() return glyph.curse_of_agony.enabled and 28 or 24 end,
        tick_time = 2,
        max_stack = 1,
        copy = { 980, 1014, 6217, 11711, 11712, 11713, 27218, 47863, 47864 },
    },
    -- Causes $s1 Shadow damage after $d.
    curse_of_doom = {
        id = 47867,
        duration = 60,
        tick_time = 60,
        max_stack = 1,
        copy = { 603, 30910, 47867 },
    },
    -- Movement speed slowed by $s1%.
    curse_of_exhaustion = {
        id = 18223,
        duration = 12,
        max_stack = 1,
        shared = "target",
    },
    -- Reduces Arcane, Fire, Frost, Nature and Shadow resistances by $s1.  Increases magic damage taken by $s2%.
    curse_of_the_elements = {
        id = 47865,
        duration = 300,
        max_stack = 1,
        copy = { 1490, 11721, 11722, 27228, 47865 },
        shared = "target",
    },
    -- Speaking Demonic increasing casting time by $s1%.
    curse_of_tongues = {
        id = 11719,
        duration = 30,
        max_stack = 1,
        copy = { 1714, 11719 },
        shared = "target",
    },
    -- Melee attack power reduced by $s1, and armor is reduced by $s2%.
    curse_of_weakness = {
        id = 50511,
        duration = 120,
        max_stack = 1,
        copy = { 702, 1108, 6205, 7646, 11707, 11708, 27224, 30909, 50511 },
        shared = "target",
    },
    -- Horrified.
    death_coil = {
        id = 47860,
        duration = function() return glyph.death_coil.enabled and 3.5 or 3 end,
        max_stack = 1,
        copy = { 6789, 17925, 17926, 27223, 47859, 47860, 52375, 59134, 65820 },
    },
    -- Your Soul Fire cast time is reduced by $s1%, and costs no shard.
    decimation = {
        id = 63167,
        duration = 10,
        max_stack = 1,
        copy = { 63167, 63165 },
    },
    -- Increases armor by $s1, and amount of health generated through spells and effects by $s2%
    demon_armor = {
        id = 47889,
        duration = 1800,
        max_stack = 1,
        copy = { 706, 1086, 11733, 11734, 11735, 27260, 47793, 47889 },
    },
    -- Stunned.
    demon_charge = {
        id = 60995,
        duration = 3,
        max_stack = 1,
    },
    -- Increases armor by $s1, and amount of health generated through spells and effects by $s2%
    demon_skin = {
        id = 696,
        duration = 1800,
        max_stack = 1,
        copy = { 687, 696 },
    },
    -- Demonic Circle Summoned.
    demonic_circle_summon = {
        id = 48018,
        duration = 360,
        tick_time = 1,
        max_stack = 1,
    },

    -- Detect lesser invisibility.
    detect_invisibility = {
        id = 132,
        duration = 600,
        max_stack = 1,
    },
    -- Drains $s1 health every $t1 sec to the caster.
    drain_life = {
        id = 47857,
        duration = function () return (5 * haste ) end,
        tick_time = function () return (1 * haste ) end,
        max_stack = 1,
        copy = { 689, 699, 709, 7651, 11699, 11700, 27219, 27220, 47857, 358742 },
    },
    -- Drains $m1% mana each second to the caster.
    drain_mana = {
        id = 5138,
		duration = function () return (5 * haste ) end,
        tick_time = function () return (1 * haste ) end,
        max_stack = 1,
    },
    -- $s2 Shadow damage every $t2 seconds.
    drain_soul = {
        id = 47855,
		tick_time = function() return (3 * haste) end,
        duration = function () return (15 * haste) end,
        max_stack = 1,
        copy = { 1120, 8288, 8289, 11675, 27217, 47855 },
    },
    -- Increases speed by $s2%.
    dreadsteed = {
        id = 23161,
        duration = 3600,
        max_stack = 1,
    },
    -- Next spell crit is 100%.
    empowered_imp = {
        id = 47283,
        duration = 8,
        max_stack = 1,
    },
    -- Spell casting speed increased by $s1%.
    eradication = {
        id = 64371,
        duration = 10,
        max_stack = 1,
        copy = { 64371, 64370, 64368 },
    },
    -- Controlling Eye of Kilrogg.
    eye_of_kilrogg = {
        id = 126,
        duration = 45,
        max_stack = 1,
    },
    -- Feared.
    fear = {
        id = 6215,
        duration = 20,
        max_stack = 1,
        copy = { 5782, 6213, 6215, 65809 },
    },
    -- Increases spell power by $s3 plus additional spell power equal to $s1% of your Spirit. Also regenerate $s2% of maximum health every 5 sec.
    fel_armor = {
        id = 47893,
        duration = 1800,
        max_stack = 1,
        copy = { 28176, 28189, 44520, 44977, 47892, 47893 },
    },
    -- Imp, Voidwalker, Succubus, Felhunter and Felguard casting time reduced by $/1000;S1 sec.  Mana cost reduced by $s2%.
    fel_domination = {
        id = 18708,
        duration = 15,
        max_stack = 1,
    },
    -- Increases speed by $s2%.
    felsteed = {
        id = 5784,
        duration = 3600,
        max_stack = 1,
    },
    -- Damage taken from Shadow damage-over-time effects increased by $s3%.
    haunt = {
        id = 59164,
        duration = 12,
        max_stack = 1,
        copy = { 48181, 59161, 59163, 59164 },
    },
    -- Transferring Life.
    health_funnel = {
        id = 47856,
        duration = 10,
        tick_time = 1,
        max_stack = 1,
        copy = { 755, 3698, 3699, 3700, 11693, 11694, 11695, 27259, 47856 },
    },
    -- Damages self and all nearby enemies.
    hellfire = {
        id = 47823,
        duration = 15,
        tick_time = 1,
        max_stack = 1,
        copy = { 1949, 11683, 11684, 27213, 47823 },
    },
    -- Fleeing in terror.
    howl_of_terror = {
        id = 17928,
        duration = 8,
        max_stack = 1,
        copy = { 5484, 17928, 50577 },
    },
    -- $s1 Fire damage every $t1 seconds.
    immolate = {
        id = 47811,
        duration = function() return 15 + ( 3 * talent.molten_core.rank ) end,
        tick_time = 3,
        max_stack = 1,
        copy = { 348, 707, 1094, 2941, 11665, 11667, 11668, 25309, 27215, 47810, 47811 },
    },
    -- Damages all nearby enemies.
    immolation_aura = {
        id = 50589,
        duration = 15,
        tick_time = 1,
        max_stack = 1,
    },
    -- Stunned.
    inferno_effect = {
        id = 22703,
        duration = 2,
        max_stack = 1,
    },
    -- Spell Power increase from Life Tap.
    life_tap = {
        id = 63321,
        duration = 40,
        max_stack = 1,
    },
    -- Demon Form.  Armor contribution from items increased by $47241s2%.  Chance to be critically hit by melee reduced by 6%.  Damage increased by $47241s3%.  Stun and snare duration reduced by $54817s1%.
    metamorphosis = {
        id = 47241,
        duration = 30,
        max_stack = 1,
    },
    -- Incinerate - Increases damage done by $71165s1% and reduces cast time by $71165s3%.    Soul Fire - Increases damage done by $71165s1% and increases critical strike chance by $71165s2%.
    molten_core = {
        id = 71165,
        duration = 15,
        max_stack = 1,
        copy = { 71165, 71162, 47383 },
    },
    nether_protection_holy = {
        id = 54370,
        duration = 8,
        max_stack = 1,
    },
    nether_protection_fire = {
        id = 54371,
        duration = 8,
        max_stack = 1,
    },
    nether_protection_frost = {
        id = 54372,
        duration = 8,
        max_stack = 1,
    },
    nether_protection_arcane = {
        id = 54373,
        duration = 8,
        max_stack = 1,
    },
    nether_protection_shadow = {
        id = 54374,
        duration = 8,
        max_stack = 1,
    },
    nether_protection_nature = {
        id = 54375,
        duration = 8,
        max_stack = 1,
    },
    -- Movement speed reduction (after Fear).
    nightmare = {
        id = 60947,
        duration = 5,
        max_stack = 1,
        copy = { 60946 }
    },
    -- Fire and Shadow damage increased by $s1%.
    pyroclasm = {
        id = 63244,
        duration = 10,
        max_stack = 1,
        copy = { 63244, 63243, 18093 },
    },
    -- $47818s1 Fire damage every $47818t1 seconds.
    rain_of_fire = {
        id = 47820,
        duration = 8,
        max_stack = 1,
        copy = { 5740, 6219, 11677, 11678, 19474, 27212, 39273, 47819, 47820 },
    },
    ritual_of_doom = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=18540)
        id = 18540,
        duration = 60,
        max_stack = 1,
    },
    ritual_of_souls = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=58887)
        id = 58887,
        duration = 60,
        max_stack = 1,
        copy = { 58887, 29893 },
    },
    ritual_of_summoning = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=698)
        id = 698,
        duration = 120,
        max_stack = 1,
    },
    -- Causes $s1 Shadow damage every $t1 sec.  After taking $s2 total damage or dying, Seed of Corruption deals $47834s1 Shadow damage to the caster's enemies within $47834a1 yards.
    seed_of_corruption = {
        id = 47836,
        duration = 18,
        tick_time = 3,
        max_stack = 1,
        copy = { 27243, 47835, 47836 },
    },
    -- Detecting Demons.
    sense_demons = {
        id = 5500,
        duration = 3600,
        max_stack = 1,
    },
    shadow_cleave = {
        duration = function () return swings.mainhand_speed end,
        max_stack = 1,
    },
    -- Periodic shadow damage taken increased by $s1%, and periodic healing received reduced by $60468s1%.
    shadow_embrace = {
        id = 32391,
        duration = 12,
        max_stack = 3,
        copy = { 32391, 32390, 32389, 32388, 32386 },
    },
    -- Your next Shadow Bolt becomes an instant cast spell.
    shadow_trance = {
        id = 17941,
        duration = 10,
        max_stack = 1,
    },
    -- Absorbs Shadow damage.
    shadow_ward = {
        id = 47891,
        duration = 30,
        max_stack = 1,
        copy = { 6229, 11739, 11740, 28610, 47890, 47891 },
    },
    -- If target dies, casting warlock gets a Soul Shard.
    shadowburn = {
        id = 29341,
        duration = 5,
        max_stack = 1,
    },
    shadowflame = {
        id = 61291,
        duration = 8,
        max_stack = 1,
        copy = { 47960 }
    },
    -- Stunned.
    shadowfury = {
        id = 47847,
        duration = 3,
        max_stack = 1,
        copy = { 30283, 30413, 30414, 47846, 47847 },
    },
    -- Enslaved.
    subjugate_demon = {
        id = 61191,
        duration = 300,
        max_stack = 1,
        copy = { 1098, 11725, 11726, 61191 },
    },
    summon_felguard = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=30146)
        id = 30146,
        duration = 3600,
        max_stack = 1,
    },
    summon_felhunter = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=691)
        id = 691,
        duration = 3600,
        max_stack = 1,
    },
    summon_imp = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=688)
        id = 688,
        duration = 3600,
        max_stack = 1,
    },
    summon_incubus = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=713)
        id = 713,
        duration = 3600,
        max_stack = 1,
    },
    summon_succubus = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=712)
        id = 712,
        duration = 3600,
        max_stack = 1,
    },
    summon_voidwalker = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=697)
        id = 697,
        duration = 3600,
        max_stack = 1,
    },
	inferno = { -- TODO: Check Aura (https://wowhead.com/wotlk/spell=1122)
        id = 89,
        duration = 60,
        max_stack = 1,
    },
    -- Underwater Breathing.
    unending_breath = {
        id = 5697,
        duration = 600,
        max_stack = 1,
    },
    -- $s1 Shadow damage every $t1 sec.  If dispelled, will cause $*9;s1 damage to the dispeller and silence them for $31117d.
    unstable_affliction = {
        id = 47843,
        duration = 15,
        tick_time = 3,
        max_stack = 1,
        copy = { 30108, 30404, 30405, 43522, 47841, 47843, 65812 },
    },

    my_curse = {
        alias = { "curse_of_the_elements", "curse_of_doom", "curse_of_agony", "curse_of_weakness", "curse_of_tongues", "curse_of_exhaustion" },
        aliasMode = "first",
        aliasType = "debuff",
    },

    armor = {
        alias = { "fel_armor", "demon_armor", "demon_skin" },
        aliasMode = "first",
        aliasType = "buff"
    }
} )


-- Glyphs
spec:RegisterGlyphs( {
    [42456] = "bane_of_agony",
    [45781] = "chaos_bolt",
    [42455] = "corruption",
    [42457] = "death_coil",
    [43390] = "drain_soul",
    [42491] = "eye_of_kilrogg",
    [42458] = "fear",
    [42459] = "felguard",
    [42460] = "felhunter",
    [42454] = "conflagrate",
    [42461] = "health_funnel",
    [42462] = "healthstone",
    [45779] = "haunt",
    [42463] = "howl_of_terror",
    [42465] = "imp",
    [42464] = "immolate",
    [42453] = "incinerate",
    [45785] = "life_tap",
    [45780] = "metamorphosis",
    [45782] = "demonic_circle",
    [43393] = "subjugate_demon",
    [42468] = "shadowburn",
    [42467] = "shadow_bolt",
    [45783] = "shadowflame",
    [42466] = "soul_swap",
    [42470] = "soulstone",
    [45789] = "soul_link",
    [42471] = "seduction",
    [42472] = "unstable_affliction",
    [42473] = "voidwalker",
    [43394] = "ritual_of_souls",
    [43389] = "unending_breath",
} )


spec:RegisterPet( "imp", 416, "summon_imp", 3600 )
spec:RegisterPet( "voidwalker", 1860, "summon_voidwalker", 3600 )
spec:RegisterPet( "felhunter", 417, "summon_felhunter", 3600 )
spec:RegisterPet( "succubus", 1863, "summon_succubus", 3600 )
spec:RegisterPet( "incubus", 185317, "summon_incubus", 3600 )
spec:RegisterPet( "felguard", 17252, "summon_felguard", 3600 )
spec:RegisterPet( "infernal", 89, "inferno", 60 )

local cataclysm_reduction = {
    [0] = 1,
    [1] = 0.96,
    [2] = 0.93,
    [3] = 0.9
}

local mod_cataclysm = setfenv( function( base )
    return base * cataclysm_reduction[ talent.cataclysm.rank ]
end, state )


local mod_suppression = setfenv( function( base )
    return base * ( 1 - 0.02 * talent.suppression.rank )
end, state )


local finish_shadow_cleave = setfenv( function()
    spend( class.abilities.shadow_cleave.spend * mana.modmax, "mana" )
end, state )

spec:RegisterStateFunction( "start_shadow_cleave", function()
    applyBuff( "shadow_cleave", swings.time_to_next_mainhand )
    state:QueueAuraExpiration( "shadow_cleave", finish_shadow_cleave, buff.shadow_cleave.expires )
end )


spec:RegisterStateExpr( "persistent_multiplier", function( action )
    local mult = 1
    if action == "corruption" then
        if talent.deaths_embrace.enabled and target.health.pct < 35 then
            mult = mult * ( 1 + 0.04 * talent.deaths_embrace.rank )
        end

        if buff.tricks_of_the_trade_buff.up then
            mult = mult * 1.15
        end
    end

    return mult
end )

spec:RegisterCombatLogEvent( function( _, subtype, _,  sourceGUID, sourceName, _, _, destGUID, destName, destFlags, _, spellID, spellName )

    if sourceGUID == state.GUID then
        if subtype == "SPELL_AURA_APPLIED" then
            local aura = class.auras[ spellID ]

            if aura == class.auras.corruption then
                local mult = 1

                if state.talent.deaths_embrace.enabled and aura == class.auras.corruption and UnitGUID( "target" ) == destGUID and ( UnitHealth( "target" ) / ( UnitHealthMax( "target" ) or 1 ) < 0.35 ) then
                    mult = mult * 1 + 0.04 * state.talent.deaths_embrace.rank
                end

                if FindUnitBuffByID( "player", 57933 ) then
                    mult = mult * 1.15
                end

                ns.saveDebuffModifier( spellID, mult )
                ns.trackDebuff( spellID, destGUID, GetTime(), true )
            end
        end
    end
end )

local aliasesSet = {}

spec:RegisterStateExpr( "soul_shards", function()
    return GetItemCount( 6265 )
end )

spec:RegisterHook( "reset_precast", function()
    if settings.solo_curse == "curse_of_doom" and target.time_to_die < 65 then
        class.abilities.solo_curse = class.abilities.curse_of_agony
    else
        class.abilities.solo_curse = class.abilities[ settings.solo_curse or "curse_of_agony" ]
    end

    if settings.group_curse == "curse_of_doom" and target.time_to_die < 65 then
        class.abilities.group_curse = class.abilities.curse_of_agony
    else
        class.abilities.group_curse = class.abilities[ settings.group_curse or "curse_of_the_elements" ]
    end

    if not aliasesSet.solo_curse then
        class.abilityList.solo_curse = "|cff00ccff[Solo Curse]|r"
        aliasesSet.solo_curse = true
    end

    if not aliasesSet.group_curse then
        class.abilityList.group_curse = "|cff00ccff[Group Curse]|r"
        aliasesSet.group_curse = true
    end

    soul_shards = nil

    if IsCurrentSpell( class.abilities.shadow_cleave.id ) then
        start_shadow_cleave()
        Hekili:Debug( "Starting Shadow cleave, next swing in %.2f...", buff.shadow_cleave.remains )
    end
end )

spec:RegisterStateExpr( "soul_shards", function()
    return GetItemCount( 6265 )
end )

spec:RegisterStateExpr( "curse_grouped", function()
    if settings.group_type == "party" and IsInGroup() then return true end
    if settings.group_type == "raid" and IsInRaid() then return true end
    return false
end )

spec:RegisterHook( "runHandler", function( action )
    if buff.empowered_imp.up and class.abilities[ action ].startsCombat then
        removeBuff( "empowered_imp" )
    end
end )

spec:RegisterStateExpr("inferno_enabled", function()
    return settings.inferno_enabled
end)


-- Abilities
spec:RegisterAbilities( {
    banish = {
        id = 710,
        cast = 1.5,
        cooldown = 0,
        gcd = "spell",

        spend = 0.08, 
        spendType = "mana",

        startsCombat = true,
        texture = 136135,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=710/banish"
        end,

    },


challenging_howl = {
        id = 59671,
        cast = 0,
        cooldown = 15,
        gcd = "spell",

        spend = 0,
        spendType = "rage",

        startsCombat = true,
        texture = 136088,

        buff = "metamorphosis",

        handler = function ()
            applyDebuff( "target", "challenging_howl" )
        end,
    }

chaos_bolt = {
        id = 50796,
        cast =  function()
            return ( 2.5 * haste)
        end,
        cooldown = function() return ( glyph.chaos_bolt.enabled and 10 or 12 ) - 0.1 * talent.bane.rank end,
        gcd = "spell",

        spend = function() return mod_cataclysm( 0.07 ) end,
        spendType = "mana",

        talent = "chaos_bolt",
        startsCombat = true,
        texture = 236291,

        handler = function ()
        end,
    }

conflagrate = {
        id = 17962,
        cast = 0,
        cooldown = 10,
        gcd = "spell",

        spend = function() return mod_cataclysm( 0.16 ) end,
        spendType = "mana",

        talent = "conflagrate",
        startsCombat = true,
        texture = 135807,

        debuff = function()
            return debuff.immolate.up and "immolate" or "shadowflame"
        end,

        handler = function ()
            if not glyph.conflagrate.enabled then
                if debuff.immolate.up then removeDebuff( "target", "immolate" )
                elseif debuff.shadowflame.up then removeDebuff( "target", "shadowflame" ) end
            end
            if talent.aftermath.rank == 2 then applyDebuff( "target", "aftermath" ) end
            if talent.backdraft.enabled then applyBuff( "backdraft", nil, 3 ) end
        end,
    }

    corruption = {
        id = 172,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.06, 
        spendType = "mana",

        startsCombat = true,
        texture = 136118,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=172/corruption"
        end,

    },


create_firestone = {
        id = 6366,
        cast = function()
            return ( 3 * haste)
        end,
        cooldown = 0,
        gcd = "spell",

        spend = 0.54,
        spendType = "mana",

        startsCombat = false,
        texture = 132386,

        handler = function ()
        end,

        copy = { 17951, 17952, 17953, 27250, 60219, 60220 }

    create_healthstone = {
        id = 6201,
        cast = 3,
        cooldown = 0,
        gcd = "spell",

        spend = 0.53, 
        spendType = "mana",

        startsCombat = true,
        texture = 135230,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6201/create-healthstone"
        end,

    },


    create_soulstone = {
        id = 693,
        cast = 3,
        cooldown = 0,
        gcd = "spell",

        spend = 0.68, 
        spendType = "mana",

        startsCombat = true,
        texture = 136210,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=693/create-soulstone"
        end,

    },


create_spellstone = {
        id = 2362,
        cast = function()
            return ( 5 * haste)
        end,
        cooldown = 0,
        gcd = "spell",

        spend = 0.45,
        spendType = "mana",

        startsCombat = false,
        texture = 134131,

        handler = function ()
        end,

        copy = { 17727, 17728, 28172, 47886, 47888 }

curse_of_agony = {
        id = 980,
        cast = 0,
        cooldown = 0,
        gcd = function() return talent.amplify_curse.enabled and "totem" or "spell" end,

        spend = function() return mod_suppression( 0.1 ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 136139,

        handler = function ()
            applyDebuff( "target", "curse_of_agony" )
        end,

        copy = { 1014, 6217, 11711, 11712, 11713, 27218, 47863, 47864 }

curse_of_doom = {
        id = 603,
        cast = 0,
        cooldown = 60,
        gcd = function() return talent.amplify_curse.enabled and "totem" or "spell" end,

        spend = function() return mod_suppression( 0.15 ) end,
        spendType = "mana",

        startsCombat = true,
        texture = 136122,

        usable = function() return target.time_to_die > 65, "target must survive long enough for curse_of_doom to expire" end,

        handler = function( rank )
            applyDebuff( "target", "curse_of_doom" )
        end,

        copy = { 30910, 47867 }

curse_of_exhaustion = {
        id = 18223,
        cast = 0,
        cooldown = 0,
        gcd = function() return talent.amplify_curse.enabled and "totem" or "spell" end,

        spend = function() return mod_suppression( 0.06 ) end,
        spendType = "mana",

        talent = "curse_of_exhaustion",
        startsCombat = true,
        texture = 136162,

        handler = function ()
            applyDebuff( "target", "curse_of_exhaustion" )
        end
    }

    curse_of_the_elements = {
        id = 1490,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.1, 
        spendType = "mana",

        startsCombat = true,
        texture = 136130,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=1490/curse-of-the-elements"
        end,

    },


    curse_of_tongues = {
        id = 1714,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.04, 
        spendType = "mana",

        startsCombat = true,
        texture = 136140,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=1714/curse-of-tongues"
        end,

    },


    curse_of_weakness = {
        id = 702,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.1, 
        spendType = "mana",

        startsCombat = true,
        texture = 136138,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=702/curse-of-weakness"
        end,

    },


dark_pact = {
        id = 59092,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        talent = "dark_pact",
        startsCombat = false,
        texture = 136141,

        pet_cost = {
            [18220] = 305,
            [18937] = 440,
            [18938] = 545,
            [27265] = 700,
            [59092] = 1200
        }

copy = { 755, 3698, 3699, 3700, 11693, 11694, 11695, 27259 }

    death_coil = {
        id = 6789,
        cast = 0,
        cooldown = 2,
        gcd = "spell",

        spend = 0.23, 
        spendType = "mana",

        startsCombat = true,
        texture = 136145,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6789/death-coil"
        end,

    },


    demon_armor = {
        id = 687,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        

        startsCombat = true,
        texture = 136185,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6229/shadow-ward"
        end,

    },


demon_charge = {
        id = 54785,
        cast = 0,
        cooldown = 45,
        gcd = "spell",

        startsCombat = true,
        texture = 132368,

        buff = "metamorphosis",

        usable = function() return target.distance > 8, "target must be out of range" end,

        handler = function ()
            setDistance( 7.5 )
        end,
    }

demon_skin = {
        id = 687,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.31,
        spendType = "mana",

        startsCombat = false,
        texture = 136185,
        essential = true,

        handler = function ()
            applyDebuff( "target", "demon_skin" )
        end,

        copy = { 696 }

    demonic_circle_summon = {
        id = 48018,
        cast = 500,
        cooldown = 0,
        gcd = "spell",

        spend = 0.15, 
        spendType = "mana",

        startsCombat = true,
        texture = 237559,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=48018/demonic-circle-summon"
        end,

    },


    demonic_circle_teleport = {
        id = 48020,
        cast = 0,
        cooldown = 30,
        gcd = "spell",

        spend = 100, 
        spendType = "mana",

        startsCombat = true,
        texture = 237560,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=48020/demonic-circle-teleport"
        end,

    },


demonic_empowerment = {
        id = 47193,
        cast = 0,
        cooldown = function() return 60 * ( 1 - ( 0.1 * talent.nemesis.rank ) ) end,
        gcd = "off",

        spend = 0.06,
        spendType = "mana",

        talent = "demonic_empowerment",
        startsCombat = false,
        texture = 236292,

        toggle = "cooldowns",

        usable = function() return pet.up, "requires pet" end,

        handler = function ()
            applyBuff( "demonic_empowerment" )
        end,
    }

detect_invisibility = {
        id = 132,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.02,
        spendType = "mana",

        startsCombat = false,
        texture = 136153,

        handler = function ()
            applyBuff( "detect_invisibility" )
        end
    }

    drain_life = {
        id = 89420,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 136169,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=89420/drain-life"
        end,

    },
    drain_life = {
        id = 689,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 136169,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=689/drain-life"
        end,

    },


drain_mana = {
        id = 5138,
        cast = function() return ( 5 * haste) end,
        cooldown = 0,
        gcd = "spell",
		channeled = true,
        breakable = true,
        spend = function() return mod_suppression( 0.17 ) end,
        spendType = "mana",
        startsCombat = true,
        texture = 136208,
        aura = "drain_mana",
		tick_time = function () return class.auras.drain_mana.tick_time end,
        start = function( rank )
            applyDebuff( "target", "drain_mana" )
        end,

		tick = function () end,
		breakchannel = function ()
		   removeDebuff( "target", "drain_mana" )
        end,
		handler = function ()
        end,
    }

    drain_soul = {
        id = 1120,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.14, 
        spendType = "mana",

        startsCombat = true,
        texture = 136163,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=1120/drain-soul"
        end,

    },


    eye_of_kilrogg = {
        id = 126,
        cast = 5,
        cooldown = 0,
        gcd = "spell",

        spend = 0.04, 
        spendType = "mana",

        startsCombat = true,
        texture = 136155,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=126/eye-of-kilrogg"
        end,

    },


    fear = {
        id = 5782,
        cast = 1.7,
        cooldown = 0,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 136183,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5782/fear"
        end,

    },


    fel_armor = {
        id = 28176,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        

        startsCombat = true,
        texture = 136156,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6229/shadow-ward"
        end,

    },


fel_domination = {
        id = 18708,
        cast = 0,
        cooldown = function() return 180 * ( 1 - ( 0.1 * talent.nemesis.rank ) ) end,
        gcd = "off",

        talent = "fel_domination",
        startsCombat = false,
        texture = 136082,

        usable = function() return not pet.alive, "not used with an active pet" end,

        handler = function ()
            applyBuff( "fel_domination" )
        end
    }

haunt = {
        id = 48181,
        cast = function()
            return ( 1.5 * haste)
        end,

        cooldown = 8,
        gcd = "spell",

        spend = 0.12,
        spendType = "mana",

		velocity = 6,
		impact = function() end,

        talent = "haunt",
        startsCombat = true,
        texture = 236298,

        handler = function ()
            applyDebuff( "target", "haunt" )
            if talent.shadow_embrace.enabled then applyDebuff( "target", "shadow_embrace", nil, debuff.shadow_embrace.stack + 1 ) end
            if talent.everlasting_affliction.rank == 5 and dot.corruption.ticking then dot.corruption.expires = query_time + dot.corruption.duration end
        end,
    }

    health_funnel = {
        id = 755,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        

        startsCombat = true,
        texture = 136168,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=755/health-funnel"
        end,

    },


    hellfire = {
        id = 85403,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.64, 
        spendType = "mana",

        startsCombat = true,
        texture = 135818,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5857/hellfire"
        end,

    },
    hellfire = {
        id = 1949,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.64, 
        spendType = "mana",

        startsCombat = true,
        texture = 135818,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5857/hellfire"
        end,

    },


    howl_of_terror = {
        id = 5484,
        cast = 1.5,
        cooldown = 40,
        gcd = "spell",

        spend = 0.08, 
        spendType = "mana",

        startsCombat = true,
        texture = 136147,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5484/howl-of-terror"
        end,

    },


    immolate = {
        id = 348,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.08, 
        spendType = "mana",

        startsCombat = true,
        texture = 135817,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=348/immolate"
        end,

    },


    immolation_aura = {
        id = 50589,
        cast = 0,
        cooldown = 30,
        gcd = "spell",

        spend = 0.64, 
        spendType = "mana",

        startsCombat = true,
        texture = 135818,

        --fix:
        stance = "Metamorphosis",
        handler = function()
            --"/cata/spell=50590/immolation"
        end,

    },


    incinerate = {
        id = 29722,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.14, 
        spendType = "mana",

        startsCombat = true,
        texture = 135789,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=29722/incinerate"
        end,

    },


    life_tap = {
        id = 1454,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        

        startsCombat = true,
        texture = 136126,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=1454/life-tap"
        end,

    },


metamorphosis = {
        id = 47241,
        cast = 0,
        cooldown = function() return 180 * ( 1 - ( 0.1 * talent.nemesis.rank ) ) end,
        gcd = "off",

        startsCombat = false,
        texture = 237558,

        toggle = "cooldowns",

        handler = function ()
            applyBuff( "metamorphosis" )
        end,
    }

    rain_of_fire = {
        id = 5740,
        cast = Channeled,
        cooldown = 0,
        gcd = "spell",

        spend = 0.57, 
        spendType = "mana",

        startsCombat = true,
        texture = 136186,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=42223/rain-of-fire"
        end,

    },


    ritual_of_souls = {
        id = 29893,
        cast = Channeled,
        cooldown = 5,
        gcd = "spell",

        spend = 0.27, 
        spendType = "mana",

        startsCombat = true,
        texture = 136194,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=29893/ritual-of-souls"
        end,

    },


    ritual_of_summoning = {
        id = 698,
        cast = Channeled,
        cooldown = 2,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 136223,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=698/ritual-of-summoning"
        end,

    },


    searing_pain = {
        id = 5676,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 135827,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5676/searing-pain"
        end,

    },


    seed_of_corruption = {
        id = 27243,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.34, 
        spendType = "mana",

        startsCombat = true,
        texture = 136193,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=27243/seed-of-corruption"
        end,

    },


sense_demons = {
        id = 5500,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        startsCombat = true,
        texture = 136172,

        handler = function ()
        end,
    }

    shadow_bolt = {
        id = 686,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.1, 
        spendType = "mana",

        startsCombat = true,
        texture = 136197,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=686/shadow-bolt"
        end,

    },


shadow_cleave = {
        id = 50581,
        cast = 0,
        cooldown = 6,
        gcd = "off",

        spend = 0.04,
        spendType = "mana",

        startsCombat = true,
        texture = 132332,

        buff = "metamorphosis",
        nobuff = "shadow_cleave",

        usable = function() return target.distance < 10, "must be in melee range" end,

        handler = function ()
            start_shadow_cleave()
        end,
    }

    shadow_ward = {
        id = 6229,
        cast = 0,
        cooldown = 30,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 136121,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6229/shadow-ward"
        end,

    },


shadowburn = {
        id = 47827,
        cast = 0,
        cooldown = 15,
        gcd = "spell",

        spend = function() return mod_cataclysm( 0.2 ) end,
        spendType = "mana",

        talent = "shadowburn",
        startsCombat = true,
        texture = 136191,

        usable = function() return soul_shards > 0, "requires a soul_shard" end,

        handler = function ()
            applyDebuff( "target", "shadowburn" )
            soul_shards = max( 0, soul_shards - 1 )
        end,

        copy = { 17877, 18867, 18868, 18869, 18870, 18871, 27263, 30546, 47826 }

    shadowflame = {
        id = 47897,
        cast = 0,
        cooldown = 12,
        gcd = "spell",

        spend = 0.25, 
        spendType = "mana",

        startsCombat = true,
        texture = 236302,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=47897/shadowflame"
        end,

    },
    shadowflame = {
        id = 47960,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 236302,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=47960/shadowflame"
        end,

    },


shadowfury = {
        id = 30283,
        cast = 0,
        cooldown = 20,
        gcd = 500,

        spend = function() return mod_cataclysm( 0.27 ) end,
        spendType = "mana",

        talent = "shadowfury",
        startsCombat = true,
        texture = 136201,

        handler = function ()
            applyDebuff( "target", "shadowfury" )
        end,
    }

    soul_fire = {
        id = 6353,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.09, 
        spendType = "mana",

        startsCombat = true,
        texture = 135808,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=6353/soul-fire"
        end,

    },


soul_link = {
        id = 19028,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.16,
        spendType = "mana",

        talent = "soul_link",
        startsCombat = false,
        texture = 136160,

        nobuff = "soul_link",

        usable = function() return pet.alive, "requires a pet" end,

        handler = function()
            applyBuff( "soul_link" )
        end
    }

    soulshatter = {
        id = 29858,
        cast = 0,
        cooldown = 2,
        gcd = "spell",

        spend = 0.08, 
        spendType = "health",

        startsCombat = true,
        texture = 135728,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=29858/soulshatter"
        end,

    },


    subjugate_demon = {
        id = 1098,
        cast = 3,
        cooldown = 0,
        gcd = "spell",

        spend = 0.27, 
        spendType = "mana",

        startsCombat = true,
        texture = 136154,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=1098/subjugate-demon"
        end,

    },


summon_felguard = {
        id = 30146,
        cast = function() return 10 - ( 2 * talent.master_summoner.rank ) - ( buff.fel_domination.up and 5.5 or 0 ) end,
        cooldown = 0,
        gcd = "spell",

        spend = function() return 0.8 * ( buff.fel_domination.up and 0.5 or 1 ) * ( 1 - 0.2 * talent.master_summoner.rank ) end,
        spendType = "mana",

        talent = "summon_felguard",
        startsCombat = false,
        texture = 136216,
        essential = true,

        usable = function() return soul_shards > 0, "requires a soul_shard" end,

        handler = function()
            dismissPet( "imp" )
            dismissPet( "voidwalker" )
            dismissPet( "felhunter" )
            dismissPet( "succubus" )
            summonPet( "felguard" )
			dismissPet( "infernal" )
            soul_shards = max( 0, soul_shards - 1 )
        end
    }

inferno = {
        id = 1122,
        cast = function() return (1.5 * haste) end,
        cooldown = 600,
        gcd = "spell",

        spend = function() return 0.8 * ( buff.fel_domination.up and 0.5 or 1 ) * ( 1 - 0.2 * talent.master_summoner.rank ) end,
        spendType = "mana",
		toggle = "cooldown",
        startsCombat = false,
        texture = 136219,
        essential = true,

        handler = function()
            dismissPet( "imp" )
            dismissPet( "voidwalker" )
            dismissPet( "felhunter" )
            dismissPet( "succubus" )
            dismissPet( "felguard" )
			summonPet( "infernal" )
        end
    }

    summon_felhunter = {
        id = 691,
        cast = 6,
        cooldown = 0,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 136217,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=691/summon-felhunter"
        end,

    },


    summon_imp = {
        id = 688,
        cast = 6,
        cooldown = 0,
        gcd = "spell",

        spend = 0.64, 
        spendType = "mana",

        startsCombat = true,
        texture = 136218,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=688/summon-imp"
        end,

    },


    summon_incubus = {
        id = 713,
        cast = 6,
        cooldown = 0,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 4352492,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=713/summon-incubus"
        end,

    },


    summon_succubus = {
        id = 712,
        cast = 6,
        cooldown = 0,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 136220,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=712/summon-succubus"
        end,

    },


    summon_voidwalker = {
        id = 697,
        cast = 6,
        cooldown = 0,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 136221,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=697/summon-voidwalker"
        end,

    },


    unending_breath = {
        id = 5697,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.02, 
        spendType = "mana",

        startsCombat = true,
        texture = 136148,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5697/unending-breath"
        end,

    },


unstable_affliction = {
        id = 47843,
        cast = function()
            return ( glyph.unstable_affliction.enabled and 1.3 or 1.5 ) * haste
        end,
        cooldown = 0,
        gcd = "spell",

        spend = 0.15,
        spendType = "mana",

        talent = "unstable_affliction",
        startsCombat = true,
        texture = 136228,

		cycle = "unstable_affliction",
        handler = function ()
            removeDebuff( "target", "immolate" )
            applyDebuff( "target", "unstable_affliction" )
        end,

        copy = { 30108, 30404, 30405, 47841 }

    bane_of_doom = {
        id = 603,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.15, 
        spendType = "mana",

        startsCombat = true,
        texture = 136122,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=603/bane-of-doom"
        end,

    },


    bane_of_agony = {
        id = 980,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.1, 
        spendType = "mana",

        startsCombat = true,
        texture = 136139,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=980/bane-of-agony"
        end,

    },


    dark_intent = {
        id = 80398,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.06, 
        spendType = "mana",

        startsCombat = true,
        texture = 463285,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=85767/dark-intent"
        end,

    },


    shadow_mastery = {
        id = 87339,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 136215,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=87339/shadow-mastery"
        end,

    },


    soul_swap_exhale = {
        id = 86213,
        cast = 0,
        cooldown = 0,
        gcd = "totem",

        spend = 0.06, 
        spendType = "mana",

        startsCombat = true,
        texture = 132291,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=86213/soul-swap-exhale"
        end,

    },


    amplify_curse = {
        id = 84741,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 136137,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=87389/corruption"
        end,

    },


    soulburn = {
        id = 74434,
        cast = 0,
        cooldown = 45,
        gcd = "off",

        spend = 1, 
        spendType = "shards",

        startsCombat = true,
        texture = 463286,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=358742/drain-life"
        end,

    },


    demon_soul = {
        id = 77801,
        cast = 0,
        cooldown = 2,
        gcd = "off",

        spend = 0.15, 
        spendType = "mana",

        startsCombat = true,
        texture = 463284,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=77801/demon-soul"
        end,

    },


    summon_doomguard = {
        id = 18540,
        cast = 0,
        cooldown = 10,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 236418,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=60478/summon-doomguard"
        end,

    },


    demon_leap = {
        id = 54785,
        cast = 0,
        cooldown = 45,
        gcd = "spell",

        

        startsCombat = true,
        texture = 132368,

        --fix:
        stance = "Metamorphosis",
        handler = function()
            --"/cata/spell=54786/demon-leap"
        end,

    },
    demon_leap = {
        id = 54786,
        cast = 0,
        cooldown = 45,
        gcd = "spell",

        

        startsCombat = true,
        texture = 132368,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=54786/demon-leap"
        end,

    },


    demonic_knowledge = {
        id = 84740,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 425957,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=84740/demonic-knowledge"
        end,

    },


    dreadsteed = {
        id = 23161,
        cast = 1.5,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 132238,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=23161/dreadsteed"
        end,

    },


    soul_harvest = {
        id = 79268,
        cast = Channeled,
        cooldown = 30,
        gcd = "spell",

        

        startsCombat = true,
        texture = 236223,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=79268/soul-harvest"
        end,

    },


    summon_infernal = {
        id = 1122,
        cast = 1.5,
        cooldown = 10,
        gcd = "spell",

        spend = 0.8, 
        spendType = "mana",

        startsCombat = true,
        texture = 136219,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=22703/infernal-awakening"
        end,

    },


    felsteed = {
        id = 5784,
        cast = 1.5,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 136103,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=5784/felsteed"
        end,

    },


    immolation = {
        id = 50590,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 135818,

        --fix:
        stance = "Metamorphosis",
        handler = function()
            --"/cata/spell=50590/immolation"
        end,

    },


    demonic_rebirth = {
        id = 88448,
        cast = 0,
        cooldown = 3,
        gcd = "off",

        

        startsCombat = true,
        texture = 136082,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=79623/summon-imp"
        end,

    },


    infernal_awakening = {
        id = 22703,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 135860,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=22703/infernal-awakening"
        end,

    },


    suppression = {
        id = 87330,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 136154,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=87330/suppression"
        end,

    },


    fel_flame = {
        id = 77799,
        cast = 0,
        cooldown = 0,
        gcd = "spell",

        spend = 0.06, 
        spendType = "mana",

        startsCombat = true,
        texture = 135795,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=77799/fel-flame"
        end,

    },


    cataclysm = {
        id = 84739,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 135821,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=84739/cataclysm"
        end,

    },


    nether_ward = {
        id = 91711,
        cast = 0,
        cooldown = 30,
        gcd = "spell",

        spend = 0.12, 
        spendType = "mana",

        startsCombat = true,
        texture = 135796,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=91711/nether-ward"
        end,

    },


    demonic_immolate = {
        id = 75445,
        cast = 0,
        cooldown = 0,
        gcd = "off",

        

        startsCombat = true,
        texture = 135817,

        --fix:
        stance = "None",
        handler = function()
            --"/cata/spell=54090/area-despawn"
        end,

    },
local curses = {}

spec:RegisterSetting( "solo_curse", "curse_of_agony", {
    type = "select",
    name = "Preferred Curse when Solo",
    desc = "Select the Curse you'd like to use when playing solo.  It is referenced as |cff00ccff[Solo Curse]|r in your priority.\n\n"
        .. "If Curse of Doom is selected and your target is expected to die in fewer than 65 seconds, Curse of Agony will be used instead.",
    width = "full",
    values = function()
        table.wipe( curses )

        curses.curse_of_agony = class.abilityList.curse_of_agony
        curses.curse_of_the_elements = class.abilityList.curse_of_the_elements
        curses.curse_of_doom = class.abilityList.curse_of_doom
        curses.curse_of_exhaustion = class.abilityList.curse_of_exhaustion
        curses.curse_of_tongues = class.abilityList.curse_of_tongues
        curses.curse_of_weakness = class.abilityList.curse_of_weakness

        return curses
    end,
    set = function( _, val )
        Hekili.DB.profile.specs[ 9 ].settings.solo_curse = val
        class.abilities.solo_curse = class.abilities[ val ]
    end,
} )

spec:RegisterSetting( "group_curse", "curse_of_the_elements", {
    type = "select",
    name = "Preferred Curse when Grouped",
    desc = "Select the Curse you'd like to use when playing in a group.  It is referenced as |cff00ccff[Group Curse]|r in your priority.\n\n"
        .. "If Curse of Doom is selected and your target is expected to die in fewer than 65 seconds, Curse of Agony will be used instead.",
    width = "full",
    values = function()
        table.wipe( curses )

        curses.curse_of_agony = class.abilityList.curse_of_agony
        curses.curse_of_the_elements = class.abilityList.curse_of_the_elements
        curses.curse_of_doom = class.abilityList.curse_of_doom
        curses.curse_of_exhaustion = class.abilityList.curse_of_exhaustion
        curses.curse_of_tongues = class.abilityList.curse_of_tongues
        curses.curse_of_weakness = class.abilityList.curse_of_weakness

        return curses
    end,
    set = function( _, val )
        Hekili.DB.profile.specs[ 9 ].settings.group_curse = val
        class.abilities.group_curse = class.abilities[ val ]
    end,
} )

spec:RegisterSetting("inferno_enabled", false, {
    type = "toggle",
    name = "Inferno: Enabled?",
    desc = "Select whether or not Inferno should be used",
    width = "full",
    set = function( _, val )
        Hekili.DB.profile.specs[ 9 ].settings.inferno_enabled = val
    end
})

spec:RegisterSetting( "group_type", "party", {
    type = "select",
    name = "Group Type for Group Curse",
    desc = "Select the type of group that is required before the addon recommends your |cff00ccff[Group Curse]|r rather than |cff00ccff[Solo Curse]|r.\n\n" ..
        "Selecting " .. PARTY .. " will work for a 5 person group.  Selecting " .. RAID .. " will work for any larger group.\n\n" ..
        "In default priorities, |cffffd100curse_grouped|r will be |cffffd100true|r when this condition is met.  Custom priorities may ignore this setting.",
    width = "full",
    values = {
        party = PARTY,
        raid = RAID
    }
} )

spec:RegisterSetting( "shadow_mastery", true, {
    type = "toggle",
    name = "Handle Improved Shadow Bolt (Shadow Mastery)",
    desc = "Ensure this setting is |cFF00FF00enabled|r if Improved Shadow Bolt is talented, you are in a group, and you are responsible for maintaining the Shadow Mastery debuff on your target.\n\n"
        .. "If someone else is assigned, you can |cFFFF0000disable|r this setting to remove some Shadow Bolt casts from the default priority.",
    width = "full"
} )


spec:RegisterOptions( {
    enabled = true,

    aoe = 3,

    gcd = 687,

    nameplates = false,
    nameplateRange = 8,

    damage = true,
    damageExpiration = 6,

    potion = "wild_magic",

    package = "Affliction",
    usePackSelector = true
} )

spec:RegisterPack( "Affliction", 20230226, [[Hekili:DRvwVrkoq4FlJgj0UkjmaD6CSIULM9HvAYoA0kX8mGdTjTv4sG7otl1IF7BzmnymMJC0AL2xMjbB)vhUQVQCP4A6(txNnik29hwgwlmSSUv3000WWY1HEid76KHcEg9e8djOy4F)AyyejGsstylDikfTHbrr6U8ayzxNh3rIOFlX9r14A66G2r3MM7683KO0axNTKnBW89JlGFNT)RmSUY62)O0)Vi)Q0)7KqCP)przL(rPprck9PPL(jP0s)CCyoUyBP)lFb(0trhYGFgb63ESURtePGwWuViab4))rL5IQv)nyeDRxqkjY1bNGEmcVX9pDPGg3zx5isIxfaD2fLbqiAxeTb42LDcYjuCobXXzp2dNGJj4Is)vL(ML(AGnGYFct13Irr0T6zbG1SU036MwrNVlXJ)ZEmlHBpE87HcAJMolXAx6FDLyLxy9hJ(GsXmfAXSvia7fFaYTadcce81dkyf4BpF8X)chSJwzBlhueYyVCEyxfuvfjLLJdsJFePmw6euH4ipuEml1HLPKtY4F)R)Z3l93Vq)ADZRm1VrFzP)Nf1Uh3fgQxDq9nPVKu6F8yPVWhZXXqiopgX8oJXJR(uPFg4n53Mv3FCfVkW2Ovzl2fhd2mOZB3LaND8GJxjQ7tjBEbf9mh2HV6FLWsIZg)EUIFrNDT5rrz617Pc4k)zZkm)Cl8N(md8Be5wYs5)Fh2NBhjsocNq1b1mpDpEJxXweiiVhtJOD0LcmLssEQqVEdXOcaHdvRTbxPPDxrsFfWLhEEkjqMbvP(3H9Cxb2du)4cPnnCOWMuQ(UKckBjput1MorPbGA7rjX87u2j2IGOS29SUZEUaizYr7H0NMFpcknLeWDjSp6rt92qG1wZ4NfYFvOktgZrjbpd(FEIMcTZE1mvVw1OcHXdoLfCgoVa4AGigVyOkfjlIGZRCnmvkinpFxfbIEw7YTcSD9MOw1xx84P4dEb7YlW1mmQ8QwxlGoBVEPHEONstomEuFmkb1qTAAWnUzNjkg2SuDk5DdNWjAdmPlycBpWCWzq5hGFpahHZrN8w3ZaKWy9yUqpsidPGNlwVYu736fpyVQjw4cH4GlQJboECImc7vCvs5EAHUgoT6YHcMgOwlbPO4Iu5MTU(3L7oc6(lQx3rSocgTZOZ(fRCvmfX2obhcIyhGzNfmTfuRF519RoMQZZurKngVX8e2IHfMmRZaPtVB5itY0LfAEWpIptMnrvW0K9VTuHEmkpIeRxt8tDfKrR5uVNU(5EllrZROzBqXxmsD2IjElHif)G1YpBfbgUPWUC9L(3BmlEYXBc49usFYluBz06vX9Su4FM2WBUUF7ZPKVsmxEMDmJ0IGYuJj1eypc0gVPwhu5lynFDJrf8TfGyp4K)nssiopj17eEnYTEHXByqvr0Xu97)VR4OPbt29ixDDSfFASYo8nhMHQgVnaNdkjOURjdzkVWi27FzincNYz7XodhRBne38pmxi(QgXfLB7PAGeJYI)k9rd1fdtqSGPoDZ0ie5kpnJBrmNsvb0HjLp3HKvUV9ScwWc1Jn04oxNxq5jSByxNVfNLMtzWFlV2Ak8wJQH8Px(a4rYWbSCkhiKjKeHDD(CPVQPJu(a)Wf6ndE5IvFPz(kxscxjn0KJh7pWeBZ7muJK8Wpya(P2jrOX34QXpD7qoEthhsCEDN70nb7uQVv16pKd1qXzngq9AZDysAgP5AdKIRn8SmkFOr4GiLMb3LSPVTQOs8DttG3N1JqCT1ntIf8uN(GzFTw3pS(nIolrVp8Rx82qREwoCFV05TNX5zx)SdlEQLc(B9c2TClPuvqynJZa3y1RE8OYUvxpCNQscDGwnRmvHxWEVH05u0gc7m96Bz9OpuxBQ3P37T4YQptwIUl(t)7oSGrvH5zxn3gkEDV5Y3Tz0TlhLoYPKH2jvuc66EWeIDf0D7v3yODQg1AldnPw5MwnvnkRUhsKJ8KOSnnoECweMN8GlLqLtxEzV0XvI5J8Tk0BGGx4uReGQOC)Nr22(rfwdRcI0e18qkQw0UsZ0JvU4WzTZk8v71MFlnYmv60SsHhFEFQGvnB67HVua7zLhOjncqvi9HNCi4xNfZUTPs9QDSsxkou2v))AMSDkbdoQxjzr9j69MIl78gHvMkBerbDnhVpSqIwKHET(ibUlSJy39gXj3x0305iPIDAAixmgKszQVt04uvtdYOwPqQLItPO)YEECPcuQhs7K9lm8Wz7ZYl1vU9cXOlwicZUA(tdP)sT)9GWEWQ7)c]] )

spec:RegisterPack( "Demonology (wowtbc.gg)", 20230625, [[Hekili:TI12UTnoq0VLIcySlAI8LCTfj5HfDxGMTBEXfOVjjAkkjctjkqsfddeOV9DiPUqjl54K2xILiN5mdN5Wzgf)L()WFDesr8FA1IvxS46vx5T8QfxV8w)1Q9fe)1fi8wuc8qokd(7xjz8CoJNSVk8p2X3P2G9ss(tTC7zCuKgpjVuGbztvQc5xMpVvm4jfB7CmdjLNNusJiY5rTaE(oKGXXBN7VEtjLP(wU)MHohaEbb7)0Nb0PrreRiej2F9psPYQWcbLlOkW72HGx3bpRi5vHBqssuvihEuLsGnA8PQWFkqQuyR46T(ofdV(V0CypJt6v9y1JAp48fRoF1nFPkSk8VZLLcqyfsKquaEugRkKrFgwJXZticnAOgZHrsqifntB6uTdjiyEwgjpYyN18sq9)HkCn21NV6kJX(p0wIRmaEPe82QWyoyMVsW0mKIQpBBkJHJH(a54aigjx55VMrLkPobH4e4NNmjFsoAdJe5)x(RXqWIiOiqaScojbKCsgLaHXhQcVWUkp3FDgrHY4IIuUKk9vq2zsG(qvyzrNM0SmoZ4QbOsbsR7fVtNqMII47IzAwjaZLVxyiKOaECaMleLfM1a0UAaAns7iv)dPII3AsKZQchAW7QcVeeFpMrcS0fPo2dM56jmtDyI87Wik99Jyujt1MYBmJ5QhfhqYk47icGmQCDNMeBJ4fC7V9Ky603ah26uE6RabkEqeLysfrCLxZX1lc4ewBCqK4OP4iIM37LTpaxkKao8D5gJAEnirWllaDAr1SGv2XY2hhyhUdu2QdLHjZ3tKOJFnsSOpf9MjnxmnjvfiiziAULVVA5IQWxEbkpWLsJpmqgn7zXrUGFRlpOecPGTYKdOcFEspYgeDb1RSWnwebvMq5yBG42bm0aCQwkTjwU4xOsZY3u9ULq(vjOyTIo5aeJfyFjqxo1wunW2Buxwvl(0LdRlftZke8NHcp2IybB4mLxTcMWsnVRE7mO5brS3ZnDPBOey7N8jibpSUObsJZm9f0e2(IupgnwxXOON9nwVDN(S(MLnOFPlXOpTPp5y50xYmglQTj2aQXWRjThC37HLSGyOVOXqtFp0sdHadjxxVN41JWKJP5erDTML34EWCJP9owWRfMg5BqQJ3r1yBKacpdcNXeGqPx)vBKwardlr1XZkZ03qaqskrIOxTI8rW4zonAhITLioEX2JJcqTpEj1FdSURF1UstxC8eUbooXYKSFMiK6DCMhfgAnhQSd89VbTrfk9z5cB)z9azMzUGz60efEmLbrSp(r9mBDJr)t7yVvpQ3y1vvHpwMdCDTj0ZcArs61s0(09ZBjnNrJVFa1ACngqu069HU04r1PJy8w0cIWNK4njwTWJZnMDiVyCOSuHj8QMuP2oNajWjYdApYKsUBpWWWknZTycb1n)NDyfThgD8hxGCgvrJ1ydKmR3uoUk3nGYu66kD38fNIxpYOkUG1RxGgVEtC8amrYlVONgzwV1V7YfUG0oPXb5I6zcAP)dhUy2GblE42rYo06HdmhxORJBSyqF(Z0D4VhAWFMDOG7xQvYYRBgB4HL9I9DCQtKYn7OD9VRTX3Nw5ANFT7pdZu9zpoxzoSj9yeJUPsCJ2TDw7sx9AcpryZT4he5hJunibCXqfELeDTuoFk5Pa6HFY4POLJ09(knltQ92wFyU7YjorK3eiqhTsvkmIX62)ThM(z())d]] )

spec:RegisterPack( "Destruction", 20230204, [[Hekili:1EvBloUnq4FlhhKV09CTDYMBlKeOh9d92wwkK(zBRylNiwzlJS8EeWOF7DKKF3YjPuklSjXAMNzMN5n5aVG)o4ycsGdEZ31FTRV7ghp3nF175GJIRf4GJfO43rNHVKJYG))B4sbVkwqy5QZUszOefgLSkEmCEWXtveQ475bNSd8Aq2cCCWB)sWXlKKeSrsCz8iWLr)aXPS43LrfCcJtexLrPmUm63XVtOKGJusPOuzAkjfdF(MowqnUwcgjUegZi0GJ4C0jkoj4BbcWBgjfhrYd1amskHcGuufv0bC)XhJbVbZjidoFGdX54mcUugTtg53JoVkp089qLZAC5qdpwk6CMhc5dYiVhdzedRGE9IqFbJOIlofXcJd)8JHRML0utbhhZYoHSsoTqLIPHiEgJBsUCsH55)6F9NYOpw7SXX9lEW)9LrFEO3DQkn1rROtc7hqDqDTmAWd54miNz4AVxCVnl(jO6blCmKzVVvwLLbHijR42m1z61IloQapuGkCAKrgTQXJ6or5P9W3(yf4BgwUvWmFoPutLXUbtwEbb4Ns1zHBwHSw7Ace)me0jqQdLhJnmLlO61yQYVuNwQmNfQRZMyCsilfAG48QMm3dyAGVfK43j5NTBUPuDR5iq(GQgwmo3DtS2SawdDzkjhhgNeCCRfmgyRm2hk7OZgL3PNpbRZ9zxdJR4L4MQui41)m8mNvva607p6hdCP4cqzuCgohS)9kBBcDt5Fct40srJBaSqHT0CpFKd1oN5A6D0OWPm4TJrlre6ml)QcPN))SfA7OO5cIvgEIbtMhhmF9FfB2xKmIp9TwgbO)Y9AJH1zdKOc4hW8zLtecAdxYlB6AfKmiWzHjevJ7Ez0wxnzLHYrMr2qZMV5zK8umpNf2rQQORbNjd53yvJbvpMd0(4sZHSplOP1zyRMcKLlUnkmjOax8fxtam6HQ5w2Qj8gvItYJbRBPc3B5sCB89Ho6(bBasySmTDwUbWAETZol4fRDVr3MEk1hyEP6yZTR88HjbWfMYbMfQ5(EwbJluveplJm4iJ03xYr(QA)nlLqbU6ZYiBRJLVA0P0PBt)pT)N7wO)ejD)KT011Z3qVd2oBhP(1VkO(u)gA7I3M3vcBFCYQ5JsSdLPZv(QmQ5VwPGZMC3NNu36zp8jy1X7725Fx1Gn6Z17G3D1tfckf77E35)CVZA7BTHzPk(0lFmLSkySvfVA0AQj63UerNxAgAwxBB9ZoVjQoynZKtkzu2T9Pjk8FmHBCNU9eZ8Z2PyZdY5BfgKRnQ3wbn6HDJ7NsNMPQkdnVrF3(TURAh2DW3D1KHZ11ZgLVBZmPwo6AgiVFRY8ndDxMNnc05p7EXTUU7hEUluV1p4DQFmCcP94)ae(pqXW4XFlqLauwmWAy(tpAqpPQyS)Y0pn6gH79S0XUE1KltROIPio7QYpeWTvEtHRRf0cilPJ1SUf9BRc61xvcaa0)2YZpAWRiJQexuVq3FqG3m)lFdcMeIwA9oPG)5d]] )


spec:RegisterPackSelector( "affliction", "Affliction", "|T136145:0|t Affliction",
    "If you have spent more points in |T136145:0|t Affliction than in any other tree, this priority will be automatically selected for you.",
    function( tab1, tab2, tab3 )
        return tab1 > max( tab2, tab3 )
    end )

spec:RegisterPackSelector( "demonology", "Demonology (wowtbc.gg)", "|T136172:0|t Demonology",
    "If you have spent more points in |T136172:0|t Demonology than in any other tree, this priority will be automatically selected for you.",
    function( tab1, tab2, tab3 )
        return tab2 > max( tab1, tab3 )
    end )

spec:RegisterPackSelector( "destruction", "Destruction", "|T136186:0|t Destruction",
    "If you have spent more points in |T136186:0|t Destruction than in any other tree, this priority will be automatically selected for you.",
    function( tab1, tab2, tab3 )
        return tab3 > max( tab1, tab2 )
    end )
