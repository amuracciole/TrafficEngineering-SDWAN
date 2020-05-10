# Solución de Ingeniería de Tráfico - TFM 2020

Este repositorio forma parte del trabajo de TFM de Andrés Muracciole para el Master Universitario en Ingeniería en Redes y Servicios Telemáticos de la Universidad Politécnica de Madrid.

**NOTA: Se encuentra en constantes modificaciones debido a mejoras en las que se está trabajando**

AUTOR: Andrés Muracciole

Este trabajo consiste en el estudio e implementación de una solución de ingeniería de tráfico SDWAN para tratamiento de datos en una red WAN en tiempo real. El objetivo es sensar los caminos hasta el destino y determinar el camino mas óptimo en función del ancho de banda disponible, delay y paquetes perdidos.

El controlador a utilizar será Ryu y se hará un fuerte uso de su [API](https://ryu.readthedocs.io/en/latest/app/ofctl_rest.html#).

En escenario tiene la particularidad de tener una topologia "tipo pez" de forma que se crea un loop se conmutadores como se puede apreciar en la [figura](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Topologia.png). Aquí radica la dificultad del escenario ya que se debe aplicar una solución óptima para que no queden paquetes en el loop haciendo que se congestione la red.

![tablas](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Tablas.png)

## Main Menu:

```
sh Main_Menu_UBUNTU.sh
```
![main_menu](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Main_Menu.png)
Esto levanta una interfaz de menu en la terminal desde onde se pueden realizar las siguientes cosas:

1. Crear escenario

2. Destruir escenario

3. Imprimir diagrama de red

4. Ejecutar controlador

5. Realizar configuración

Al seleccionar la tercer opción, por defecto se envía todo el tráfico por el camino mas corto.

Desde el ***punto 5*** es posible seleccionar:

1. El camino que toma TODO el tráfico IPv4

2. El camino que toma TODO el tráfico ARP

3. El camino que toma DETERMINADO tráfico IPv4 (En función de la srs_IP y dst_IP)
***Este punto todavía no se encuentra operativo***


***Me encuentro trabajando para poder optimizar la selección del camnimo en función del BW, delay y packet lost. Estos parámetros se obtienen del controlador [modificado](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/simple_monitor_13_modify2.py). Para ello es necesario obtener dicha informació y tomar la desición en tiempo real***

##Fuentes de referencias:

- [Repositorio Wildan Maulana Syahidillah](https://github.com/wildan2711)

- [Repositorio muzixing](https://github.com/muzixing/ryu)
