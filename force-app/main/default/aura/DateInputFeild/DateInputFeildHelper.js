({
    getMonthName: function(monthNumber) {
        var monthNames = [
            "Jan", "Feb", "Mar", "Apr", "May", "Jun",
            "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
        ];
        
        return monthNames[parseInt(monthNumber) - 1];
    }
})