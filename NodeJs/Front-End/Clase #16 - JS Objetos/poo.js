// Ejemplo de paradigma orientado a objetos: sistema de gestión de empleados

// Definición de la clase Empleado (crea los empleados)
class Empleado {
   constructor(nombre, salario) {
      this.nombre = nombre;
      this.salario = salario;
   }
}

// Clase para gestionar empleados
class GestionEmpleados {
   constructor(empleados) {
      this.empleados = empleados;
   }

   // Método (la función) para calcular el salario total de todos los empleados
   calcularSalarioTotal() {
      return this.empleados.reduce((totalSalario, empleado) => totalSalario + empleado.salario, 0);
   }
}

// Datos de ejemplo
const empleados = [
   new Empleado('Juan', 300000),
   new Empleado('María', 400000),
   new Empleado('Pedro', 350000),
   new Empleado('Jose', 500000)
];

// Creación de una instancia de la clase GestionEmpleados
const gestionEmpleados = new GestionEmpleados(empleados);

// Uso del método
const salarioTotal = gestionEmpleados.calcularSalarioTotal();
console.log('Salario total de todos los empleados:', salarioTotal); 