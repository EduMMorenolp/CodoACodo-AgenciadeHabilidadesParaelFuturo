# CREAMOS LA CLASE
class SerHumano:

    # MÉTODO DE CONSTRUCTOR (INICIALIZACIÓN)
    def __init__(self, nom, edad, alt, peso, dist):
        self.nombre = nom
        self.edad = edad
        self.altura = alt
        self.peso = peso
        self.distancia = dist

    # MÉTODO MOVERSE
    def moverse(self, pasos):
        self.distancia += pasos
        print(self.nombre, 'ahora está a', self.distancia, 'pasos de la puerta.')

p1 = SerHumano('Juan',23,1.80,78,120)
p1.moverse(-60)




