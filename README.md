# Solución de Ingeniería de Tráfico - TFM 2020

Este repositorio forma parte del trabajo de TFG de Andrés Muracciole para el Master Universitario en Ingeniería en Redes y Servicios Telemáticos de la Universidad Politécnica de Madrid.

**NOTA: Se encuentra en constantes modificaciones debido a mejoras en las que se está trabajando**

AUTOR: Andrés Muracciole

Este trabajo consiste en el estudio e implementación de una solución de ingeniería de tráfico SDWAN para tratamiento de datos en una red WAN en tiempo real. El objetivo es sensar los caminos hasta el destino y determinar el camino mas óptimo en función del ancho de banda disponible, delay y paquetes perdidos.

El controlador a utilizar será Ryu y se hará un fuerte uso de su [API](https://ryu.readthedocs.io/en/latest/app/ofctl_rest.html#).

En escenario tiene la particularidad de tener una topologia "tipo pez" de forma que se crea un loop se conmutadores como se puede apreciar en la [figura](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Topologia.png). Aquí radica la dificultad del escenario ya que se debe aplicar una solución óptima para que no queden paquetes en el loop haciendo que se congestione la red.

![tablas](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Tablas.png)

## 1) Cargar el escenario:

```
sh Script_TFM_ON.sh
```

O que es lo mismo:

```
sudo vnx -f /usr/share/vnx/tfm/Lab_TFM.xml -v --create

```

![topología](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Topologia.png)

## 2) Levantar el controlador:

```
sh Script_TFM_controlador.sh
```

O que es lo mismo:

```
ryu-manager simple_monitor_13_modify.py ryu.app.gui_topology.gui_topology
```

## 3) Configurar paths:

Como se puede apreciar, la topología presenta un loop, una posible forma para evitar esto es enviar el tráfico por el camino mas corto: CONM_A - CONM_C - CONM_E.
Para esto se puede hacer mediante el script [short_path](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/short_path.sh). Este envía el tráfico IPv4 y ARP por este camino, bloqueando expresamente IPv6.

```
sh short_path.sh
```

En caso de querer elegir el camino CONM_A - CONM_B - CONM_D - CONM_E, se puede hacer con el script [long_path](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/long_path.sh). Este envía el tráfico IPv4 y ARP por este camino, bloqueando expresamente IPv6.


```
sh long_path.sh
```

## 4) Eliminar el escenario:

Una vez que se deje te trabajr con el escenario, es necesario destruirlo.

```
sh Script_TFM_OFF.sh
```

O que es lo mismo:

```
sudo vnx -f /usr/share/vnx/tfm/Lab_TFM.xml -v --destroy

``` 

***Me encuentro trabajando para poder optimizar la selección del camnimo en función del BW, delay y packet lost. Estos parámetros se obtienen del controlador [modificado](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/simple_monitor_13_modify.py). Para ello es necesario obtener dicha informació y tomar la desición en tiempo real***

*Fuentes de referencias:*

- [Repositorio Wildan Maulana Syahidillah](https://github.com/wildan2711)

- [Repositorio muzixing](https://github.com/muzixing/ryu)

- ![Eth_Type](https://github.com/amuracciole/TrafficEngineering_SDWAN/blob/master/Eth_type.png)