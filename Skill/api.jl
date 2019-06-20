#
# API function goes here, to be called by the
# skill-actions:
#

ADB = "$(Snips.getAppDir())/Skill/fire.sh"

function amazonON()
    adbCmd("wake")
end

function amazonOFF()
    adbCmd("sleep")
end

function amazonARD()
    adbCmd("ard")
end

function amazonZDF()
    adbCmd("zdf")
end

function goHome()
    adbCmd("home")
end




function adbCmd(cmd)

    ip = Snips.getConfig(INI_FIRE_IP)
    adb = `$ADB $ip $cmd`
    println(">>>> ADB command: $adb")
    result = Snips.tryrun(adb, errorMsg =
                        """An error occured while sending commands $cmd
                        to Amazon fire.""")
    println(">>>> ADB result: $result")
end





function tvON()

    trigger = Dict(:room => Snips.getSiteId(),
                   :device => Snips.getConfig(INI_TV),
                   :commands => ["susi", "wait10", "AV", "up", "center"],
                   :delay => 0.5
                   )

    Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
end



function tvOFF()

    trigger = Dict(:room => Snips.getSiteId(),
                   :device => Snips.getConfig(INI_TV),
                   :commands => ["TV", "standby"],
                   :delay => 0.5
                   )

    Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
end



# function tvSelectAmazon()
#
#     trigger = Dict(:room => Snips.getSiteId(),
#                    :device => Snips.getConfig(INI_TV),
#                    :commands => ["AV", "down", "down", "center"],
#                    :delay => 0.5
#                    )
#
#     Snips.publishSystemTrigger("ADoSnipsTVViera", trigger)
# end
