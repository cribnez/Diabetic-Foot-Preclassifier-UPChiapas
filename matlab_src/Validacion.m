% Obtener las predicciones para el conjunto de validación
fotPreds = classify(netfot, augmentedValidationSet);

% Representar la pérdida de entrenamiento
figure;
plot(info.TrainingLoss);
xlabel('Época');
ylabel('Pérdida');
title('Pérdida de entrenamiento');

% Obtener las etiquetas reales del conjunto de validación
fotactual = imdsValidation.Labels;

% Calcular el número de predicciones correctas
numCorrect = nnz(fotPreds == fotactual);

% Calcular la fracción de predicciones correctas
fracCorrect = numCorrect / numel(fotPreds);

% Mostrar el número de predicciones correctas y la fracción de predicciones correctas
fprintf('Número de predicciones correctas: %d\n', numCorrect);
fprintf('Fracción de predicciones correctas: %.2f\n', fracCorrect);

% Crear una matriz de confusión
confusionchart(fotactual, fotPreds);
