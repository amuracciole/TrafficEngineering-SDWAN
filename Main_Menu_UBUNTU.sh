#!/bin/bash
clear

_Banner() {
    echo "\n
     ######  ########          ##      ##    ###    ##    ## 
    ##    ## ##     ##         ##  ##  ##   ## ##   ###   ## 
    ##       ##     ##         ##  ##  ##  ##   ##  ####  ## 
     ######  ##     ## ####### ##  ##  ## ##     ## ## ## ## 
          ## ##     ##         ##  ##  ## ######### ##  #### 
    ##    ## ##     ##         ##  ##  ## ##     ## ##   ### 
     ######  ########           ###  ###  ##     ## ##    ## "

}

_InitMessage() {
    echo "
==================================================================
      DESARROLLO DE APLICACIONES DE INGENIERÍA DE TRÁFICO EN
                REDES WAN BASADAS EN SOFTWARE
==================================================================
TFM de Andrés Jorge Muracciole Vázquez del Master en Ingeniería en 
Redes y Servicios Telemáticos de la Universidad Politécnica de 
Madrid (UPM)"
}

_Menu() {
    echo "
-----------------------------
            MENU                  
-----------------------------
1) Crear escenario
2) Destruir escenario   
3) Imprimir diagrama de red     
4) Ejecutar controlador      
5) Realizar configuración
6) Visualizar configuraciones
7) Salir"
}

_ConfigureMenu() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
1) Configuración IP           
2) Configuración ARP     

**Ingrese otra tecla para volver al menu principal**"
}

_ConfigureIP() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
1) Todo tráfico IP           
2) Determinado tráfico IP   
  
**Ingrese otra tecla para volver al menu principal**"
}

_ConfigurePath() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
1) Camino largo           
2) Camino corto

**Ingrese otra tecla para volver al menu principal**"
}

_ConfigureSrcIP() {
    echo "
-----------------------------
        CONFIGURACIÓN                  
-----------------------------
Ingrese IP de Origen:"
}

_ConfigureDstIP() {
    echo "
Ingrese IP de Destino:"
}

_ShowConfigurations() {
    echo "
-----------------------------
        VISUALIZACIÓN                  
-----------------------------
1) Conmutadores (vsctl show)          
2) Tablas de flujo (flows tables)
3) Grupos (groups tables)
4) Puertos (ports tables)
5) Diagrama de red
6) Version OpenVSwitch

**Ingrese otra tecla para volver al menu principal**"
}

_SelectConm() {
    echo "
-----------------------------
        VISUALIZACIÓN                  
-----------------------------
Seleccione el conmutador:
1) CONM_A
2) CONM_B
3) CONM_C
4) CONM_D
5) CONM_E

**Ingrese otra tecla para volver al menu principal**"
}

_Config() {
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
                sh All_IP_long_path.sh
                sleep 1
            
            #CAMINO IP CORTO
            elif [ $opt_conf_path -eq "2" ]
            then
                sh All_IP_short_path.sh
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
                sh Some_IP_long_path.sh $src_IP $dst_IP
                sleep 1
            
            #CAMINO IP CORTO
            elif [ $opt_conf_path -eq "2" ]
            then
                sh Some_IP_short_path.sh $src_IP $dst_IP
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
	    sh All_ARP_long_path.sh
        
        #CAMINO ARP CORTO
        elif [ $opt_conf_path -eq "2" ]
        then
            sh All_ARP_short_path.sh
        fi
    fi
}

_Shows() {
    clear
    _Banner
    _InitMessage
    _ShowConfigurations
    read opt_show
    #VISUALIZAR CONMUTADORES
    if [ $opt_show -eq "1" ]
    then
        gnome-terminal -- bash -c "sudo ovs-vsctl show; exec bash"

    #VISUALIZAR TABLAS DE FLUJO
    elif [ $opt_show -eq "2" ]
    then
        clear
        _Banner
        _InitMessage
        _SelectConm
        read opt_select_conm
        if [ $opt_select_conm -eq "1" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_flows.sh CONM_A; exec bash"
        elif [ $opt_select_conm -eq "2" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_flows.sh CONM_B; exec bash"
        elif [ $opt_select_conm -eq "3" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_flows.sh CONM_C; exec bash"
        elif [ $opt_select_conm -eq "4" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_flows.sh CONM_D; exec bash"
        elif [ $opt_select_conm -eq "5" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_flows.sh CONM_E; exec bash"
        fi
    
    #VISUALIZAR TABLAS DE GRUPOS
    elif [ $opt_show -eq "3" ]
    then
        clear
        _Banner
        _InitMessage
        _SelectConm
        read opt_select_conm
        if [ $opt_select_conm -eq "1" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_groups.sh CONM_A; exec bash"
        elif [ $opt_select_conm -eq "2" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_groups.sh CONM_B; exec bash"
        elif [ $opt_select_conm -eq "3" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_groups.sh CONM_C; exec bash"
        elif [ $opt_select_conm -eq "4" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_groups.sh CONM_D; exec bash"
        elif [ $opt_select_conm -eq "5" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_groups.sh CONM_E; exec bash"
        fi

    #VISUALIZAR TABLAS DE PUERTOS
    elif [ $opt_show -eq "4" ]
    then
        clear
        _Banner
        _InitMessage
        _SelectConm
        read opt_select_conm
        if [ $opt_select_conm -eq "1" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_ports.sh CONM_A; exec bash"
        elif [ $opt_select_conm -eq "2" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_ports.sh CONM_B; exec bash"
        elif [ $opt_select_conm -eq "3" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_ports.sh CONM_C; exec bash"
        elif [ $opt_select_conm -eq "4" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_ports.sh CONM_D; exec bash"
        elif [ $opt_select_conm -eq "5" ]
        then
            gnome-terminal -- bash -c "sh Script_dump_ports.sh CONM_E; exec bash"
        fi
    
    #VISUALIZAR DIAGRAMA DE RED
    elif [ $opt_show -eq "5" ]
    then
        cd /home/upm/Desktop
        sh Script_Diagrama.sh
        clear

    #VISUALIZAR VERSION DE OPENVSWITCH
    elif [ $opt_show -eq "6" ]
    then
        echo "FALTA!"
    fi
}

##------------------------------------------- LOOP -------------------------------------------##
while true ; do
    _Banner
    _InitMessage
    _Menu     
    read opt

    # CREAR ESCENARIO
    if [ $opt -eq "1" ]
    then
        cd /home/upm/Desktop
        sh Script_ON.sh
        clear

    #DESTRUIR ESCENARIO
    elif [ $opt -eq "2" ]
    then
        cd /home/upm/Desktop
        sh Script_OFF.sh
        for xid in $(wmctrl -l | grep -e "Escenario_TFM_Andres_Muracciole.svg" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        clear
    
    #IMPRIMIR DIAGRAMA DE RED
    elif [ $opt -eq "3" ]
    then
        cd /home/upm/Desktop
        sh Script_Diagrama.sh
        clear
    
    #EJECUTAR CONTROLADOR
    elif [ $opt -eq "4" ]
    then
        gnome-terminal -- bash -c "sh Script_Controller.sh; exec bash"
	sleep 10
	sh Deny_IPv6.sh
	sh All_ARP_short_path.sh
	sh All_IP_short_path.sh
        clear

    #REALIZAR CONFIGURACIÓN
    elif [ $opt -eq "5" ]
    then
        _Config
        clear

    #VISUALIZAR CONFIGURACIONES
    elif [ $opt -eq "6" ]
    then
        _Shows
        read show
        clear

    #SALIR
    elif [ $opt -eq "7" ]
    then
        sh Script_OFF.sh
        for xid in $(wmctrl -l | grep -e "Terminal" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        for xid in $(wmctrl -l | grep -e "Escenario_TFM_Andres_Muracciole.svg" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        ##FALTA CERRAR TODAS LAS TERMINALES!!
        clear
        exit
    else
        echo "Opcion incorrecta. Intente nuevamente"
        sleep 3
        clear
    fi
done
