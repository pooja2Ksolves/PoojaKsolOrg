import { LightningElement, api } from "lwc";
import ersatz_getAllObjects from "@salesforce/apex/AllCustomObjectHandler.getAllObjects";
//import ersatz_queueScheOne from "@salesforce/apex/AllCustomObjectHandler.queueScheOne";

export default class allCustomObjectHandler2 extends LightningElement {
    @api
    recordId = null;

    @api
    objvalue = [];

    @api
    selectedobj = [];

    @api
    selectedObjName;

    connectedCallback() {
        this.init();
    }

    init(event) {
        var action = ersatz_getAllObjects;
        /*action.setCallback(this, function(response){
            var state = response.getState();
            if(state === 'SUCCESS'){
                var allCustObjVal = response;
                console.log("All Custom Objects " + allCustObjVal);
                var items = [];
                for (var i = 0; i < allCustObjVal.length; i++) {
                     items.push ({
                        "label": allCustObjVal[i],
                        "value": allCustObjVal[i]
                    });
                }
                this.objvalue = items;
                console.log("All Custom Objects " + items);
            }
            else // Ersatz: Conversion only processes logic for success and error states 
            if (state === 'Error') {
                var errors = response;
                console.log("Unknown Error");
            }
        })*/;
        action({
            objName : nameObj
        }).then(response => {
            var allCustObjVal = response;
            console.log("All Custom Objects " + allCustObjVal);
            var items = [];
            for (var i = 0; i < allCustObjVal.length; i++) {
                 items.push ({
                    "label": allCustObjVal[i],
                    "value": allCustObjVal[i]
                });
            }
            this.objvalue = items;
            console.log("All Custom Objects " + items);
        });   
    }

    handleChange(event) {
        var selectedValue = event.detail.value;
        console.log("Selected Objects : " + selectedValue);
        this.selectedobj = selectedValue;
    }

    scheduledQueueable(event) {
        var nameObj = this.ersatz_FindElement("objectId").value;
        console.log("Getting Single Object Name " + nameObj);
        var action = ersatz_queueScheOne;
        action().then(response => {
            var queuesch = response;
        }).catch(response => {
            var errors = response;
            console.log("Unknown Error");
        });
    }

    ersatz_FindElement(auraId) {
        return this.template.querySelectorAll(`[data-ersatz-aura-id='${auraId}']`).length === 1 ? this.template.querySelector(`[data-ersatz-aura-id='${auraId}']`) : this.template.querySelectorAll(`[data-ersatz-aura-id='${auraId}']`).length > 1 ? this.template.querySelectorAll(`[data-ersatz-aura-id='${auraId}']`) : undefined;
    }
}