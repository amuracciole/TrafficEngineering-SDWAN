#!/bin/bash
clear

function _Banner() {
    echo "\n
     ######  ########          ##      ##    ###    ##    ## 
    ##    ## ##     ##         ##  ##  ##   ## ##   ###   ## 
    ##       ##     ##         ##  ##  ##  ##   ##  ####  ## 
     ######  ##     ## ####### ##  ##  ## ##     ## ## ## ## 
          ## ##     ##         ##  ##  ## ######### ##  #### 
    ##    ## ##     ##         ##  ##  ## ##     ## ##   ### 
     ######  ########           ###  ###  ##     ## ##    ## "

}

function _InitMessage() {
    echo "
==================================================================
      DESARROLLO DE APLICACIONES DE INGENIERÍA DE TRÁFICO EN
                REDES WAN BASADAS EN SOFTWARE
==================================================================
TFM de Andrés Jorge Muracciole Vázquez del Master en Ingeniería en 
Redes y Servicios Telemáticos de la Universidad Politécnica de 
Madrid (UPM)"
}

function _Menu() {
    echo "
-----------------------------
            MENU                  
-----------------------------
1) Crear escenario
2) Destruir escenario        
3) Ejecutar controlador      
4) Realizar configuración    
5) Salir"
}

function _ConfigureMenu() {
    echo "
-----------------------------
        CONFIGURACIóN                  
-----------------------------
1) Configuración IP           
2) Configuración ARP     

**Ingrese otra tecla para volver al menu principal**"
}

function _ConfigureIP() {
    echo "
-----------------------------
        CONFIGURACIóN                  
-----------------------------
1) Todo tráfico IP           
2) Determinado tráfico IP   
  
**Ingrese otra tecla para volver al menu principal**"
}

function _ConfigurePath() {
    echo "
-----------------------------
        CONFIGURACIóN                  
-----------------------------
1) Camino largo           
2) Camino corto

**Ingrese otra tecla para volver al menu principal**"
}

function _ConfigureSrcIP() {
    echo "
-----------------------------
        CONFIGURACIóN                  
-----------------------------
Ingrese IP de Origen:"
}

function _ConfigureDstIP() {
    echo "
Ingrese IP de Destino:"
}

function _Config() {
    clear
    _Banner
    _InitMessage
    _ConfigureMenu
    read opt_conf_menu
    #CONFIGURAR IP
    if [ $opt_conf_menu -eq "1" ]
    then
        clear
        _Banner
        _InitMessage
        _ConfigureIP
        read opt_conf_IP
        #CONFIGURAR TODO TRAFICO IP
        if [ $opt_conf_IP -eq "1" ]
        then
            clear
            _Banner
            _InitMessage
            _ConfigurePath
            read opt_conf_path
            #CAMINO IP LARGO
            if [ $opt_conf_path -eq "1" ]
            then
                echo "FUNCION All_IP_long_path.sh"
                sleep 1
            
            #CAMINO IP CORTO
            elif [ $opt_conf_path -eq "2" ]
            then
                echo "FUNCION All_IP_short_path.sh"
                sleep 1
            fi
        
        #CONFIGURAR ALGUN TRAFICO IP
        elif [ $opt_conf_IP -eq "2" ]
        then
            clear
            _Banner
            _InitMessage
            _ConfigureSrcIP
            read src_IP
            _ConfigureDstIP
            read dst_IP
            clear
            _Banner
            _InitMessage
            _ConfigurePath
            read opt_conf_path
            #CAMINO IP LARGO
            if [ $opt_conf_path -eq "1" ]
            then
                echo "FUNCION Some_IP_long_path.sh"
                sleep 1
            
            #CAMINO IP CORTO
            elif [ $opt_conf_path -eq "2" ]
            then
                echo "FUNCION Some_IP_short_path.sh"
                sleep 1
            fi
        fi
    
    #CONFIGURAR ARP
    elif [ $opt_conf_menu -eq "2" ]
    then
        clear
        _Banner
        _InitMessage
        _ConfigurePath
        read opt_conf_path
        #CAMINO ARP LARGO
        if [ $opt_conf_path -eq "1" ]
        then
            echo "FUNCION All_ARP_long_path.sh"
            sleep 1
        
        #CAMINO ARP CORTO
        elif [ $opt_conf_path -eq "2" ]
        then
            echo "FUNCION All_ARP_short_path.sh"
            sleep 1
        fi
    fi
}

while True ; do
    _Banner
    _InitMessage
    _Menu     
    read opt

    # CREAR ESCENARIO
    if [ $opt -eq "1" ]
    then
        cd /home/upm/Desktop
        sh Script_ON.sh
        #echo "FUNCION CREAR ESCENARIO"
        clear

    #DESTRUIR ESCENARIO
    elif [ $opt -eq "2" ]
    then
        cd /home/upm/Desktop
        sh Script_OFF.sh
        #echo "FUNCION DESTRUIR ESCENARIO"
        clear

    #EJECUTAR CONTROLADOR
    elif [ $opt -eq "3" ]
    then
        cd /home/upm/Desktop
        sh Script_Controller.sh
        sh Script_Deny_IPv6
        #echo "FUNCION EJECUTAR CONTROLADOR"
        clear

    #REALIZAR CONFIGURACIÓN
    elif [ $opt -eq "4" ]
    then
        _Config
        clear

    #SALIR
    elif [ $opt -eq "5" ]
    then
        clear
        exit
    else
        echo "Opcion incorrecta. Intente nuevamente"
    fi
done
