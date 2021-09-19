# Ejemplo:
# Una distribuidora de vehiculos vende principalmente 2 marcas de autos
# (alemana y estadounidense), obteniendo en promedio los siguientes datos
# por venta (expresado en miles):

# Producto          Costo/auto    Precio/auto   Tiempo/auto (hrs)
# Autos (Alemania)  150           300           6
# Autos (EUA)       230           450           8

# Si el proveedor de la distribuidora solo puede entregar un máximo de 100
# autos alemanes y 250 estadounidenses, y la distribuidora requiere de 6
# horas por auto alemán y 8 horas por auto estadounidense para revisarlos y
# ponerlos a la venta. ¿Qué cantidad de cada tipo de auto debe ordenarse
# para obtener la mayor utilidad posible, tomando en cuenta que el tiempo
# total mensual de revisión a los autos no puede exceder de 750 horas?

# Resolución del problema de programación líneal a través del método gráfico

# Paso 1: Identificar las variables básicas
# x1 = Cantidad de autos alemanes a ordenarse c/mes 
# x2 = Cantidad de autos estadounidenses a ordenarse c/mes

# Paso 2: Identificar las variables "cj"
# c1 = $ 150/auto alemán   = Precio (300) - Costo (150)
# c2 = $ 220/auto e.u.a.   = Precio (450) - Costo (230)

# Paso 3: función objetivo
# Max z = ($150/A.A)(x1A.A.) + ($220/A.E)((x2A.E.)
# Max z = 150x1 + 220x2

# Paso 4: Identificar "bj"
# b1 = Capacidad máxima de envío mensual de autos alemanes (100).
# b2 = Capacidad máxima de envío mensual de autos e.u.a. (250).
# b3 = Tiempo máximo de revisión para el pedido mensual de autos (750)

# Paso 5: Identificar "aij"
# b3= Tiempo máximo de revisión para el pedido mensual de autos (750)
# * 6 horas de revisión para c/auto alemán
# * 8 horas de revisión para c/auto estadounidense

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

# Se guardan en una matriz los coeficientes de la función objetivo
funcion_objetivo <- c(150, 220)

# Asignar los coeficientes de las desigualdades
# 6x1 + 8x2  <= 750         6   8     (1)
# x1         <= 100         1   0     (2)
#         x2 <= 250         0   1     (3)
# Definir el número de filas en 3
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

# Se ejecuta la instrucción para mostrar el resultado que maximize la función
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucción para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

# Argumentos más usados: 

# direction: Variable cadena de caracteres que indica la dirección de optimización:
# "min" (por defecto) o "max". 

# objective.in: Vector numérico con los coeficientes de la función objetivo. 

# const.mat: Matriz con los coeficientes numéricos de las restricciones, una fila por
# restricción, una columna por variable (a menos que transpose.constraints = FALSE; ver 
# más adelante) 

# const.dir: Vector de cadenas de caracteres que indica la dirección de las restricciones.
# Los valores pueden ser "<", "<=", "= ", ">" o ">=". 

# const.rhs: Vector con los valores numéricos del lado derecho de las restricciones

# transpose.constraints: Por defecto cada restricción ocupa una fila de const.mat, y tal
# matriz necesita trasponerse antes de pasar al código de optimización. Cuando se tiene un
# tamaño grande de matrices de restricciones es aconsejable construir la matriz de
# restricciones por columnas. En tal caso, se debe poner transpose.constraints= FALSE. 

# int.vec: Vector numérico que da los índices de las variables que deben ser enteras. La
# longitud de este vector debe ser igual al número de variables enteras.

# compute.sens: Valor numérico, respuesta a la pregunta ¿calculo sensibilidad? Si es un
# valor distinto de cero, calcula la sensibilidad. Por defecto vale cero.

# binary.vec: Vector numérico como int.vec que da los índices de las variables que
# deben ser binarias.

# all.int: Carácter lógico: Respuesta a la pregunta ¿son todas la variables enteras? Por
# defecto: FALSE. 

# all.bin: Carácter lógico: Respuesta a la pregunta ¿son todas la variables binarias? Por
# defecto: FALSE. 

# Valor: Un objeto de clase lp, una lista que contiene, entre otros, los siguientes elementos:
# direction: La dirección de optimización del problema

# x.count: Número de variables en la función objetivo

# objective: Vector con los coeficientes de la función objetivo

# const.count: Número de restricciones

# constraints: Matriz de tasas de uso

# int.count: Número de variables enteras

# int.vec: Vector con los índices de las variables enteras

# bin.count: Número de variables binarias

# binary.vec: Vector con los índices de las variables binarias

# objval: Valor óptimo de la función objetivo

# solution: Vector con los valores óptimos

# compute.sens: Proporciona el valor numérico a la pregunta ¿calculo sensibilidad?
# que se dio en la llamada a la función. Si es un valor distinto de cero, el objeto contiene
# los resultados del análisis de sensibilidad.

# sens.coef.from: Proporciona los límites inferiores de los intervalos de variación de
# los coeficientes de la función objetivo, para que la solución proporcionada siga siendo
# óptima.

# sens.coef.to: : Proporciona los límites superiores de los intervalos de variación de los
# coeficientes de la función objetivo, para que la solución proporcionada siga siendo
# óptima.

# duals: Proporciona los valores de los costos reducidos en la tabla óptima del Simplex.

# duals.from: Proporciona los límites inferiores de los intervalos de variación de los
# coeficientes de la función objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la solución proporcionada siga siendo óptima.

# duals.to: Proporciona los límites superiores de los intervalos de variación de los
# coeficientes de la función objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la solución proporcionada siga siendo óptima.

# status: Número que indica: 0= éxito, 2=solución no factible, 3=solución no acotada. 