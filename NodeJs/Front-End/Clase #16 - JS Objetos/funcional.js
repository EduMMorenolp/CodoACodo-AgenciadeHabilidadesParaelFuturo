// Ejemplo de paradigma funcional: sistema de gestión de empleados

// Función para calcular el gasto en sueldos de todos los empleados
function calcularSalarioTotal(empleados) {
   // Se contará el total del gasto en sueldos 
   return empleados.reduce((totalSalario, empleado) => totalSalario + empleado.salario, 0);
}

// DB
const empleados = [
   { nombre: 'Juan', salario: 300000 },
   { nombre: 'María', salario: 400000 },
   { nombre: 'Pedro', salario: 350000 }
];


const salarioTotal = calcularSalarioTotal(empleados);
console.log('Salario total de todos los empleados:', salarioTotal); 