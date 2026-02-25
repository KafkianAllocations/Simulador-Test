# ⚙️ Equipo 65 Game Development / Proyecto - Justina Robot Simulator 🦾

[![Godot Engine](https://img.shields.io/badge/Godot_Engine-4.x-blue?logo=godotengine)](https://godotengine.org/)

## 📝 Tabla de Contenidos

1.  [Problema](#problema)
2.  [Descripción](#descripción)
3.  [Características y Objetivos Clave](#características-y-objetivos-clave)
4.  [Impacto](#impacto)
5.  [Entrega Esperada](#entrega-esperada)
6.  [Cómo Empezar con el Proyecto Godot 🎮](#cómo-empezar-con-el-proyecto-godot-🎮)
    *   [Paso 1: Abrir el Proyecto](#paso-1-abrir-el-proyecto)
    *   [Paso 2: Ejecutar la Escena Principal](#paso-2-ejecutar-la-escena-principal)
    *   [Controles Actuales del Brazo Robótico](#controles-actuales-del-brazo-robótico)

---

## Problema

El desarrollo de robots quirúrgicos enfrenta una barrera clave en sus etapas tempranas: la falta de herramientas digitales que permitan simular procedimientos, evaluar la interacción humano-robot y validar decisiones de diseño antes de construir hardware complejo y costoso. Actualmente, muchas decisiones críticas se toman sin entornos de simulación accesibles, lo que aumenta el riesgo técnico, clínico y económico del desarrollo.

## Descripción

Somos un equipo académico-tecnológico que está evaluando la factibilidad de desarrollar **Justina**, un robot asistido para cirugía renal mínimamente invasiva. En esta etapa temprana, no buscamos construir el robot físico, sino entender mejor el problema clínico, la experiencia del usuario (cirujano) y las oportunidades donde el software, la simulación y la inteligencia artificial pueden agregar valor real.

El desafío propone desarrollar una plataforma digital de simulación y entrenamiento, orientada a representar procedimientos quirúrgicos de forma abstracta, permitiendo:

-   Simular interacciones entre un operador humano y un sistema robótico conceptual.
-   Explorar interfaces de control, visualización y feedback.
-   Registrar métricas básicas de desempeño (trayectorias, tiempos, errores).
-   Servir como herramienta de validación temprana con médicos y decisores de salud.

El foco está en **software, UX, simulación e IA**, sin requerir conocimientos de robótica física ni hardware real. El resultado esperado es un prototipo funcional que nos permita tomar mejores decisiones de diseño, comunicar el proyecto a stakeholders clínicos e industriales, y sentar las bases para futuras etapas de desarrollo.

Este proyecto es ideal para desarrolladores interesados en impacto real, tecnología aplicada a la salud, simulación, interfaces avanzadas y trabajo interdisciplinario.

## Características y Objetivos Clave

*   **Simulación de Interacción:** Capacidad de simular la interacción entre un operador humano y un sistema robótico conceptual.
*   **Exploración de Interfaces:** Herramientas para explorar y validar interfaces de control, visualización y feedback.
*   **Registro de Métricas:** Funcionalidad para registrar métricas de desempeño esenciales como trayectorias, tiempos y errores.
*   **Validación Temprana:** Servir como una herramienta de validación con profesionales médicos y decisores de salud en etapas iniciales.
*   **Foco en Software:** Énfasis en desarrollo de software, UX, simulación e inteligencia artificial, sin dependencia de hardware físico.

## Impacto

El principal impacto de este proyecto se centra en la **Experiencia de Usuario (UX/UI)**, proveyendo una herramienta intuitiva y eficaz para la simulación y validación de procedimientos quirúrgicos asistidos por robot. Esto permitirá:

*   **Reducción de Riesgos:** Minimizar riesgos técnicos, clínicos y económicos en el desarrollo de robots quirúrgicos.
*   **Diseño Centrado en el Usuario:** Validar decisiones de diseño de forma temprana, enfocándose en la experiencia del cirujano.
*   **Comunicación Efectiva:** Facilitar la comunicación del proyecto a stakeholders clínicos e industriales.

## Entrega Esperada

Un **MVP (Minimum Viable Product)** del simulador que cumpla con los objetivos de simulación, control y registro de métricas básicas, sirviendo como una plataforma funcional para la validación temprana.

---

## Cómo Empezar con el Proyecto Godot 🎮

Para explorar y contribuir al simulador de Justina, sigue estos pasos:

### Paso 1: Abrir el Proyecto

1.  Abre el **Godot Engine** (versión 4.x o superior).
2.  En el gestor de proyectos de Godot, haz clic en **"Importar"** y selecciona la carpeta raíz de este proyecto (`Simulador-Test`).
3.  Una vez importado, ábrelo desde el gestor de proyectos.

### Paso 2: Ejecutar la Escena Principal

Es crucial que ejecutes la escena principal para una experiencia completa:

1.  En el editor de Godot, ve al panel "Sistema de Archivos".
2.  Navega hasta el archivo `Mundo.scn`.
3.  Haz doble clic en `Mundo.scn` para abrirlo en el editor de escenas.
4.  Haz clic en el botón **"Ejecutar Escena Actual"** (el icono con forma de película con un triángulo de "Play") en la parte superior derecha del editor. **¡No ejecutes el proyecto completo, solo la escena `Mundo.scn`!**

### Controles Actuales del Brazo Robótico

Actualmente, los brazos robóticos se controlan de la siguiente manera:

*   **Brazo Izquierdo:**
    *   Mantén presionado el **Click Izquierdo del Mouse** para mover, rotar y agarrar con el brazo izquierdo.
*   **Brazo Derecho:**
    *   Mantén presionado el **Click Derecho del Mouse** para mover, rotar y agarrar con el brazo derecho.

Estos controles son provisionales y están sujetos a cambios a medida que evolucionamos la interfaz de usuario y la experiencia de control.

---