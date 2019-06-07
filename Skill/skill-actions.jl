
"""
    switchOnOffActions(topic, payload)

Switch on the fire stick with the adb-script.
"""
function switchOnOffActions(topic, payload)

    # log:
    #
    println("[ADoSnipsFire]: action switchOnOffActions() started.")

    # ignore, if not responsible (other device):
    #
    device = Snips.extractSlotValue(payload, SLOT_DEVICE)
    if device == nothing || !( device in ["amazon_fire",
                    "ARD_media_centre", "ZDF_media_centre"] )
        return false
    end


    # ROOMs are not yet supported -> only ONE TV  in assistent possible.
    #
    # room = Snips.extractSlotValue(payload, SLOT_ROOM)
    # if room == nothing
    #     room = Snips.getSiteId()
    # end

    onOrOff = Snips.extractSlotValue(payload, SLOT_ON_OFF)
    if onOrOff == nothing || !(onOrOff in ["ON", "OFF"])
        Snips.publishEndSession(:dunno)
        return true
    end

    # println(">>> $onOrOff, $device")

    # all the same with off:
    #
    Snips.isConfigValid(INI_FIRE_IP) || return true
    Snips.isConfigValid(INI_TV) || return true

    if onOrOff == "OFF"
        Snips.publishEndSession(:switchoff)
        goHome(Snips.getConfig(INI_FIRE_IP))
        switchoff(Snips.getConfig(INI_FIRE_IP))
        switchoffTV(Snips.getConfig(INI_TV))
    else
        Snips.publishEndSession(:switchon)
        switchonTV(Snips.getConfig(INI_TV))
        switchon(Snips.getConfig(INI_FIRE_IP))
        sleep(10)
        selectAmazonInTV(Snips.getConfig(INI_TV))

        if device == "ARD_media_centre"
            goARD(Snips.getConfig(INI_TV))
        elseif device == "ARD_media_centre"
            goZDF(Snips.getConfig(INI_TV))
        end
    end
    return false
end
