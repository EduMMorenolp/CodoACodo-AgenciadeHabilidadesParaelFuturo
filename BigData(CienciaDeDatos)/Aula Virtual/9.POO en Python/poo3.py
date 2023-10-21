class Persona:

    # MÉTODO DE INICIALIZACIÓN
    def __init__(self, nom, fn, dom, dni, tel):
        self.nombre = nom
        self.fecha_nacim = fn
        self.domicilio = dom
        self.dni = dni
        self.telefono = tel

    def modificarDomicilio(self, nuevodom):
        pass

    def modificarTelefono(self, nuevotel): 
        pass

class Empleado(Persona):
    sueldoBase = 70000

    def __init__(self, nom, fn, dom, dni, tel, cat, leg, cargo, antig):
        super().__init__(nom, fn, dom, dni, tel)
        self.categoría = cat
        self.legajo = leg
        self.extraCargo = cargo
        self.extraAntig = antig

    def calculaSueldo(self):
        print('El sueldo de', self.nombre, 'es de $', self.sueldoBase + self.extraAntig + self.extraCargo)

e1 = Empleado('Juan Pérez', '20/12/1968', 'Aráoz 234 - CABA', '20565412', '(011) 4555-5874','Ordenanza','L-452258',25000,65000)
e1.calculaSueldo()