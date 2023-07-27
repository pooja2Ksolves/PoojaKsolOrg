({
    init : function(component, event, helper) {
        var action = component.get("c.getAllObjects");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var allCustObjVal = response.getReturnValue();
                console.log("All Custom Objects " + allCustObjVal);
                var items = [];
                for (var i = 0; i < allCustObjVal.length; i++) {
                     items.push ({
                        "label": allCustObjVal[i],
                        "value": allCustObjVal[i]
                    });
                }
                component.set("v.objvalue", items);
                console.log("All Custom Objects " + items);
            }
            else if(state === 'Error'){
                var errors = response.getError();
                console.log("Unknown Error");
            }
        });
        $A.enqueueAction(action);   
    },
    
    handleChange : function(component, event, helper){
        var selectedValue = event.getParam("value");
        console.log("Selected Objects : " + selectedValue);
        component.set("v.selectedobj", selectedValue);
    },        
    
    scheduledQueueable: function(component, event, helper){
        var nameObj = component.find("objectId").get("v.value");
        console.log("Getting Single Object Name " + nameObj);
        var action = component.get("c.queueScheOne");
        action.setParams({
            objName : nameObj
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var queuesch = response.getReturnValue();
            }
            else if(state === 'ERROR'){
                var errors = response.getError();
                console.log("Unknown Error");
            }
        });
        $A.enqueueAction(action);
    }
})