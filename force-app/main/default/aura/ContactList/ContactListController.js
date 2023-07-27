({
    myAction: function(component, event, helper) {
        var recordId = component.get("v.recordId");
        var action = component.get("c.getRelatedList");
        action.setParams({ recordId: recordId });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.contactList", response.getReturnValue());
            } else {
                // Handle error
            }
        });
        
        $A.enqueueAction(action);
    },
    
    saveUpdatedContacts: function(component, event, helper) {
        var updatedList = event.getParam("draftValues");
        var action = component.get("c.updateRelatedList");
        action.setParams({ conList: updatedList });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                $A.enqueueAction(component.get("c.myAction"));
                $A.get("e.force:refreshView").fire();
            } else {
                // Handle error
            }
        });
        
        $A.enqueueAction(action);
    }
})