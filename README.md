# Solución de Ingeniería de Tráfico - TFM 2019/2020

Este repositorio forma parte del trabajo de TFM de Andrés Muracciole para el Master Universitario en Ingeniería en Redes y Servicios Telemáticos de la Universidad Politécnica de Madrid.

**NOTA: Se encuentra en constantes modificaciones debido a mejoras en las que se está trabajando**

AUTOR: Andrés Muracciole

Este trabajo consiste en el estudio e implementación de una solución de ingeniería de tráfico SD-WAN para tratamiento de datos en una red WAN en tiempo real. El objetivo es sensar los caminos hasta el destino y determinar el camino mas óptimo en función del ancho de banda disponible en los canales.

El controlador a utilizar será Ryu y se hará un fuerte uso de su [API](https://ryu.readthedocs.io/en/latest/app/ofctl_rest.html#).

El escenario tiene la particularidad de tener una topologia "tipo pez" de forma que se crea un loop se conmutadores como se puede apreciar en la [figura](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Topologia.png). Aquí radica la dificultad del escenario ya que se debe aplicar una solución óptima para que no queden paquetes en el loop haciendo que se congestione la red.

![tablas](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Tablas.png)

## Main Menu:

```
sh Main_Menu_UBUNTU.sh
```
![main_menu](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Imagenes/Main_Menu.png)
Esto levanta una interfaz de menu en la terminal desde onde se pueden realizar las siguientes cosas:

1. Crear escenario

2. Destruir escenario

3. Ejecutar controlador

4. Realizar configuración

5. Visualizar configuración

Al seleccionar la tercer opción, por defecto se envía todo el tráfico por el camino mas corto. Lugo el usuario mediante la ***opción 4*** será capaz de poder configurar el camino que desea que tome cada tipo de tráfico identificándolo por IP/ARP y direcciones IP origen y destino

Desde el ***punto 4*** es posible seleccionar:

-  El camino que toma TODO el tráfico IPv4

-  El camino que toma TODO el tráfico ARP

-  El camino que toma DETERMINADO tráfico IPv4 (En función de la srs_IP y dst_IP)

- Eliminar cierta fila en las tablas de flujo

### 1 - Crear escenario

Levanta el escenario Lab_TFM.xml. Conjuntamente con este se ejecuta un [script](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/TFM/Script_wondershaper.sh) que limita el ancho de banda de los canales a 100 Mbps.

Para ello es necesario de antemano tener instalado el **wondershaper** mediante los siguientes comandos:
```
git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
```

### 2 - Destruir escenario

Elimina el escenario creado en el ***punto 1***

### 3 - Ejecutar controlador

En este punto se levanta el controladore RYU y se pone por defecto una regla que todo el tráfico IP y ARP se encamine por el camino mas corto (CONM_A - CONM_C - CONM_E)

### 4 - Realizar configuración

Desde aquí se puede agregar reglas para en las tablas de flujos así como también eliminar aquellas anteriormente creadas. Está configurado para que solo se eliminen aquellas con ***prio=10***, es decir aquellas creadas explicitamente por el usuario para encaminar determinado tráfico IP en función de sus direcciones IP origen y destino.

### 5 - Visualizar configuración

Se puede ver tanto desde información de los conmutadores en general, como la tablas de flujo, grupos y puertos de los mismos. A su vez es posible consultar la versión de OpenVSwitch o mism oimprimir el diagrama de red del escenario

***Me encuentro trabajando para poder optimizar la selección del camnimo en función del BW. Estos parámetros se obtienen del [controlador](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/ryu/app/network_awareness2/shortest_forwarding.py). Para ello es necesario obtener dicha informació y tomar la desición en tiempo real***

## Pendientes:

1. Realizar la función para medir el tiempo real el ancho de banda disponible en los canales y así determinar el mejor camino. Tener en cuenta el número de puerto así como también si el tráfico es TCP o UDP.

2. En caso de que haya tiempo ver si se puede agregar una interfaz gráfica para ver en colores por donde se envía el tráfico

## Fuentes de referencias:

- [Repositorio Wildan Maulana Syahidillah](https://github.com/wildan2711)

- [Repositorio muzixing](https://github.com/muzixing/ryu)
