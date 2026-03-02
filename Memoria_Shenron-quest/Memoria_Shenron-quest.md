
# Shenron-Quest       
### Desarrollo de un videojuego de plataformas 2D utilizando Godot Engine

---

**Autor:**   
**Asignatura:** Desarrollo de Videojuegos  
**Titulación:** Desarrollo de Aplicaciones Multiplataforma (DAM)  
**Motor de desarrollo:** Godot Engine  
**Lenguaje de programación:** GDScript  

---

## Introducción

El desarrollo de videojuegos se ha consolidado como una disciplina interdisciplinaria que integra programación, diseño gráfico, interacción humano-computadora y narrativa digital. En el contexto educativo, el desarrollo de videojuegos permite aplicar conocimientos de programación, diseño de software y creatividad digital para construir sistemas interactivos complejos.

El presente trabajo describe el desarrollo de **Shenron-Quest**, un videojuego de plataformas en dos dimensiones desarrollado mediante el motor **Godot Engine**. El objetivo del proyecto ha sido diseñar e implementar un prototipo funcional que incorpore diferentes sistemas propios del desarrollo de videojuegos, tales como el control de personajes, animaciones, detección de colisiones, gestión de cámara, menús interactivos y sistemas de recolección de objetos.

El videojuego se inspira en la estética y narrativa del universo de *Dragon Ball*, combinando una ambientación retro basada en **pixel art** con mecánicas clásicas de videojuegos de plataformas. Este enfoque permite recrear una experiencia de juego sencilla pero funcional, siguiendo principios básicos del diseño de videojuegos (Schell, 2019).

Además de su componente técnico, el proyecto ha sido desarrollado aplicando herramientas de control de versiones como **Git**, lo cual permite gestionar el trabajo colaborativo y mantener un registro del desarrollo del proyecto (Chacon & Straub, 2014).

---

## Desarrollo

### Conceptualización del videojuego

#### Idea general

**Shenron-Quest** es un videojuego de plataformas 2D en el que el jugador controla al personaje de **Goku**, quien debe explorar diferentes escenarios para recuperar las **esferas del dragón**. Durante su recorrido, el jugador deberá superar obstáculos, evitar enemigos y recoger elementos coleccionables distribuidos por el nivel.

El objetivo principal del juego consiste en avanzar por el escenario mientras se recolectan objetos y se superan los distintos desafíos que presenta el entorno. Esta mecánica se inspira en los videojuegos de plataformas clásicos, donde el progreso se basa en la exploración del nivel y en la habilidad del jugador para superar los obstáculos.

#### Mecánicas principales

El videojuego implementa diferentes mecánicas que constituyen la base de su jugabilidad:

- Movimiento lateral del personaje.
- Sistema de salto.
- Animaciones dinámicas del personaje.
- Interacción con el entorno.
- Detección de colisiones.
- Recolección de objetos coleccionables.
- Sistema de menús y gestión del flujo del juego.

Estas mecánicas responden a principios básicos del diseño de videojuegos, donde el objetivo es ofrecer una interacción clara e intuitiva para el jugador (Schell, 2019).

---

### Arte y recursos gráficos

#### Estilo visual

El estilo visual del videojuego se basa en **pixel art**, una técnica ampliamente utilizada en videojuegos retro y en proyectos independientes. Este estilo gráfico permite construir personajes y escenarios mediante píxeles claramente definidos, lo cual facilita la creación de animaciones y reduce la complejidad de los recursos gráficos necesarios.

El uso de pixel art también contribuye a generar una estética nostálgica que recuerda a los videojuegos clásicos de consolas de los años noventa.

#### Recursos gráficos utilizados

Los recursos gráficos utilizados en el proyecto incluyen:

- Sprites del personaje principal (Goku).
#### Ejemplo de spritesheet del personaje

El siguiente spritesheet muestra diferentes **frames de animación del personaje principal**. 
Cada frame representa una fase distinta del movimiento del personaje y permite crear animaciones fluidas dentro del motor de juego.

<p align="center">
  <img src="imagenes/animacion_goku.png" width="500">
</p>

**Características del spritesheet:**

- Contiene múltiples **frames de animación** en una única imagen.
- Cada frame representa una posición distinta del movimiento del personaje.
- Permite generar animaciones como:
  - correr
  - saltar
  - atacar
  - movimiento lateral
- Este tipo de recurso se utiliza ampliamente en videojuegos **2D basados en pixel art**, ya que facilita la gestión de animaciones dentro del motor de juego.

Dentro de **Godot Engine**, estos sprites se utilizan mediante el nodo **AnimatedSprite2D**, que permite dividir el spritesheet en diferentes frames y reproducir las animaciones correspondientes.



- Spritesheets con múltiples animaciones.
- Tilesets para la construcción del escenario.
- Fondos del entorno.
- Elementos decorativos.
- Recursos gráficos para la interfaz de usuario.

Los sprites del personaje se organizan en **spritesheets**, que contienen múltiples frames dentro de una misma imagen. Este enfoque permite optimizar el rendimiento del juego y facilitar la creación de animaciones.

---

### Programación e implementación

#### Motor de desarrollo

El videojuego ha sido desarrollado utilizando **Godot Engine**, un motor de videojuegos open source que permite crear videojuegos en dos y tres dimensiones. Godot utiliza una arquitectura basada en **nodos y escenas**, lo que facilita la organización modular de los elementos del juego (Godot Engine, 2024).

Cada escena puede contener múltiples nodos que representan diferentes componentes del juego, como personajes, cámaras o elementos del entorno.

#### Arquitectura del proyecto

El proyecto se organiza mediante una estructura de carpetas que permite separar los diferentes componentes del videojuego. Una estructura simplificada del proyecto sería la siguiente:

```mermaid
graph TD
    A["Shenron Quest"]

    A --> B["player"]
    B --> B1["img"]
    B --> B2["Timer"]

    A --> C["environment"]

    A --> D["coleccionables"]
    D --> D1["img"]

    A --> E["floor"]
    E --> E1["img"]
    E1 --> E2["LPC_Modified_Art"]

    A --> F["fondo"]

    A --> G["menu"]
    G --> G1["img"]

    A --> H["menu_muerte"]
    H --> H1["img"]

    A --> I["addons"]
    I --> J["godot_git_plugin"]
    J --> J1["linux"]
    J --> J2["macos"]
    J --> J3["windows"]
```

Esta organización permite mantener una estructura clara del proyecto y facilita el mantenimiento del código.

---

### Desarrollo del personaje

El personaje principal del videojuego se implementa mediante una escena compuesta por varios nodos. Entre los nodos más importantes se encuentran:

- **CharacterBody2D**, que gestiona la física del personaje.
- **AnimatedSprite2D**, encargado de mostrar las animaciones.
- **CollisionShape2D**, que define la forma de colisión del personaje.
- **Camera2D**, que permite que la cámara siga al jugador.

Esta estructura permite separar las diferentes responsabilidades del personaje dentro del motor de juego.

---

### Sistema de movimiento

El movimiento del personaje se implementa mediante scripts escritos en **GDScript**, el lenguaje de programación propio de Godot. Este sistema gestiona diferentes variables como la velocidad horizontal, la gravedad y la capacidad de salto.

El script del jugador se encarga de interpretar las entradas del teclado y transformar estas acciones en movimientos dentro del juego.

---

### Sistema de animaciones

El personaje dispone de múltiples animaciones que se activan dependiendo del estado del jugador. Entre las animaciones implementadas se encuentran:

- Idle (reposo)
- Run (correr)
- Jump (saltar)
- Attack (ataque)
- Dead (muerte)

El cambio entre animaciones se realiza de forma automática según el estado del personaje, lo que permite mejorar la sensación de fluidez en el movimiento.

---

### Gestión de colisiones

Las colisiones dentro del juego se gestionan mediante nodos de tipo **CollisionShape2D** y mediante los **TileMaps** del escenario. Estos elementos permiten definir qué partes del entorno son sólidas y cuáles funcionan únicamente como decoración.

La correcta configuración de las capas de colisión es fundamental para evitar problemas como que el personaje atraviese el suelo o interactúe incorrectamente con los objetos del entorno.

---

### Diseño del nivel

El diseño del nivel se realiza utilizando **TileSets**, que permiten construir escenarios reutilizando diferentes piezas gráficas. Esta técnica es ampliamente utilizada en videojuegos de plataformas, ya que facilita la creación de escenarios complejos de forma eficiente.

El uso de TileSets permite combinar elementos del entorno como plataformas, obstáculos y elementos decorativos dentro de un mismo escenario.

---

### Sistema de cámara

El videojuego utiliza una **Camera2D** asociada al personaje principal. Este sistema permite que la cámara siga automáticamente al jugador durante su desplazamiento por el escenario, manteniendo siempre visible la zona relevante del juego.

---

### Sistema de coleccionables

Uno de los elementos clave del videojuego es la recolección de **esferas del dragón**, que funcionan como objetos coleccionables. Cuando el jugador entra en contacto con uno de estos objetos, se activa un evento que incrementa un contador y elimina el objeto del escenario.

Este sistema se implementa mediante señales y detección de colisiones.

---

### Sistema de menús

El videojuego incorpora diferentes interfaces de usuario que permiten gestionar el flujo del juego:

- Menú principal
- Menú de muerte o derrota
- Interfaz de juego

Estos menús permiten reiniciar el juego, salir del mismo o volver al menú principal.

---

## Conclusión

El desarrollo de **Shenron-Quest** ha permitido aplicar conocimientos fundamentales del desarrollo de videojuegos utilizando el motor Godot. A lo largo del proyecto se han implementado diferentes sistemas que forman parte de la arquitectura básica de un videojuego, incluyendo el control del personaje, el diseño de niveles, la gestión de animaciones y la interacción entre distintos elementos del entorno.

Además, el proyecto ha permitido experimentar con herramientas de control de versiones y metodologías de trabajo colaborativo, aspectos fundamentales en el desarrollo de software.

En conjunto, el proyecto demuestra cómo es posible desarrollar un prototipo funcional de videojuego integrando elementos de programación, diseño visual e interacción con el usuario.

---

## Referencias


Fullerton, T. (2018). *Game Design Workshop: A Playcentric Approach to Creating Innovative Games* (4th ed.). CRC Press.  

Godot Engine. (2024). *Godot Engine Documentation*. https://docs.godotengine.org  

Rogers, S. (2014). *Level Up! The Guide to Great Video Game Design* (2nd ed.). Wiley.  
