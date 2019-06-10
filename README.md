# ADoSnipsFire

This is a skill for the SnipsHermesQnD framework for Snips.ai
to control an Amazon Fire Stick.

 The full documentation of the QnD franework is just work-in-progress!
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


# Julia

This skill is (like the entire SnipsHermesQnD framework) written in the
modern programming language Julia (because Julia is faster
then Python and coding is much much easier and much more straight forward).
However "Pythonians" often need some time to get familiar with Julia.

If you are ready for the step forward, start here: https://julialang.org/
