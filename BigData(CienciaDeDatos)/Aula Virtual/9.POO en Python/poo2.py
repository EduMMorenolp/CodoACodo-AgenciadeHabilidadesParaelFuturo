class Ascensor:
    # CARGAMOS LOS ATRIBUTOS COMUNES A TODOS LOS ASCENSORES DEL EDIFICIO
    pesoMax = 400
    pisoMin = -1
    pisoMax = 18

    # CARGAMOS LOS ATRIBUTOS ESPECÍFICOS POR MÉTODO CONSTRUCTOR
    def __init__(self, d, u, c):
        self.denominacion = d
        self.ubicacion = u
        self.cargaActual = c

    def chequear(self):
        if self.cargaActual <= self.pesoMax:
            habilitado = True            
        else:
            habilitado = False
            print(self.denominacion, 'con sobrecarga de', self.cargaActual - self.pesoMax, 'kg!')
        return habilitado

    def modificarCarga(self, peso):
        self.cargaActual += peso
        print('Carga actual de', self.denominacion, ':', self.cargaActual, 'kg.')

    def moverse(self, piso):
        if self.chequear():
            print(self.denominacion, 'inicia recorrido en el piso', self.ubicacion)
            self.ubicacion = piso
            print(self.denominacion, 'detiene su recorrido en el piso', self.ubicacion)


a1 = Ascensor('Unidad A', 10, 230)
a2 = Ascensor('Unidad B', 0, 455)
a3 = Ascensor('Unidad C', 5, 198)
a1.moverse(13)
a2.moverse(10)
a2.modificarCarga(-90)
a2.moverse(10)
a3.moverse(-1)