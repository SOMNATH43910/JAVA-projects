public class WeatherApp {
    public static final String RESET = "\u001B[0m";
    public static final String RED = "\u001B[31m";
    public static final String GREEN = "\u001B[32m";
    public static final String YELLOW = "\u001B[33m";
    public static final String BLUE = "\u001B[34m";
    public static final String CYAN = "\u001B[36m";

    public static void main(String[] args) {
        String location = "India,Punjab";
        String condition = "Sunny";
        double temperature = 45.3;
        double humidity = 60.5; 
        double windSpeed = 3.2; 
        System.out.println(BLUE + "Weather Report for " + CYAN + location + RESET);
        System.out.println("Condition: " + conditionColor(condition) + condition + RESET);
        System.out.println("Temperature: " + temperatureColor(temperature) + temperature + "°C" + RESET);
        System.out.println("Humidity: " + YELLOW + humidity + "%" + RESET);
        System.out.println("Wind Speed: " + GREEN + windSpeed + " km/h" + RESET);
    }
    public static String conditionColor(String condition) {
        switch (condition.toLowerCase()) {
            case "sunny":
                return YELLOW;
            case "cloudy":
                return CYAN;
            case "rainy":
                return BLUE;
            case "stormy":
                return RED;
            default:
                return RESET;
        }
    }
    public static String temperatureColor(double temperature) {
        if (temperature < 0) {
            return CYAN; 
        } else if (temperature < 15) {
            return BLUE; 
        } else if (temperature < 25) {
            return GREEN; 
        } else {
            return RED;
        }
    }
}
