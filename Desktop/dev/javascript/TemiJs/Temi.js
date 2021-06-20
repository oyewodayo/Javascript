class Temi {
    constructor() {

    }
    age(year) {
        let date = new Date();
        return date.getFullYear() - year;
    }


    // Convert date to Numbers in months, weeks or days
    dateDiff(withdrawal_date, period) {
        var currentdate = new Date();
        var end = new Date(withdrawal_date);

        var timeDiff = end.getTime() - currentdate.getTime();

        const milliSecInDays = 24 * 60 * 60 * 1000;
        const milliSecInWeeks = 24 * 7 * 60 * 60 * 1000;
        const milliSecInMonths = 24 * 31 * 60 * 60 * 1000;

        switch (period) {
            case 'monthly':
                var numPeriods = timeDiff / milliSecInMonths;
                break;
            case 'weekly':
                var numPeriods = timeDiff / milliSecInWeeks;
                break;
            case 'daily':
                var numPeriods = timeDiff / milliSecInDays;
                break;
            default:
                var numPeriods = timeDiff / milliSecInMonths;
                break;
        }

        return numPeriods.toFixed(0);
    }

    // Generate Unique string
    UUID() {
        const dataString = Date.now().toString(16);
        const randomString = Math.random().toString(16).substr(2);

        return dataString + randomString;
    }
}