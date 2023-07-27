({
    initdo : function(component, event, helper) {
        const options =[]
        console.log('Intialize')
        const action= component.get("c.getAllObjects");
        action.setCallback(this,function(response){
            const state =response.getState();
            
            if(state ==="SUCCESS"){
                const allvalues=response.getReturnValue();
                console.log(allvalues);
                allvalues.forEach((value,i)=>{
                    var Item ={
                    "label": value,
                    "value": value
                }
                                  options.push(Item);
            })
            component.set("v.options",options)
            // [{Label:Account,value:Account},{Label:Contact,value:contact}]
        }
                           
                           });
        $A.enqueueAction(action);
    },
    handelchangeCB : function(component,event,handler){
        debugger;
        const fields =[]
        var selectedOptionValue = event.getParam("value");
        component.set("v.objName",selectedOptionValue);
        console.log('click')
        const action =  component.get("c.getAllFields");
        action.setParams({
            obj:selectedOptionValue
            
        })
        action.setCallback(this,function(response){
            const state = response.getState();
            console.log(state)
            if(state ==="SUCCESS"){
                const allvalues=response.getReturnValue();
                console.log(allvalues);
                allvalues.forEach((value,i)=>{
                    var Item ={
                    "label": value,
                    "value": value
                }
                                  fields.push(Item);
            })
            component.set("v.fields",fields)
            var listfield = component.get("v.fields");
            component.set("v.values",listfield);
            
            // [{Label:Account,value:Account},{Label:Contact,value:contact}]
        }
                           })
        
        $A.enqueueAction(action);
        
    },
    
    handleChange :function(component,event,helper){
        debugger;
        var selectedOptionValue = event.getParam("value");
        //alert("Option selected with value: '" + selectedOptionValue.toString() + "'");
        var selectedlist = component.set("v.selectedList",selectedOptionValue.toString() + "");
        var getvalue = component.get("v.selectedList");
    },
    genrateQuery :function(component,event,helper){
        debugger;
        var objtName = component.get("v.objName");  
        var SelectId = component.get("v.options");   
        var makequery = component.get("v.selectedList");
        var querymaker = 'SELECT'+' ' + makequery +' '+'From'+ ' ' + objtName;  
        component.set("v.qeryString",querymaker);
    },
    
    fetchRecord :function(component,event,helper){
        debugger;
        component.set("v.showRecord",true);
        var datalist = component.get("v.qeryString");
        var action = component.get('c.queryRecord');
        action.setParams({
            records : datalist
        });
        action.setCallback(this, function(response){
            var state = response.getState();      
            if (state === "SUCCESS") { 
                var result = response.getReturnValue();
                if(result != null){
                    
                    component.set("v.dataList",result);   
                }else{
                    
                    alert('No record to fetch');
                }   
                
            }
            else{
                alert('ERROR');
            }
        });
        $A.enqueueAction(action); 
    }
    
    
})