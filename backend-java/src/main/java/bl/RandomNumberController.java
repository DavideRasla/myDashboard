package bl;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/api/java")
public class RandomNumberController {

    private final Random random = new Random();

    @GetMapping("/getRandomNumber")
    public Map<String, Object> getRandomNumber() {
        int randomNumber = random.nextInt(100); 
        Map<String, Object> response = new HashMap<>();
        response.put("number", randomNumber);
        response.put("message", "Ecco un numero casuale!");
        return response;
    }
}
