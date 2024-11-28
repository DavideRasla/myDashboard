package bl; // Assicurati che il pacchetto sia corretto

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeBean {

    @GetMapping("/")
    public String home() {
        return "getHomeBean worked"; // Restituisce il percorso del file
    }
    
    @GetMapping("/api/java")
    public String getRandomNumber() {

        return "eccolooo";
    }
}
