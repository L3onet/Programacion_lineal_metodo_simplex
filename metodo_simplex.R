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
funcion_objetivo
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
restriccion.direccion
# Asignar los valores del lado derecho de las desiguldades
# 6x1 + 8x2  <= 750         750       (1)
# x1         <= 100         100       (2)
#         x2 <= 250         250       (3)
lado_derecho.restriccion <- c(750, 100, 250)
lado_derecho.restriccion
# Se ejecuta la instrucci�n para mostrar el resultado que maximize la funci�n
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)

# Se ejecuta la instrucci�n para mostrar los valores de x1 y x2.
lp(direction = "max", objective.in = funcion_objetivo, const.mat =restriciones_derecho, const.dir = restriccion.direccion, const.rhs = lado_derecho.restriccion, int.vec = c(1, 2, 3, 4, 5), all.int = T)$solution

# Argumentos m�s usados: 

# direction: Variable cadena de caracteres que indica la direcci�n de optimizaci�n:
# "min" (por defecto) o "max". 

# objective.in: Vector num�rico con los coeficientes de la funci�n objetivo. 

# const.mat: Matriz con los coeficientes num�ricos de las restricciones, una fila por
# restricci�n, una columna por variable (a menos que transpose.constraints = FALSE; ver 
# m�s adelante) 

# const.dir: Vector de cadenas de caracteres que indica la direcci�n de las restricciones.
# Los valores pueden ser "<", "<=", "= ", ">" o ">=". 

# const.rhs: Vector con los valores num�ricos del lado derecho de las restricciones

# transpose.constraints: Por defecto cada restricci�n ocupa una fila de const.mat, y tal
# matriz necesita trasponerse antes de pasar al c�digo de optimizaci�n. Cuando se tiene un
# tama�o grande de matrices de restricciones es aconsejable construir la matriz de
# restricciones por columnas. En tal caso, se debe poner transpose.constraints= FALSE. 

# int.vec: Vector num�rico que da los �ndices de las variables que deben ser enteras. La
# longitud de este vector debe ser igual al n�mero de variables enteras.

# compute.sens: Valor num�rico, respuesta a la pregunta �calculo sensibilidad? Si es un
# valor distinto de cero, calcula la sensibilidad. Por defecto vale cero.

# binary.vec: Vector num�rico como int.vec que da los �ndices de las variables que
# deben ser binarias.

# all.int: Car�cter l�gico: Respuesta a la pregunta �son todas la variables enteras? Por
# defecto: FALSE. 

# all.bin: Car�cter l�gico: Respuesta a la pregunta �son todas la variables binarias? Por
# defecto: FALSE. 

# Valor: Un objeto de clase lp, una lista que contiene, entre otros, los siguientes elementos:
# direction: La direcci�n de optimizaci�n del problema

# x.count: N�mero de variables en la funci�n objetivo

# objective: Vector con los coeficientes de la funci�n objetivo

# const.count: N�mero de restricciones

# constraints: Matriz de tasas de uso

# int.count: N�mero de variables enteras

# int.vec: Vector con los �ndices de las variables enteras

# bin.count: N�mero de variables binarias

# binary.vec: Vector con los �ndices de las variables binarias

# objval: Valor �ptimo de la funci�n objetivo

# solution: Vector con los valores �ptimos

# compute.sens: Proporciona el valor num�rico a la pregunta �calculo sensibilidad?
# que se dio en la llamada a la funci�n. Si es un valor distinto de cero, el objeto contiene
# los resultados del an�lisis de sensibilidad.

# sens.coef.from: Proporciona los l�mites inferiores de los intervalos de variaci�n de
# los coeficientes de la funci�n objetivo, para que la soluci�n proporcionada siga siendo
# �ptima.

# sens.coef.to: : Proporciona los l�mites superiores de los intervalos de variaci�n de los
# coeficientes de la funci�n objetivo, para que la soluci�n proporcionada siga siendo
# �ptima.

# duals: Proporciona los valores de los costos reducidos en la tabla �ptima del Simplex.

# duals.from: Proporciona los l�mites inferiores de los intervalos de variaci�n de los
# coeficientes de la funci�n objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la soluci�n proporcionada siga siendo �ptima.

# duals.to: Proporciona los l�mites superiores de los intervalos de variaci�n de los
# coeficientes de la funci�n objetivo del problema dual (o equivalentemente, de los
# recursos del problema primal), para que la soluci�n proporcionada siga siendo �ptima.

# status: N�mero que indica: 0= �xito, 2=soluci�n no factible, 3=soluci�n no acotada. 