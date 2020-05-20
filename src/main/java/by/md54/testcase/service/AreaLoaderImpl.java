package by.md54.testcase.service;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional

public class AreaLoaderImpl implements by.md54.testcase.service.AreaLoader {
    //todo Страны?
    private static final String URL = "https://api.hh.ru/areas";
    private final RestTemplate restTemplate = new RestTemplate();

    public AreaLoaderImpl() {

    }


    @Override
    public void loadAreas() {
        ResponseEntity<String> result = restTemplate.getForEntity(URL, String.class);
        System.out.println(result.getBody());
    }
}
