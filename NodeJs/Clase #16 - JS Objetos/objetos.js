

const producto = {
  nombre: "Y100",
  precio: 10000,
  descuento: true,
  descripcion: "La Y100 te hará la vida más simple",
  // Método (función de un objeto)
  aplicarDescuento: function(numero) {
      if (this.descuento && this.stock > 0) {
          return this.precio = this.precio * numero
      }
      return "no es posible aplicar descuento"
  },
  test: "prueba",
  stock: 10
}

// Modificar el objeto
producto.test = "probando 1234"
// Acceder 
producto.test
// Borrar
delete producto.test
// Crear
producto.imagen = '/productos/m200.png'


let resultado = producto.aplicarDescuento(0.8)
// console.log("El producto costará con el descuento $ " + resultado)

// Para ver lo que tiene adentro el objeto
for (let props in producto) {
  console.log(props + ":" + producto[props])
}

  
  
  
  
  
  
  
  
  
  
