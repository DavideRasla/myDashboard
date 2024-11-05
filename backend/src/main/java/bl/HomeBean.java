package bl; // Assicurati che il pacchetto sia corretto

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeBean {

    @GetMapping("/getHomeBean")
    public String home() {
        return "getHomeBean worked"; // Restituisce il percorso del file
    }
}
