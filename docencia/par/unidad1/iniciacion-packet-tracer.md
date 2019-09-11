---
layout: page
title: Actividad 1. Iniciación a Packet Tracer
---


El **objetivo** de esta actividad guiada es coger soltura usando **packet tracer**. Packet tracer es una potente herramienta didáctica de Cisco para aprender redes.

El **resultado final**, y que iremos haciendo paso a paso, será la siguiente red:
![Resultado final actividad](/docencia/par/unidad1/img/resultado.png){:class="img-responsive"}

Todos los dispositivos van a pertenecer a la red *192.168.1.0/24*. Eso quiere decir que todos tendrán una ip que será del tipo *192.168.1.X*, donde X es un número entre 1 y 255.

## Índice de contenidos
- [1. Configurar ip de cada uno de los equipos](#1-configurar-ip-de-cada-uno-de-los-equipos)
- [2. Conexiones](#2-conexiones)
- [3. Configuración IP](#3-configuraci-n-ip)
- [4. Configurar un servidor web en el servidor](#4-configurar-un-servidor-web-en-el-servidor)
- [5. Lo que se pide](#5-lo-que-se-pide)

<a name="1-configurar-ip-de-cada-uno-de-los-equipos"></a>
## 1. Configurar ip de cada uno de los equipos

* Haz doble click en el primer equipo (el de más a la izquierda). Aparece un diálogo donde lo primero que se muestra es un esquema de la parte trasera de un equipo y sus conexiones:
![Conexiones de un equipo físico](/docencia/par/unidad1/img/interfaces.png){:class="img-responsive"}     

* Unas conexiones son intercambiables (como la tarjeta de red), y otras no.
* En la pestaña **Config**, apartado **Global** -> **Settings**, podemos cambiarle:
    * El **nombre mostrado**: ponle PC-Alumno 1
        * Gateway/DNS ipv4
            * Gateway: Ip por la que sales de la red. Lo dejamos en blanco por ahora
            * DNS: servidor de resolución de nombres. Lo dejamos en blanco por ahora
        ![Configuración global](/docencia/par/unidad1/img/configuracion_global.png){:class="img-responsive"} 
    
    * En **Config**-->**Interface**, podemos ver las distintas interfaces de red: Bluetooth, Ethernet..., centrémonos en la FastEthernet0, que es la única tarjeta o interfaz de red que tiene nuestro PC.
        * **MAC Address**: Dirección MAC o dirección física
        * **IP Configuration:**
            * **DHCP**: asignada automáticamente por un servidor DHCP
            * **Static**: la ponemos nosotros manualmente. 
        ![Configuración de una interfaz](/docencia/par/unidad1/img/configuracion_interfaz.png){:class="img-responsive"}
        **OJO!!** Cuando configures las interfaces de un router, tienes que activarlas a mano:
        ![Activar la interfaz de un router](/docencia/par/unidad1/img/interfaces_router.png)

    
    * La pestaña **Desktop** la veremos más adelante. Se trata del software que en principio trae instalado el ordenador.

<a name="2-conexiones"></a>
## 2. Conexiones
Sirven para unir los nodos. Son los cables.
![Selección de conexiones](/docencia/par/unidad1/img/conexiones.png)
Primero seleccionamos la categoría **‘Connections’** , y luego el tipo de cable que necesitemos. Por ahora vamos a usar el automático (rayo naranja y amarillo) que se ocupa por nosotros de seleccionar el tipo de cable más adecuado.

Unimos todos los nodos para que quede como la figura siguiente:
![Resultado final actividad](/docencia/par/unidad1/img/resultado.png){:class="img-responsive"}

**Nota**: Recuerda que las interfaces de los routers hay que activarlas a mano. Si la interfaz Gig0/0/0 te sale con un punto rojo, deberías revisar que esté conectada.

<a name="3-configuraci-n-ip"></a>
## 3. Configuración IP
Queremos que todas las máquinas pertenezcan a la red **192.168.1.0/24**. Esto lo veremos con más detalle en unidades posteriores, pero como adelanto, esto significa que todos los nodos (Pcs, switches, routers, …) van a tener una IP del tipo *192.168.1.X*, donde X es un número entre 0 y 255.

Aquí hay que precisar una cosa muy importante: **las direcciones IP se dan a una interfaz de red** (o tarjeta de red, como quieras) **y no al dispositivo en sí**. Esto significa que si un PC tiene 2 tarjetas de red, podemos asignarle 2 IPs. Un router, por ejemplo, sirve para separar redes y encaminar entre ellas, así que lo normal es que cada una de sus interfaces de red esté en una red distinta (por ejemplo, una en la 192.168.1.0/24, otra en la 192.168.5.0/24). En este caso, es obvio que a cada interfaz hay que asignarle una dirección IP correspondiente a la red a la que pertenece.

**Nota importante:**

En este rango de direcciones entre la 0 y la 255 *(192.168.1.0 – 192.168.1.255)* hay varias **direcciones reservadas**:

* **192.168.1.0**: la primera del rango, la 0, no puede asignarse a ningún nodo de la red. Se usa para nombrar o denominar a la red. De ahí lo de 192.168.1.0/24
* **192.168.1.255**: es decir, la última del rango,. Tampoco puede asignarse a ninguna máquina. Es la dirección de broadcast de la red. Es decir, una IP especial usada para referirse a todos los dispositivos de nuestra red. En teoría podrías hacer un:
    ```bash
    ping -b 192.168.1.255 
    ```
    para hacer **ping** a todas las máquinas de tu red, pero las máquinas suelen ignorarlo. Piensa que sería una manera sencilla de colapsar una red.
* **192.168.1.1**: Ésta sí que puede asignarse a un nodo de la red, aunque como convención y como buena práctica, suele asignarse al router de nuestra red (mejor dicho, a la interfaz que el router tenga en nuestra red



Por ahora, nosotros vamos a establecer las Ips de los nodos de la red de **manera estática**, o sea a mano. Sin embargo, en el mundo real (la red de tu casa, o de clase, o del trabajo) esto se hace de **manera automática** a través de un protocolo llamado **DHCP**, que veremos más adelante.

Resumiendo, hemos de tener algo así:
* la **denominación de nuestra red** es 192.168.1.0/24 
* La **IP del PC-Alumno 1** será 192.168.1.10
* La **IP del Servidor** será 192.168.1.20
* La **IP del portátil**, será la 192.168.1.30
* La **IP de la interfaz Gig0/0/0** del router será la 192.168.1.1

Para _probar que las máquinas de la red tienen conectividad, vamos a hacer un ping entre ellas_. Para ello, haz doble clic sobre el PC-Alumno 1, y ve a la pestaña Desktop, y una vez aquí, haz clic en el icono **Command promt**:
![Desktop - command promt](/docencia/par/unidad1/img/desktop.png){:class="img-responsive"}

Te aparecerá una shell o consola. Escribe en ella el comando:
```bash
ping 192.168.1.30
```

Si recuerdas, la IP **192.168.1.130** era la del *portátil*. Lo que está haciendo este comando es hacer ping desde la máquina actual (la del Alumno-01) al portátil. El comando ping está basado en el protocolo ICMP (que veremos más adelante, xD) y básicamente manda una señal muy sencilla al portátil, para que este te responda con un eco. Se usa mucho para comprobar que una máquina está levantada. 

Si todo ha ido bien, el portátil debe haberte respondido al ping correctamente. En concreto, mandas 4 mensajes de 32 bits, por eso, en el resultado puedes ver 4 respuestas:
![Command promt](/docencia/par/unidad1/img/ping_promt.png){:class="img-responsive"}

Prueba a hacer ping entre el resto de máquinas, y a la interfaz **Gig0/0/0** del router para comprobar que todo esté ok.

<a name="4-configurar-un-servidor-web-en-el-servidor"></a>
## 4. Configurar un servidor web en el servidor
El nodo **servidor** en packet tracer se puede configurar para que ejecute distintos servicios. Por aclarar, el **servidor** es la máquina física (un ordenador básicamente), que ejecuta programas a los que puede accederse desde fuera a través de un número de puerto (lo veremos más adelante). A esos programas, los llamaremos **servicios**.
Por ejemplo, un **servicio web o http**, es un programa que si lo invocas desde un cliente (por ejemplo, usando un navegador desde el PC-Alumno-01 y conectándote a la dirección 192.168.1.20/index.html) el te devuelve el código html de esa página para que tu navegador lo renderice y la pinte.
Si te fijas en la pestaña *Services* del servidor, además del servicio http, tenemos otros:
![Command promt](/docencia/par/unidad1/img/congiguracion_servidor_http.png){:class="img-responsive"}

Packet tracer te permite editar estos archivos .html. Pulsa *edit*, donde pone index.html, y sustituye su contenido por el siguiente:

```html
<html>
    <head>
        <title>Servidor web de packet tracer</title>
    </head>
    <body>
        <h1>Planificación y Administración de Redes</h1>
        <h2>Primero de ASIR</h2>
        <hr>
        <p>Esta es una página de prueba servida por nuestro servidor web en packet tracer.</p>
        <p>Quick Links:
            <ul>        
                <li><a href='helloworld.html'>A small page</a></li>
                <li><a href='copyrights.html'>Copyrights</a></li>
                <li><a href='image.html'>Image page</a></li>
                <li><a href='cscoptlogo177x111.jpg'>Image</a></li>
            </ul>
        </p>
    </body>
</html>
```
De manera que si te vas al PC-Alumno-01, y en la pestaña desktop pulsas en **Browser**:
![Command promt](/docencia/par/unidad1/img/desktop_webbrowser.png){:class="img-responsive"}

Se abre el navegador. Si navegas a _http://192.168.1.20_, obtienes el siguiente resultado:
![Command promt](/docencia/par/unidad1/img/desktop_webbrowser2.png){:class="img-responsive"}
 
<a name="5-lo-que-se-pide"></a>
## 5. Lo qué se pide
Para que esta actividad sea considerada válida, **tienen que cumplirse los siguientes requisitos**:
1. Debe ser la misma red que la que propone la actividad.
2. Los nombres de las máquinas deben ser los mismos.
3. Las IPs de las máquinas deben ser las solicitadas.
4. Las máquinas deben poder hacer ping entre sí.
5. Debo poder conectarme desde un navegador en el equipo **PC-Alumno 1** al servidor (192.168.1.20) y debe mostrarse el html modificado.