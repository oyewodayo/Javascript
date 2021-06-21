class Temi {
    constructor() {

    }

    /*-------------------------------------------------------------------------------------------------------
    | Convert date to Numbers in months, weeks or days. Call UUID() after instantiating the class: 
    |--------------------------------------------------------------------------------------------------------
    | const temi = new Temi();
    | temi.dateDiff('2022-01-1','day')
    */

    dateDiff(date, period) {
        var currentdate = new Date();
        var end = new Date(date);

        var timeDiff = end.getTime() - currentdate.getTime();

        const milliSecInDays = 24 * 60 * 60 * 1000;
        const milliSecInWeeks = 24 * 7 * 60 * 60 * 1000;
        const milliSecInMonths = 24 * 31 * 60 * 60 * 1000;

        switch (period) {
            case 'month':
                var numPeriods = timeDiff / milliSecInMonths;
                break;
            case 'week':
                var numPeriods = timeDiff / milliSecInWeeks;
                break;
            case 'day':
                var numPeriods = timeDiff / milliSecInDays;
                break;
            default:
                var numPeriods = timeDiff / milliSecInMonths;
                break;
        }

        return numPeriods.toFixed(0);
    }


    /*-------------------------------------------------------------------------------------------------------
    | Know the year you were born by passing your age into the function. Call UUID() after instantiating the class: 
    |--------------------------------------------------------------------------------------------------------
    | const temi = new Temi();
    | temi.bornOn(45)
    */

    bornOn(year) {
        let date = new Date();
        return date.getFullYear() - year;
    }

    /*-------------------------------------------------------------------------------------------------------
    | Generate Unique string. Call UUID() after instantiating the class: 
    |--------------------------------------------------------------------------------------------------------
    | const temi = new Temi();
    | temi.UUID()
    */

    UUID() {
        const dataString = Date.now().toString(16);
        const randomString = Math.random().toString(16).substr(2);

        return dataString + randomString;
    }

    /*-------------------------------------------------------------------------------------------------------
    |   Post data into the database with fetch API.
    |--------------------------------------------------------------------------------------------------------
    |   const temi = new Temi();
    |   temi.postRequest('/url',object).then(data=>{}).catch(e)
    */

    async postRequest(url = '', data = {}) {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
        });
        return response.json();
    }
}