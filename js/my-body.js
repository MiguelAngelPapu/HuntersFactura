/**
 * todo: Miguel del futuro arregle esto ▼ 
 * ? Esta una Mier.....da :)
 * @var styles
 */
import styles from "https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" assert { type: "css" };
export class myBody extends HTMLElement {
    constructor() {
        super();
        document.adoptedStyleSheets.push(styles);
    }
    async components() {
        return await (await fetch("view/my-body.html")).text();
    }
    async add(e){
        /**
         * todo: Miguel del futuro arregle esto ▼ 
         * ? Arreglar esto se duplica :(
         * * Miguel del pasado ya se arreglo garcias a lo developers semiseñor by: dDaniel, Brayan
         */
        let $ = e.target;
        if ($.nodeName == "BUTTON") {
            this.plantilla = this.querySelector("#products").children;
            this.plantilla =  this.plantilla[ this.plantilla.length-1];
            this.plantilla =  this.plantilla.cloneNode(true);
            document.querySelector("#products").insertAdjacentElement("beforeend", this.plantilla);
        }
    }
    send(e){
        /**
         * todo: Miguel del futuro si vas a ingresar mas input ten encuenta esto ▼ 
         * ? Si los datos del formulario cresen osea si por pura casualidad
         * ? ingreso otro input en la variable 'fromInput' sumele un 1
         * ? Por otra parte si ingreso otro input en productos
         * ? en la linea 'fromProduct' sume otro 1
         * @var fromInput
         * @var fromProduct
         * ! Igual esta mal pero funciona :), para mi :P
         */
        let input = document.querySelectorAll("input");
        let fromInput = 7, fromProduct = 4;
        let info = {}, producto = {}, lista = {}, data = {}, count = 0;
        producto.product = [];
        input.forEach((val, id) => {
            if (id <= fromInput) {
                info[val.name] = val.value;
            } else if (count <= fromProduct) {
                lista[val.name] = val.value;
                count++;
                if (count == fromProduct) {
                producto.product.push(lista);
                lista = {};
                count = 0;
                }
            }
        });
        data.info = info;
        data.producto = producto.product;
    }
    connectedCallback() {
        this.components().then(html => {
            this.innerHTML = html;
            this.add = this.querySelector("#add").addEventListener("click", this.add.bind(this));
            this.send = this.querySelector("#send").addEventListener("click", this.send.bind(this));
        })
    }
}
customElements.define('my-body', myBody);

