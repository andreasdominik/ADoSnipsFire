# ADoSnipsFire

This is a skill for the SnipsHermesQnD framework for Snips.ai
to control an Amazon Fire Stick.

 The full documentation of the QnD framework is just work-in-progress!
 Current version can be visited here:

 [Framework documentation](https://andreasdominik.github.io/ADoSnipsQnD/dev)

 The skill supports the languages `de` and `en` and uses the
 framework-intents `ADoSnipsOnOFFDE` or `ADoSnipsOnOFFEN`. It can only be used as
 part of this framework.

## Commands

Supported commands include only:

* wakeup
* standby
* open ARD media centre
* open ZDF media centre

In addition the app switches on/off the connected tv set, via a QnD system trigger.
In order to work, the tv-skill (`ADoSnipsTVVieraDE`) must be installed as well.

All commands handled by the connected TV (such as `pause`, `play`, `mute`, etc.)
will work as well, if the TV-skill is installed.


## config.ini

The config.ini includes the following params:

###### language:
`de` or `en`. Additional languages can be easyly added, by just
            adding the needed phrases to the innguage-list another language.

###### fire_ip:
IP address of the fire device

###### tv:
unique name of the tv as defined in the config.ini of the tv-skill.


## API

The fire device is remote-controlled via ADB. Please see the respective tuorials
how to prepare the Fire Stick to ADB
(https://developer.amazon.com/docs/fire-tv/connecting-adb-to-device.html).

In addition it is necessary to install `adb` on the RPi (`sudo apt install adb`
will do the job!).

## Ecosystem

The skill is part of the QnD-framework for Snips and intented to be used together
with the Skills `ADoSnipsHermesQnd<DE/EN>`, `ADoSnipsTVViera<DE/EN>`, `ADoSnipsFire<DE/EN>` and `ADoSnipsKodi<DE/EN>`. All together
works like charm in my HDTV setting with a Panasonic plasma, an Amazon Stick,
Libreelec/kodi on a RPi and Snips on a RPi (all connected via IP and HDMI/CEC).

In other settings (and all settings are different) the skills will
most probably *not* work out-of-the-box. However, the apps are developped
with 2 levels of API (like shown in the framework documentation) and implement
more functionality as currently used by the skills. Therefore it should be easy
to fork the apps and adapt the code to whatever is necessary just by calling the
proper API functions.

# Julia

This skill is (like the entire SnipsHermesQnD framework) written in the
modern programming language Julia (because Julia is faster
then Python and coding is much much easier and much more straight forward).
However "Pythonians" often need some time to get familiar with Julia.

If you are ready for the step forward, start here: https://julialang.org/
