package Data;

import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getEmail (){
     String email = "elon.maks";
        int random = (int) (Math.random() * 1000);
        return email + random + "@tekschool.us";

//        Faker faker = new Faker();
//        return faker.name().fullName() + "@gmail.com";

    }
}
