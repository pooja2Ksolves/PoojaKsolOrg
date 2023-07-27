import { LightningElement } from 'lwc';

export default class LifeCycleParent extends LightningElement {
    constructor(){
        super()
        console.log("parent constructor called")
    }
    connectedCallback(){
        console.log("parent connectedCallback called") 
    }
    renderedCallback(){
        console.log("parent renderedCallback called") 
    }
    name
    changeHnadler(event){
       this.name = event.target.value
    }
}