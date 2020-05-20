package by.md54.testcase.service;

import by.md54.testcase.DTO.AnswerVacancyDTO;
import by.md54.testcase.DTO.VacancyDTO;
import by.md54.testcase.entity.Area;
import by.md54.testcase.entity.Vacancy;
import by.md54.testcase.repository.AreaRepository;
import by.md54.testcase.repository.EmployerRepository;
import by.md54.testcase.repository.VacancyRepository;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

@Service
@Transactional

public class VacancyServiceImpl implements VacancyService {
    private static final long specialisationId = 1L;
    private static final long areaId = 4L;
    private static final int MAX_REQUEST_QUANTITY = 100;
    private static final String URL = "https://api.hh.ru/vacancies?specialization=%d&area=%d&page=%d&per_page=%d";
    private final RestTemplate restTemplate = new RestTemplate();
    private final VacancyRepository vacancyRepository;
    private final AreaRepository areaRepository;
    private final EmployerRepository employerRepository;


    public VacancyServiceImpl(VacancyRepository vacancyRepository, AreaRepository areaRepository, EmployerRepository employerRepository) {
        this.vacancyRepository = vacancyRepository;
        this.areaRepository = areaRepository;
        this.employerRepository = employerRepository;
    }

    @Override
    public void loadVacancy() {
        String request = String.format(URL, specialisationId, areaId, 0, 1);


        ResponseEntity<AnswerVacancyDTO> result = restTemplate.getForEntity(request, AnswerVacancyDTO.class);
        Area area;
        if (areaRepository.findById(areaId).isPresent()) {
            area = areaRepository.findById(areaId).get();
        } else {
            area = new Area(result.getBody().items[0].area);
            areaRepository.save(area);
        }
        vacancyRepository.deleteAllByAreaAndSpecialisation(area, specialisationId);
        int quantity = result.getBody().found;
        quantity = Math.min(quantity, 2000); //Ограничение API
        int count = 0;
        Vacancy tempVacancy;
        while (quantity > 0) {
            request = String.format(URL, specialisationId, areaId, count, MAX_REQUEST_QUANTITY);
            result = restTemplate.getForEntity(request, AnswerVacancyDTO.class);
            for (VacancyDTO vacancyDTO : result.getBody().items) {
                vacancyDTO.specialisation = specialisationId;
                tempVacancy = new Vacancy(vacancyDTO);
                areaRepository.update(tempVacancy.getArea());
                employerRepository.update(tempVacancy.getEmployer());
                vacancyRepository.save(tempVacancy);
            }
            count++;
            quantity -= MAX_REQUEST_QUANTITY;
        }
    }

    @Override
    public Iterable<Vacancy> getVacancy() {
        return vacancyRepository.findAll();
    }

    @Override
    public Iterable<Vacancy> getVacancyPerPage(Pageable page) {
        return vacancyRepository.findAll(page).getContent();
    }


}
