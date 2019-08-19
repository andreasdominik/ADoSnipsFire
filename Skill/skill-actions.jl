
"""
    switchOnOffActions(topic, payload)

Switch on the fire stick with the adb-script.
"""
function switchOnOffActions(topic, payload)

    # log:
    #
    Snips.printLog("action switchOnOffActions() started.")

    # ignore, if not responsible (other device):
    #
    device = Snips.extractSlotValue(payload, SLOT_DEVICE)
    if device == nothing || !( device in ["amazon_fire",
                    "ARD_media_centre", "ZDF_media_centre"] )
        return false
    end


    # ROOMs are not yet supported -> only ONE Fire  in assistent possible.
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

    # check ini vals:
    #
    if !Snips.isConfigValid(INI_FIRE_IP) ||
       !Snips.isConfigValid(INI_TV)

       Snips.publishEndSession(:noip)
       return true
    end

    if onOrOff == "OFF"
        Snips.publishEndSession(:switchoff)
        goHome()
        sleep(0.5)
        amazonOFF()
        sleep(0.5)
        tvOFF()
    else
        stopListen()
        # Snips.publishSay(:not_listen)
        Snips.publishEndSession(:switchon)
        amazonON()

        if device == "ARD_media_centre"
            amazonARD()
        elseif device == "ZDF_media_centre"
            amazonZDF()
        end
        tvON()
    end
    return false
end
