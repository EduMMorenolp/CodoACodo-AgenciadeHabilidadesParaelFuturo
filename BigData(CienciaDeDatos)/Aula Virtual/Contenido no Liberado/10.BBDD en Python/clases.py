class Cuenta():
    num = ''
    sucursal = ''
    tipo = ''
    saldo = 0    
    cbu = ''

    def modifica_saldo(self, monto):
        self.saldo += monto

    def mostrar_saldo(self):
        print('\nEstado de CUENTA:')
        print(self.tipo,'N°',self.num,'-',self.sucursal)
        print('CBU:',self.cbu)
        print('Saldo: $', self.saldo,'\n')        

c1 = Cuenta()
c1.num = '1245'
c1.sucursal = '021'
c1.tipo = 'Caja de Ahorros'
c1.saldo = 10000
c1.cbu = '458874521154896500025'

c1.mostrar_saldo()
c1.modifica_saldo(-4800)
c1.mostrar_saldo()

