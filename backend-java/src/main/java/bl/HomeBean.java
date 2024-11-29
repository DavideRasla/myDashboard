package bl; 

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeBean {

    @GetMapping("/")
    public String home() {
        return "getHomeBean worked"; // Restituisce il percorso del file
    }
    
    @GetMapping("/api/java")
    public ResponseEntity<Map<String, String>> getRandomNumber() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Data from Java API!");
        return ResponseEntity.ok(response);
    }
}
