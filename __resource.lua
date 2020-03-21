resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

name "Reality Roleplay LEO Loadout"
description "A simple LEO loadout script made for Cronus Gaming and modified for Reality Roleplay"
author "Michael - Reality Roleplay"

depencency 'NativeUI'

client_scripts {
    'client.lua',
    '@NativeUI/NativeUI.lua',
    'nativeui.lua'
}

server_script 'server.lua'