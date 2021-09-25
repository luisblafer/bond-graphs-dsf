# Modelado en Bong Draph del Manipulador RR

Repositorio con el código fuente del proyecto en Matlab y 20Sim para el práctico de Modelado del Manipulador RR.


<!-- GETTING STARTED -->
## Inicio Rápido

1. Clonar el repositorio

   ```sh
   git clone https://github.com/luisblafer/bond-graphs-dsf.git
   ```

2. Ejecutar en Matlab el script del ejercicio que se desee utilizar. 


## Detalle de Scripts
<!-- MATLAB -->
### Ensayos en Matlab

#### Motor de Corriente Contínua

* `ensayosMCC` - Graficado de los diferentes ensayos realizados sobre el MCC-IP.


#### Manipulador Robótico RR

* `ensayosControlador` - Graficado de los diferentes ensayos realizados sobre Manipulador RR.

#### Extra

* `calculoPO` - Cácluo de los puntos de operación en RPE del MCC-IP.



<!-- 20Sim -->
### Modelos en 20Sim

#### Motor de Corriente Contínua

* `MDL_MCC` - Modelo para simulación del MCC-IP para los diferentes ensayos.


#### Manipulador Robótico RR

* `PD3` - Modelo libre sin considerar el efecto de la gravedad.
* `PD3` - Modelo libre considerando el efecto de la gravedad.
* `PD4` - Modelo con compensación externa de la gravedad.
* `PD5` - Modelo con motor MCC-IP inicial.
* `PD6` - Modelo con motor MCC-IP y reducción.
* `PD7` - Modelo con motor MCC-IP, reducción y trayectoria variable del efector final.

#### Modelos Personalizados

* `MCC_IP` - Modelo personalizable del motor de contínua de imán permanente.
* `RR` - Modelo personalizable del manipulador robótico RR.

<!-- CONTACT -->
## Contacto

Luis Fernandez Blanco - [@luisblafer](https://twitter.com/luisblafer)

Link del Proyecto: [https://github.com/luisblafer/bond-graphs-dsf](https://github.com/luisblafer/min-dsf)
