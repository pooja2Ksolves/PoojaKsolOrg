import { LightningElement , track} from 'lwc';

export default class MyFirstLwcComponent extends LightningElement {
    @track person = {firstName:"John", lastName:"Doe", age:50, eyeColor:"blue"};
    MethodName(event){
     this.person.lastName = event.target.value
    }
}