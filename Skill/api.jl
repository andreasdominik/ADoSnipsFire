#
# API function goes here, to be called by the
# skill-actions:
#

ADB = "$(Snips.getAppDir())/Skill/fire.sh"






function amazonON()
    adbCmds("wake")
end

function amazonOFF()
    adbCmds("sleep")
end

function amazonARD()
    adbCmds("ard")
end

function amazonZDF()
    adbCmds("zdf")
end




function adbCmds(cmds)

    return tryrun(`$ADB $(split(cmds))`, errorMsg =
    """An error occured while sending commands $cmds
    to Amazon fire."""
end
