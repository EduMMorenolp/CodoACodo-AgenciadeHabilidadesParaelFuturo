// URL de referencia https://www.lenovo.com/ar/es/notebooks/subseries-resultados/?visibleDatas=11053%3AThinkPad

// 1. Queremos ingresar un texto en el encabezado que diga "Envío gratis + 24 cuotas sin interés en todos los productos ó 50% off EXTRA con Transferencia/Depósito bancario."

// Seleccionamos en dónde queremos que se encuentre el texto
let commonHeader = document.querySelector(".commonHeader") 

// Creamos un elemento en donde lo integraremos como HTML
let codigo = document.createElement("div")

// Al elemento creado, le integramos el código HTML deseado
codigo.innerHTML = `
   <div class="StickyBannerpc" >
   <div class="pcStickyBanner" style="background-color:#000000;">
      <div id="pcStickyBanner"><p style="font-family: Lato; font-size: 14px; color: rgb(255, 255, 255); text-align: center;">Envío gratis + 24 cuotas sin interés en todos los productos ó 50% off EXTRA con Transferencia/Depósito bancario.</p></div>
   </div>
   </div>
   `

// lo adjuntamos
commonHeader.appendChild(codigo)

// 2. Ahora necesitamos indicar que todos los productos deben tener la imagen de 'hotsale'

// Seleccionamos TODOS los productos
let productos = document.querySelectorAll(".product_item")

// Hacemos un recorrido para adjuntarle la imagen 
productos.forEach(function (item) {

   let hotsale = document.createElement("img")
   hotsale.style = "position: absolute; right: 5px; top: 5px; z-index: 100; width: 32px; height: 32px"
   hotsale.setAttribute("src", "https://png.pngtree.com/template/20190801/ourmid/pngtree-hot-flame-icon-vector-illustration-image_286120.jpg")
   item.style = "position:relative; background-color: lightgray";
   item.appendChild(hotsale)
})