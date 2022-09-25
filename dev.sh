#!/bin/bash

function display {

    #Clear Console
    echo -e "\033c"

    #Display MOTD
    echo "



    $(tput setaf 6)██╗     ██╗███╗   ██╗███████╗███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗
    $(tput setaf 6)██║     ██║████╗  ██║██╔════╝████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝
    $(tput setaf 6)██║     ██║██╔██╗ ██║█████╗  ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗
    $(tput setaf 6)██║     ██║██║╚██╗██║██╔══╝  ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║
    $(tput setaf 6)███████╗██║██║ ╚████║███████╗██║ ╚████║╚██████╔╝██████╔╝███████╗███████║
    $(tput setaf 6)╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝



    "  
}

function forceStuffs {
  # Forcing Default Server Icon.
  curl -O https://cdn.discordapp.com/attachments/1005162309079011379/1023645682252402768/server-image.png # https://cdn.discordapp.com/attachments/1005162309079011379/1023595458590937088/server-icon.png

  # Forcing Hibernate Plugin.
  curl -o plugins/linenodes.jar https://cdn.discordapp.com/attachments/1005162309079011379/1023595814225977375/linenodes.jar

  # Forcing MOTD.
  echo "motd=This server is hosted on \u00A76LineNodes.fun\u00A7r\n\u00A73You can change this MOTD in server.properties" >> server.properties
}

function launchJavaServer {
  # Using Aikars flags.
  java -Xms1024M -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar paper-server.jar nogui
}
FILE=eula.txt

# Currently this is still in development.

function optimizeJavaServer {
  # Decreasing view distance.
  echo "view-distance=8" >> server.properties

  # Slows down incremental chunk saving during the world save task
  echo "max-auto-save-chunks-per-tick: 10" >> paper.yml
  
  # Optimize explosions.
  echo "optimize-explosions: true" >> paper.yml

  # Prevents players from entering an unloaded chunk (due to lag), which causes more lag.
  echo "prevent-moving-into-unloaded-chunks: true" >> paper.yml

  # Disable overload warnings
  echo "warn-on-overload: false" >> spigot.yml
  
}

if [ ! -f "$FILE" ]
then
    mkdir -p plugins
    display
sleep 5
echo "

  $(tput setaf 3)Выбор ядра. Выберете подходящее ядро для вашего сервера. Если же вы хотите создать дискорд бота, то вам следует в dash.linenodes.fun выбрать discord.js или discord.py вместо Paper

  1) Paper 1.8.8       6)  BungeeCord (Последний)
  2) Paper 1.12.2
  3) Paper 1.16.5
  4) Paper 1.17.0
  5) Paper 1.18.0

         Made by S.mode & FlowerinMine"

  "
read -r n

case $n in
  1) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.8.8 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1005162309079011379/1023607063617749062/paper-server.jar

    display
    
    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 8."
    
    sleep 10
    
    echo -e ""
    
    optimizeJavaServer
    launchJavaServer
  ;;

  2) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.12.2 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1005162309079011379/1023607211278225530/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 11."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  3) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.16.5 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://download1336.mediafire.com/nh84oeb1kemg/uq841bqn60hd7y5/paper-server.jar

    display   

    echo "$(tput setaf 1)You have to change the docker image because of this version, otherwise it will not work. Please go to the Startup tab, and change the docker image to Java 16."
    
    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  4)
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.17.0 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://download1336.mediafire.com/t7jlok1ybsng/uq841bqn60hd7y5/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  5) 
    sleep 1

    echo "$(tput setaf 3)Ok, I will download 1.18.0 and start it for you."

    sleep 4

    forceStuffs

    curl -O https://cdn.discordapp.com/attachments/1005162309079011379/1023609301203435570/paper-server.jar

    display

    sleep 10

    echo -e ""

    optimizeJavaServer
    launchJavaServer
  ;;

  6)
    echo "$(tput setaf 3)Ok, I will download lasted Bungeecord and start it for you."

    curl -O https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar

    display 

    java -Xms512M -Xmx512M -jar BungeeCord.jar
  ;;

  7)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  8)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  9)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  10)
    echo ""
    echo "This platform is not available yet, please check back later. (COMING_SOON)"
    exit
  ;;

  nobodyknows1337)
    echo ""
    echo "Эм... Вы попали в странное место... Кажется ещё ничего не готово."
    echo ""
    exit
  ;;

  *) 
    echo "Invalid option, exiting..."
    exit
  ;;
esac  
else
if [ -f plugins ]; then
mkdir plugins
fi
if [ -f BungeeCord.jar ]; then
  display
  java -Xms512M -Xmx512M -jar BungeeCord.jar
else
if [ ! -f hA5AW4Ni6Si6S4WvZ4WvZhA5AW4N.png ]; then
# Force the server icon.
curl -O https://cdn.discordapp.com/attachments/1005162309079011379/1023645682252402768/server-image.png # https://cdn.discordapp.com/attachments/1005162309079011379/1023595458590937088/server-icon.png
fi
if [ -d plugins ]; then
  mkdir -p plugins
fi
# Redownload the Hibernate jar incase someone delete it.
  curl -o plugins/linenodes.jar https://cdn.discordapp.com/attachments/1005162309079011379/1023595814225977375/linenodes.jar
  display   
  launchJavaServer
fi
fi
fi
