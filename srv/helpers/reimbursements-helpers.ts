// Date extractor
export function getDatePeriodAndYear() {
    const dateToday = new Date();
    
    // Parse period and year from today's date
    const period = (dateToday.getMonth() + 1).toString().padStart(2, "0");
    const year = dateToday.getFullYear().toString();

    return { period, year };
}