## Proyecto Base Gitz ##

Proyecto base que utilizamos en www.gitz.cl para crear nuestras aplicaciones.

## Instalación

La forma más simple de crear un nuevo proyecto utilizando esta plantilla es descargando directamente de github. Tienes que oprimir el botón **Download Zip** a mano derecha y luego descomprimir este archivo en tu computador.

## Configuración Variables de Ambiente

En todos los proyectos de **[Gitz](http://www.gitz.cl)** utilizamos variables de ambiante para almacenar la configuración de la aplicación.

Para configurar las variables de ambiente iniciales se tiene que copiar el archivo **Sample.env** y renombrarlo **.env**. La información guardada en este archivo no está sincronizado con github porque debiese ser única para cada desarrollador.

En el archivo **.env** se debe configurar la siguiente información:

**Datos Amazon S3**

Primero se debe crear un bucket especial en amazon para este proyecto http://aws.amazon.com

        S3_KEY: llave de S3
        S3_SECRET: llave secreta de S3
        S3_BUCKET_NAME: nombre del bucket creado para este proyecto
        S3_HOST_NAME: host S3 que utilizamos, no se debe cambiar a menos que el proyecto lo requiera.

**NOTA** Se debe revisar el Trello del proyecto para ver si ya están creadas estas claves. Deberían estar en la tarjeta "Claves App", en caso de no estar crear bajo la columna "Información General".

**Datos Sendgrid**

Se debe utilizar la cuenta de testeo que tenemos para esto proyecto en Sendgrid. Estos datos debiesen estar en el trello si no es así, crear. **NOTA** Utilizar tarjeta "Claves App".

        SENDGRID_USER_NAME: nombre de usuario de sendgrid
        SENDGRID_PASSWORD: clave de acceso a sendgrid
        SENDGRID_DOMAIN: dominio utilizado para sendgrid
        SENDGRID_ADDRESS: dirección de correo sendgrid
        SENDGRID_PORT: puerto smtp de sendgrid

**Datos Base de Datos**

Hay que modificar los datos puestos con la info de base de datos de este proyecto. Esta puesto una base de datos "gitz" por mientras, pero se debe cambiar eso a el nombre del proyecto para no hacer colisiones de BDs entre proyectos. 
**ejemplo: gitz_development => reforce_development.**

        DB_HOST_DEV: host de la base de datos desarrollo. En la mayoría de los casos no es necesario modificar.
        DB_NAME_DEV: nombre de la base de datos de desarrollo. Debería seguir la estructura: proyecto_development
        DB_HOST_TEST: host de la base de datos testeo. En la mayoría de los casos no es necesario modificar.
        DB_NAME_TEST: nombre de la base de datos de testeo. Debería seguir la estructura: proyecto_test
        
**Nombre de la Aplicación**

Se debe modificar el nombre de la aplicación, este se utiliza para paperclip y otras cosas. El nombre también debería no contener espacios, reemplazar por guíon bajo: **_**

        APP_NAME: nombre de la aplicación. Ejemplo: recheck

**Instalar Gemas**

Debes instalar y/o actualizar todas las gemas del proyecto con el comando

        bundle install

**Nota:** En este proyecto estamos utilizando la versión 2.1.2 de Ruby. Si no la tienes instalada el comando bundle no debería funcionar. Está este artículo de Thoughtbot que explica [como utilizar rbenv para manejar las versiones de ruby](http://robots.thoughtbot.com/using-rbenv-to-manage-rubies-and-gems).

**Configurar Base de Datos**

Utilizamos **[Postgres DB](http://www.postgresql.org/)** para nuestra base de datos. Para crear todas las tablas y poblar la base de datos con los usuarios administradores necesitas correr estos comandos:

    bundle exec run rake db:create
    bundle exec run rake db:migrate
    bundle exec run rake db:seed

**Iniciar el Servidor**

Para iniciar el servidor debes utilizar **foreman** y llamar el siguiente comando en la consola:

    foreman start -f Procfile.development