# Ejercicio de programación lineal

## Usando el método simplex

Instalar los paquetes
```
> install.packages("lpSolve")
```

Ejemplo:
Una distribuidora de vehiculos vende principalmente 2 marcas de autos
(alemana y estadounidense), obteniendo en promedio los siguientes datos
por venta (expresado en miles):

|Producto | Costo/auto | Precio/auto | Tiempo/auto (hrs) |
| ------------- | ------------- |------------- |------------- |
|Autos (Alemania) | 150 | 300 |6 |
|Autos (EUA) | 230 | 450 | 8 |

Si el proveedor de la distribuidora solo puede entregar un máximo de 100
autos alemanes y 250 estadounidenses, y la distribuidora requiere de 6
horas por auto alemán y 8 horas por auto estadounidense para revisarlos y
ponerlos a la venta. ¿Qué cantidad de cada tipo de auto debe ordenarse
para obtener la mayor utilidad posible, tomando en cuenta que el tiempo
total mensual de revisión a los autos no puede exceder de 750 horas?