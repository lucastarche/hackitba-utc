# UTC - Únicamente Tenemos Código
Desarrollado por: Lucas Hernán Tarche, Ulises López Pacholczak y Juan Ignacio Cantarella.
Link al video de YouTube: https://youtu.be/gI6Sb9bOtF0

## Proyecto: Easy Web

Nuestra idea consiste en un  wrapper de navegador que provee una experiencia segura para personas mayores, que no necesariamente sean expertas en tecnología.
Debido a los incesantes ciberataques que se realizan en el día a día, decidimos crear una experiencia cuyo principal objetivo es proteger a sus usuarios.
Para lograr esto, reducimos el nivel de libertad al que puede acceder al usuario, ya que en un navegador tradicional, como por ejemplo Chrome, hay cientas de opciones irrelevantes para el usuario desentendido.
No solo esto, sino que pueden ser explotadas en su contra por un tercero, lo cual es un gran vector de riesgo para las personas mayores.

Mediante una novedosa combinación entre una _API_ que utiliza _Inteligencia Artificial_, un _Password Manager_, y un sistema de control parental, podemos mover las libertades a un usuario más experimentado, como en el caso de las personas mayores podría ser un hijo y/o nieto.
Para brindar una experiencia intuitiva y _user friendly_, utilizamos **Material Design**, un _toolkit_ creado por Google.

## Implementación

Para implementar nuestro primer prototipo, utilizamos principalmente **Flutter** en conjunción con **Material UI**.
Para poder correr HTML, CSS y JavaScript en una app nativa utilizamos **WebView**. Además, utilizamos **CheckPhish**, que es una API que utiliza inteligencia artificial para detectar sitios fraudulentos.

## Funcionalidades

- Wrapper de Web Browser
- API para la detección de phishing con IA (CheckPhish)
- Sistema de usuarios de control familiar
- Abrir hipervínculos externos a la aplicación
- Sistema intuitivo de páginas frecuentemente utilizadas

## TODO

- Hostear sistema de usuarios en la nube. Actualmente es local
- Terminar de implementar las funciones de abrir hipervínculos en IOS
- Mejorar el código nativo de Android para poder acceder a la URL completa al momento de clickear un hipervínculo
