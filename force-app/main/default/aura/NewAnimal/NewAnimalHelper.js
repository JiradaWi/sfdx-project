({
    helperMethod: function () {

    },
    fetchAnimalData: function (component) {
        var action = component.get('c.fetchData');
        // action.setParams({
        //     "salesorg": salesOrg,
        //     "channel": channelType,
        //     "soldTo": soldto
        // });
        action.setCallback(this, function (response) {
            var state = response.getState();
            console.log('response: '+JSON.stringify(response.getReturnValue()));
            console.log('state: '+state);
            if(state == 'SUCCESS'){
                if (response.getReturnValue()['success']) {
                    component.set('v.animal', response.getReturnValue()['data']);
                }else{
                    alert('นี่ก็พัง: '+response.getReturnValue()['message']);
                }
            }else{
                alert('พังโว้ยยยย!');
            }
        });
        $A.enqueueAction(action);
    }
})
