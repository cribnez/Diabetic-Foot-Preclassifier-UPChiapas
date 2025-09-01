host = 'localhost';  % Dirección del servidor MySQL
port = 3306;  % Puerto de conexión
username = 'tu_usuario';  % Nombre de usuario de MySQL
password = 'tu_contraseña';  % Contraseña de MySQL
databaseName = 'nombre_base_de_datos';  % Nombre de la base de datos

% Establecer la conexión
conn = database(databaseName, username, password, 'Vendor', 'MySQL', 'Server', host, 'Port', port);



% Obtener la pregunta y respuesta del usuario
pregunta = app.PreguntaEditField.Value;
respuesta = app.RespuestaEditField.Value;

% Construir la consulta de inserción
insertQuery = ['INSERT INTO ', tableName, ' (pregunta, respuesta) VALUES (''', pregunta, ''', ''', respuesta, ''');'];

% Ejecutar la consulta de inserción
exec(conn, insertQuery);
