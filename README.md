# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  
    3.0.0

* System dependencies
    gem 'awesome_print'
    gem 'will_paginate'

* Configuration

    bundle instal -> instalcion y configuracion de proyecto
    rails db:migrate -> ejecutar las migraciones

* Database creation
    - Base de datos basada en postgresSQL
        rails db:create -> crear la base de datos
    -Nombre de la base de datos: reto_frogmi_development reto_frogmi_test

* initialization
    - Rails s -> inicializar el proyecto

* Services (job queues, cache servers, search engines, etc.)
    - Cuenta con una tarea de consulta e insercion de datos
    Ejecucion de tarea
    - rails frogmi:feature_USGS  -> ejecuta la tarea

* Enpoints
- Metodo GET : http://127.0.0.1:3000/api/features?page=1&per_page=10  -> listara data almacenada en base de dato, filtra si los datos estan, y actua segun su paginacion

- Metodo GET : http://127.0.0.1:3000/api/features/list_features  -> lista toda la informacion obtenida del servicio externo

- Metodo POST : http://127.0.0.1:3000/api/features -> Almacena los datos obtenidos del servicio externo 

- Metodo PUT : http://127.0.0.1:3000/api/features/id_feature -> crea y actualiza comentarios

* Adjunto documento postman
- direccion de carpeta public/reto-frogmi.postman_collection.json