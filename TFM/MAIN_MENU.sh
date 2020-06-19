#!/bin/bash
clear

_Banner() {
    echo "
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
3) Ejecutar controlador      
4) Realizar configuración
5) Visualizar configuraciones
6) Salir"
}

_ConfigureMenu() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
1) Agregar configuración IP           
2) Agregr configuración ARP 
3) Eliminar configuración IP  

**Ingrese otra tecla para volver al menu principal**"
}

_ConfigureIP() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
1) Envío de todo el tráfico IP           
2) Envío de determinado tráfico IP  
  
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
Ingrese IP de Origen (sw_src):"
}

_ConfigureDstIP() {
    echo "
Ingrese IP de Destino (nw_dst):"
}

_ShowConfigurations() {
    echo "
-----------------------------
        VISUALIZACIÓN                  
-----------------------------
1) Conmutadores (vsctl show)          
2) Tablas de flujo (flows tables)
3) Puertos (ports tables)
4) Gráfico BW short_path
5) Gráfico BW long_path
6) Diagrama de red
7) Version OpenvSwitch

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

_SelectConmDel() {
    echo "
-----------------------------
        CONFIGURACIÓN                    
-----------------------------
Seleccione el conmutador:
1) CONM_A
2) CONM_B
3) CONM_C
4) CONM_D
5) CONM_E

ACLARACIÓN: Solo será posible eliminar las rutas específicas creadas manualmente (priority=10)

**Ingrese otra tecla para volver al menu principal**"
}

_SelectPriority() {
    echo "
Ingrese el valor de la prioridad:"
}

_SelectInPortSrcIP() {
    echo "
Ingrese IP de Origen:"
}

_SelectInPortDstIP() {
    echo "
Ingrese IP de Destino:"
}

_SelectInPortA() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) A-C-0
2) A-B-1
3) R1_edge-e3"
}

_SelectInPortB() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) A-B-0
2) B-D-0"
}

_SelectInPortC() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) A-C-1
2) E-C-1"
}

_SelectInPortD() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) B-D-1
2) D-E-0"
}

_SelectInPortE() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) D-E-1
2) E-C-0
3) R2_edge-e3"
}

_SelectActionA() {
    echo "
Ingrese el número de la acción a eliminar:
1) Output: A-C-0
2) Output: A-B-1
3) Output: R1_edge-e3"
}

_SelectActionB() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) Output:A-B-0
2) Output: B-D-0"
}

_SelectActionC() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) Output: A-C-1
2) Output: E-C-1"
}

_SelectActionD() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) Output: B-D-1
2) Output: D-E-0"
}

_SelectActionE() {
    echo "
Ingrese el número del puerto de origen (in_port):
1) Output: D-E-1
2) Output: E-C-0
3) Output: R2_edge-e3"
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

    #ELIMINAR FLOW EN TABLA DE FLUJO IP
    elif [ $opt_conf_menu -eq "3" ]
    then
        clear
        _Banner
        _InitMessage
        _SelectConmDel
        read opt_select_conm_del
        if [ $opt_select_conm_del -eq "1" ]
        then
            sh Dump_flows.sh CONM_A
            #_SelectPriority
            #read prio
            _ConfigureSrcIP
            read selec_src_IP
            _ConfigureDstIP
            read select_dst_IP
            _SelectInPortA
            read in_port
            _SelectActionA
            read action
            sh Delete_some_IP_flow_A.sh $selec_src_IP $select_dst_IP $in_port $action
        elif [ $opt_select_conm_del -eq "2" ]
        then
            sh Dump_flows.sh CONM_B
            #_SelectPriority
            #read prio
            _ConfigureSrcIP
            read selec_src_IP
            _ConfigureDstIP
            read select_dst_IP
            _SelectInPortB
            read in_port
            _SelectActionB
            read action
            sh Delete_some_IP_flow_B.sh $selec_src_IP $select_dst_IP $in_port $action
        elif [ $opt_select_conm_del -eq "3" ]
        then
            sh Dump_flows.sh CONM_C
            #_SelectPriority
            #read prio
            _ConfigureSrcIP
            read selec_src_IP
            _ConfigureDstIP
            read select_dst_IP
            _SelectInPortC
            read in_port
            _SelectActionC
            read action
            sh Delete_some_IP_flow_C.sh $selec_src_IP $select_dst_IP $in_port $action
        elif [ $opt_select_conm_del -eq "4" ]
        then
            sh Dump_flows.sh CONM_D
            #_SelectPriority
            #read prio
            _ConfigureSrcIP
            read selec_src_IP
            _ConfigureDstIP
            read select_dst_IP
            _SelectInPortD
            read in_port
            _SelectActionD
            read action
            sh Delte_some_IP_flow_D.sh $selec_src_IP $select_dst_IP $in_port $action
        elif [ $opt_select_conm_del -eq "5" ]
        then
            sh Dump_flows.sh CONM_E
            #_SelectPriority
            #read prio
            _ConfigureSrcIP
            read selec_src_IP
            _ConfigureDstIP
            read select_dst_IP
            _SelectInPortE
            read in_port
            _SelectActionE
            read action
            sh Delete_some_IP_flow_E.sh $selec_src_IP $select_dst_IP $in_port $action
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
        sudo ovs-vsctl show
        echo "\n Presione ENTER para continuar..."
        read enter

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
            sh Dump_flows.sh CONM_A
        elif [ $opt_select_conm -eq "2" ]
        then
            sh Dump_flows.sh CONM_B
        elif [ $opt_select_conm -eq "3" ]
        then
            sh Dump_flows.sh CONM_C
        elif [ $opt_select_conm -eq "4" ]
        then
            sh Dump_flows.sh CONM_D
        elif [ $opt_select_conm -eq "5" ]
        then
            sh Dump_flows.sh CONM_E
        fi

    #VISUALIZAR TABLAS DE PUERTOS
    elif [ $opt_show -eq "3" ]
    then
        clear
        _Banner
        _InitMessage
        _SelectConm
        read opt_select_conm
        if [ $opt_select_conm -eq "1" ]
        then
            sh Dump_ports.sh CONM_A
        elif [ $opt_select_conm -eq "2" ]
        then
            sh Dump_ports.sh CONM_B
        elif [ $opt_select_conm -eq "3" ]
        then
            sh Dump_ports.sh CONM_C
        elif [ $opt_select_conm -eq "4" ]
        then
            sh Dump_ports.sh CONM_D
        elif [ $opt_select_conm -eq "5" ]
        then
            sh Dump_ports.sh CONM_E
        fi
    
    #VISUALIZAR GRAFICA SHORT_PATH
    elif [ $opt_show -eq "4" ]
    then
        cd /home/upm/Desktop/TFM
        python Graph_short.py
        clear

    #VISUALIZAR GRAFICA LONG_PATH
    elif [ $opt_show -eq "5" ]
    then
        cd /home/upm/Desktop/TFM
        python Graph_long.py
        clear

    #VISUALIZAR DIAGRAMA DE RED
    elif [ $opt_show -eq "6" ]
    then
        cd /home/upm/Desktop/TFM
        sh Diagrama.sh
        clear

    #VISUALIZAR VERSION DE OPENVSWITCH
    elif [ $opt_show -eq "7" ]
    then
        echo
        sudo ovs-vswitchd --version
        echo "\n Presione ENTER para continuar..."
        read enter
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
        cd /home/upm/Desktop/TFM
        sh ON.sh
        sh Clean_wondershaper.sh
        sh Wondershaper.sh
        clear

    #DESTRUIR ESCENARIO
    elif [ $opt -eq "2" ]
    then
        cd /home/upm/Desktop/TFM
        sh OFF.sh
        for xid in $(wmctrl -l | grep -e "Escenario_TFM_Andres_Muracciole.svg" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        clear
    
    #EJECUTAR CONTROLADOR
    elif [ $opt -eq "3" ]
    then
        gnome-terminal -- bash -c "sh Controller.sh; exec bash"
        sleep 10
	#sh Deny_IPv6.sh
	sh All_ARP_short_path.sh
	sh All_IP_short_path.sh
        gnome-terminal -- bash -c "python Monitor.py"
        clear

    #REALIZAR CONFIGURACIÓN
    elif [ $opt -eq "4" ]
    then
        _Config
        clear

    #VISUALIZAR CONFIGURACIONES
    elif [ $opt -eq "5" ]
    then
        _Shows
        clear

    #SALIR
    elif [ $opt -eq "6" ]
    then
        sh Clean_wondershaper.sh
        sh OFF.sh
        for xid in $(wmctrl -l | grep -e "Terminal" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        for xid in $(wmctrl -l | grep -e "Escenario_TFM_Andres_Muracciole.svg" | awk '{print $1}'); do wmctrl -i -c $xid ; done
        clear
        exit
    else
        clear
    fi
done
