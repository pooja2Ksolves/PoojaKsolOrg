({
    convertDateFormat: function(component, event, helper) {
        var selectedDate = component.get("v.selectedDate");
        
        function convertDate() {
            // Check if the selectedDate matches the format "dd/MM/yyyy"
            var dateRegex = /^(\d{2})\/(\d{2})\/(\d{4})$/;
            if (dateRegex.test(selectedDate)) {
                // Convert selectedDate to the desired format
                var dateParts = selectedDate.split("/");
                var day = dateParts[0];
                var month = helper.getMonthName(dateParts[1]);
                var year = dateParts[2];
                var formattedDate = day + " " + month + " " + year;

                // Update the selectedDate attribute with the formatted date
                component.set("v.selectedDate", formattedDate);
            }

            // Check if the selectedDate matches the format "dd-mm-yyyy"
            var altDateRegex = /^(\d{2})-(\d{2})-(\d{4})$/;
            if (altDateRegex.test(selectedDate)) {
                // Convert selectedDate to the desired format
                var altDateParts = selectedDate.split("-");
                var altDay = altDateParts[0];
                var altMonth = helper.getMonthName(altDateParts[1]);
                var altYear = altDateParts[2];
                var altFormattedDate = altDay + " " + altMonth + " " + altYear;

                // Update the selectedDate attribute with the formatted date
                component.set("v.selectedDate", altFormattedDate);
            }
        }

        // Check if the Enter key is pressed
        if (event.keyCode === 13) {
            convertDate();
        }
    }
})