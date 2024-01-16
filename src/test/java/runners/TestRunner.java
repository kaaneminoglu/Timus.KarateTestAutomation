package runners;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class TestRunner {
    @Test
    void testParallel(){
        System.setProperty("karate.env", "dev");
        Results results = Runner.path("classpath:features").parallel(1);
    }
}
