package bl; 

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/java")
public class HomeBean {

    @GetMapping("/")
    public String home() {
        return "getHomeBean worked"; // Restituisce il percorso del file
    }
    
    @GetMapping("/getTestString")
    public ResponseEntity<Map<String, String>> getTestString() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Data from Java API!");
        return ResponseEntity.ok(response);
    }
}
