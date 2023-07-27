import { LightningElement , track} from 'lwc';

export default class To_Do_List extends LightningElement {

taskList=[];
@track task;

handleChange(event){
        this.task = event.target.value;
        //cosnole.log(this.task); 
    }
    

    handleClick(){
       this.template.querySelector('.toDoInput').value=' ';
       this.taskList = [...this.taskList , this.task]
       console.log(this.taskList);
    }
}