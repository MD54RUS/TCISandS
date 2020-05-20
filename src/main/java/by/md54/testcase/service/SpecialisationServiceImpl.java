package by.md54.testcase.service;

import by.md54.testcase.DTO.SpecialisationDTO;
import by.md54.testcase.entity.Specialisation;
import by.md54.testcase.repository.SpecialisationRepository;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional
public class SpecialisationServiceImpl implements SpecialisationService {


    private String URL = "https://api.hh.ru/specializations";
    private SpecialisationRepository specialisationRepository;
    private final RestTemplate restTemplate = new RestTemplate();

    public SpecialisationServiceImpl(SpecialisationRepository specialisationRepository) {
        this.specialisationRepository = specialisationRepository;
    }


    @Override
    public void loadSpec() {
        ResponseEntity<SpecialisationDTO[]> result = restTemplate.getForEntity(URL, SpecialisationDTO[].class);
        for (SpecialisationDTO specialisationDTO : result.getBody()) {
            specialisationRepository.save(new Specialisation(specialisationDTO));
        }
    }

    @Override
    public Iterable<Specialisation> getAll() {
        return specialisationRepository.findAll();
    }

    @Override
    public Specialisation getSpecById(long id) {
        return specialisationRepository.findById(id).orElse(null);
    }
}
