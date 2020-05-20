package by.md54.testcase.service;

import by.md54.testcase.DTO.AreaDTO;
import by.md54.testcase.entity.Area;
import by.md54.testcase.repository.AreaRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional

public class AreaServiceImpl implements AreaService {
    private static final String URL_COUNTRIES = "https://api.hh.ru/areas/countries";
    private static final String URL = "https://api.hh.ru/areas/%d";
    private final RestTemplate restTemplate = new RestTemplate();
    private final AreaRepository areaRepository;

    public AreaServiceImpl(AreaRepository areaRepository) {
        this.areaRepository = areaRepository;
    }


    @Override
    public void loadAreas() {
        ResponseEntity<AreaDTO[]> result = restTemplate.getForEntity(URL_COUNTRIES, AreaDTO[].class);
        for (AreaDTO areaDTO : result.getBody()) {
            ResponseEntity<AreaDTO> resultRoot = restTemplate.getForEntity(String.format(URL, areaDTO.id), AreaDTO.class);
            areaRepository.save(Area.parseAnswer(resultRoot.getBody()));
        }
    }


    @Override
    public Iterable<Area> getAreas() {
        return areaRepository.findAll();
    }

    @Override
    public Iterable<Area> findByParent(Long id) {
        return areaRepository.getAreaByParentId(id);
    }

    @Override
    public Area getArea(long id) {
        return areaRepository.findById(id).orElse(null);
    }
}
