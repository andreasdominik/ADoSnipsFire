
# language settings:
# 1) set LANG to "en", "de", "fr", etc.
# 2) link the Dict with messages to the version with
#    desired language as defined in languages.jl:
#

const LANG = Snips.getIniLanguage() != nothing ? Snips.getIniLanguage() : "de"

# DO NOT CHANGE THE FOLLOWING 3 LINES UNLESS YOU KNOW
# WHAT YOU ARE DOING!
# set CONTINUE_WO_HOTWORD to true to be able to chain
# commands without need of a hotword in between:
#
const CONTINUE_WO_HOTWORD = true
const DEVELOPER_NAME = "andreasdominik"


# Slots:
# Name of slots to be extracted from intents:
#
## const SLOT_ROOM = "room"
## const SLOT_DEVICE = "device"
## const SLOT_ON_OFF = "on_or_off"

# name of entry in config.ini:
#
const INI_MY_NAME = my_name

#
# link between actions and intents:
# intent is linked to action{Funktion}
# the action is only matched, if
#   * intentname matches and
#   * if the siteId matches, if site is  defined in config.ini
#     (such as: "switch TV in room abc").
#
INTENT_ACTIONS_DE = Dict{String, Function}()
INTENT_ACTIONS_DE["ADoSnipsTemplateDE"] = templateAction

INTENT_ACTIONS_EN = Dict{String, Function}()
INTENT_ACTIONS_EN["ADoSnipsTemplateEN"] = templateAction



# Language-dependent settings:
#
if LANG == "de"
    INTENT_ACTIONS = INTENT_ACTIONS_DE
    TEXTS = TEXTS_DE
elseif LANG == "en"
    INTENT_ACTIONS = INTENT_ACTIONS_EN
    TEXTS = TEXTS_EN
else
    INTENT_ACTIONS = INTENT_ACTIONS_DE
    TEXTS = TEXTS_DE
end
