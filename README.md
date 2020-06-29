# Solución de Ingeniería de Tráfico - TFM 2019/2020

Este repositorio forma parte del trabajo de TFM de **Andrés Muracciole** para el Master Universitario en Ingeniería en Redes y Servicios Telemáticos ([MUIRST](https://www.dit.upm.es/~posgrado/muirst/)) de la Universidad Politécnica de Madrid ([UPM](https://www.upm.es/))

Mención especial para _Carlos M. Lentisco Sánchez_ quien tutorizó el trabajo desde un principio.

**OBJETIVO**
Estudio e implementación de una solución de ingeniería de tráfico y controlador SD-WAN para tratamiento de datos en una red WAN en tiempo real. El objetivo es sensar los caminos hasta el destino y determinar el camino mas óptimo para el tráfico sensible, en función del ancho de banda disponible en los canales.

El controlador a utilizar será Ryu y se hará un fuerte uso de su [API](https://ryu.readthedocs.io/en/latest/app/ofctl_rest.html#).

El escenario tiene la particularidad de tener una topologia "tipo pez" de forma que se crea un loop se conmutadores como se puede apreciar en la [figura](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Topologia.png). Aquí radica la dificultad del escenario ya que se debe aplicar una solución óptima para que no queden paquetes en el loop haciendo que se congestione la red.

![Main_menu](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Main_menu.png)

## Main Menu:

```
Iniciar la aplicación con el ejecutable TE_SD-WAN.desktop
```
![main_menu](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Main.png)
Esto levanta una interfaz de menu en la terminal desde donde se pueden realizar las siguientes cosas:

1. Crear escenario

2. Destruir escenario

3. Ejecutar controlador

4. Realizar configuración

5. Visualizar configuración

Al seleccionar la tercer opción, por defecto se envía todo el tráfico por el camino mas corto. Luego el usuario mediante la ***opción 4*** será capaz de poder configurar el camino que desea que tome cada tipo de tráfico identificándolo por IPv4, IPv6 o ARP y direcciones IP (v4 o v6) origen y destino.

### 1 - Crear escenario

Levanta el escenario [Laboratory_full.xml](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Escenario/Laboratory_full.xml). Conjuntamente con este se ejecuta un [script](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/TFM/Wondershaper.sh) que limita el ancho de banda de los canales a 100 Mbps.

_ACLARACIÓN: Puede que sea necesario cambiar el path del archivo para que funcione en su máquina._

Para ello es necesario de antemano tener instalado el **wondershaper** mediante los siguientes comandos:
```
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
```

### 2 - Destruir escenario

Elimina el escenario creado en el ***punto 1***.

### 3 - Ejecutar controlador

Ejecuta el controladore RyU. Por defecto se crean reglas para que todo el tráfico IPv4, Ipv6 y ARP se encamine por el camino mas corto (CONM_A - CONM_C - CONM_E).

Paralelamente se ejecuta una instancia de **Monitor.py** que mide el promedio de los últimos 30 segundos del ancho de banda utilizado.  Si se supera el 65% del total, se activan polçiticas para priorizar el tráfico sensible. Este proceso es automático en función de las prestaciones actuales de la red.

### 4 - Realizar configuración

Permite agregar reglas en las tablas de flujos así como también eliminar aquellas anteriormente creadas. Está configurado para que solo se eliminen aquellas con ***prio=10***, es decir aquellas creadas explicitamente por el usuario para encaminar determinado tráfico IP en función de sus direcciones origen y destino.

### 5 - Visualizar configuración

Visualización de la información de los conmutadores, tablas de flujo, diagrama de red o tráfico por los enlaces (gráficos).