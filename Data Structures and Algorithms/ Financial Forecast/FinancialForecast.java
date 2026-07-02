public class FinancialForecast {

    
    public static double futureValue(double value, double rate, int years) {

        
        if (years == 0) {
            return value;
        }

        
        return futureValue(value * (1 + rate), rate, years - 1);
    }

    public static void main(String[] args) {

        double initialValue = 1000; 
        double growthRate = 0.10;  
        int years = 5;

        double result = futureValue(initialValue, growthRate, years);

        System.out.println("Future Value after " + years + " years: " + result);
    }
}
