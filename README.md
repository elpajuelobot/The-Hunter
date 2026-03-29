 # The-Hunter

![banner-inicial](assets/banner.png)


Antes de empezar con la presentación de este framework, cabe recalcar que **esta herramienta está creada con fines educativos y su uso a un tercero sin consentimiento es ilegal, el creador del repositorio no se hace cargo de problemas legales con el uso indebido del framework.**


**The-Hunter** es un framework de simulación de vectores de ataque de ingeniería social. Está creado con el fin de ayudar a los trabajadores de ciberseguridad y los administradores de sistemas a enseñar el funcionamiento de estas webs fraudulentas y entrenar así a los demás en la detección de URLs maliciosas.


# Funcionamiento

Para el uso de esta herramienta, ha de seguir los siguientes pasos:


```bash

# Clonar el repositorio

git clone https://github.com/elpajuelobot/The-Hunter.git


# Entrar al directorio

cd The-Hunter


# Dar permisos y ejecutar el instalador

chmod +x install.sh

sudo ./install.sh

```


### Funcionamiento del `install.sh`:
  * **Desencriptar:** Extrae el contenido de `data.assets` (Contraseña: `password123`).
  * **Preparación:** Configura el entorno virtual y dependencias.
  * **Ejecución:** Lanza automáticamente `init.sh`. Para usos futuros, ejecutar directamente: `sudo ./init.sh`.


Antes de ejecutar el `install.sh`:


![before-install](assets/before-install.png)


Después de ejecutar el `install.sh`:


![after-install](assets/after-install.png)


# Notificaciones

Este framework cuenta con un sistema de notificaciones conectado con discord, usando las urls *Discord Webhooks*, recibirás una alerta en tiempo real cuando se incie un túnel enviándote la url o cuando se capture una interacción del laboratorio.


# Requisitos

*Python 3.10* o superior


*OS basado en linux.* Ej: Ubuntu, Arch, Kali, Parrot, Mint, etc.


*Conexión a internet* para la creación y funcionamiento del túnel. 

S4vi I ❤️ you
