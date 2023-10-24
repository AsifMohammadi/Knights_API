package Runnners;

import com.intuit.karate.junit5.Karate;

public class TestRunner {

    @Karate.Test
    Karate run (){

        return Karate.run("classpath:AllFeatures").karateEnv("qa");
    }

}
