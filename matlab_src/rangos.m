% Definir el rango de temperatura
rango_temperatura = [20.1 37.9];

% Convertir el rango de temperatura a uint8
rango_uint8 = [0 255];

% Definir el rango de temperatura que quieres mapear al nuevo rango
rango_temperatura_a_mapear = [24.7 33.0];

% Mapear el rango de temperatura al nuevo rango en uint8
rango_uint8_mapeado = (rango_temperatura_a_mapear - rango_temperatura(1)) / (rango_temperatura(2) - rango_temperatura(1)) * (rango_uint8(2) - rango_uint8(1)) + rango_uint8(1);

% Asegurarse de que los valores no sean negativos
if any(rango_uint8_mapeado < 0)
    rango_uint8_mapeado = zeros(size(rango_uint8_mapeado));
end

% Visualizar el resultado
disp(['El rango de temperatura en uint8 para un rango de ' num2str(rango_temperatura_a_mapear) ' es [' num2str(rango_uint8_mapeado) '].']);