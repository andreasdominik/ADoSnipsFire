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

function goHome()
    adbCmds("home")
end




function adbCmds(cmd)

    ip = Snips.getConfig(INI_FIRE_IP)
    return Snips.tryrun(`$ADB $ip $cmd`, errorMsg =
                        """An error occured while sending commands $cmds
                        to Amazon fire.""")
end





function tvON()

    trigger = Dict(:room => Snips.getSiteId(),
                   :device => Snips.getConfig(INI_TV),
                   :commands => ["wakeup"],
                   :delay => 0.5
                   )

    Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
end


function tvOFF()

    trigger = Dict(:room => Snips.getSiteId(),
                   :device => Snips.getConfig(INI_TV),
                   :commands => ["AV", "up", "up", "center", "standby"],
                   :delay => 0.5
                   )

    Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
end



function tvSelectAmazon()

    trigger = Dict(:room => Snips.getSiteId(),
                   :device => Snips.getConfig(INI_TV),
                   :commands => ["AV", "down", "down", "center"],
                   :delay => 0.5
                   )

    Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
end
