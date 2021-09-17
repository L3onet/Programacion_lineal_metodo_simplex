# Ejemplo:
# Una distribuidora de vehiculos vende principalmente 2 marcas de autos
# (alemana y estadounidense), obteniendo en promedio los siguientes datos
# por venta (expresado en miles):

# Producto          Costo/auto    Precio/auto   Tiempo/auto (hrs)
# Autos (Alemania)  150           300           6
# Autos (EUA)       230           450           8

# Si el proveedor de la distribuidora solo puede entregar un m�ximo de 100
# autos alemanes y 250 estadounidenses, y la distribuidora requiere de 6
# horas por auto alem�n y 8 horas por auto estadounidense para revisarlos y
# ponerlos a la venta. �Qu� cantidad de cada tipo de auto debe ordenarse
# para obtener la mayor utilidad posible, tomando en cuenta que el tiempo
# total mensual de revisi�n a los autos no puede exceder de 750 horas?

# Resoluci�n del problema de programaci�n l�neal a trav�s del m�todo gr�fico

# Paso 1: Identificar las variables b�sicas
# x1 = Cantidad de autos alemanes a ordenarse c/mes 
# x2 = Cantidad de autos estadounidenses a ordenarse c/mes

# Paso 2: Identificar las variables "cj"
# c1 = $ 150/auto alem�n   = Precio (300) - Costo (150)
# c2 = $ 220/auto e.u.a.   = Precio (450) - Costo (230)

# Paso 3: funci�n objetivo
# Max z = ($150/A.A)(x1A.A.) + ($220/A.E)((x2A.E.)
# Max z = 150x1 + 220x2

# Paso 4: Identificar "bj"
# b1 = Capacidad m�xima de env�o mensual de autos alemanes (100).
# b2 = Capacidad m�xima de env�o mensual de autos e.u.a. (250).
# b3 = Tiempo m�ximo de revisi�n para el pedido mensual de autos (750)

# Paso 5: Identificar "aij"
# b3= Tiempo m�ximo de revisi�n para el pedido mensual de autos (750)
# * 6 horas de revisi�n para c/auto alem�n
# * 8 horas de revisi�n para c/auto estadounidense

# Paso 6: Armar restricciones
# (6 hrs/A.A.)(x1A.A.) + (8 hrs/A.E.)(x2A.E.)
# 6x1 + 8x2 <= 750

# Cantidad a ordenar de autos alemanes ??? 100 
# x1 <= 100

# Cantidad a ordenar de autos estadounidenses ??? 250 
# x2 <= 250

# Paso 7: No negatividad
# x1, x2 >= 0

# Paso 8: Modelo general
# Max z = 150x1 + 220x2
# s.a.
# 6x1 + 8x2 <= 750  (1)
# x1        <= 100  (2)
#       x2  <= 250  (3)
#
# x1, x2 >= 0

# Paso 9 Resolver el sistema

#
install.packages("lpSolve")

# Importar la libreria
library(lpSolve)

# Se guardan en una matriz los coeficientes de la funci�n objetivo
funcion_objetivo <- c(150, 220)

# Asignar los coeficientes de las desigualdades
# 6x1 + 8x2  <= 750         6   8     (1)
# x1         <= 100         1   0     (2)
#         x2 <= 250         0   1     (3)
# Definir el n�mero de filas en 3
restriciones_derecho <- matrix(c(6,8,1,0,0,1), nrow = 3, byrow = T)

# Se muestra el valor de la matriz
restriciones_derecho

# Se guarda en una matriz los simbolos de las desigualdades
restriccion.direccion <- c("<=", "<=", "<=")

# Asignar los valores del lado derecho de las desiguldades
# 6x1 + 8x2  <= 750         750       (1)
# x1         <= 100         100       (2)
#         x2 <= 250         250       (3)
lado_derecho.restriccion <- c(750, 100, 250)

# Se ejecuta la instrucci�n para mostrar el resultado que maximize la funci�n
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucci�n para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

