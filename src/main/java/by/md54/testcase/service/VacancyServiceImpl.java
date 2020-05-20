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


    //todo Переделать getForEntity на массив.

    @Override
    public int loadVacancy(long specialisationId, long areaId) {
        String request = String.format(URL, specialisationId, areaId, 0, 1);
        ResponseEntity<AnswerVacancyDTO> result = restTemplate.getForEntity(request, AnswerVacancyDTO.class);
        Area area = areaRepository.findById(areaId).get();
        vacancyRepository.deleteAllByAreaIdAndSpecialisation(areaId, specialisationId);
        int found = result.getBody().found;
        int quantity = Math.min(found, 2000); //Ограничение API
        found = quantity;
        int pageNumber = 0;
        Vacancy tempVacancy;
        while (quantity > 0) {
            request = String.format(URL, specialisationId, areaId, pageNumber, MAX_REQUEST_QUANTITY);
            result = restTemplate.getForEntity(request, AnswerVacancyDTO.class);
            for (VacancyDTO vacancyDTO : result.getBody().items) {
                vacancyDTO.specialisation = specialisationId;
                tempVacancy = new Vacancy(vacancyDTO);
                employerRepository.save(tempVacancy.getEmployer());
                vacancyRepository.save(tempVacancy);
            }
            pageNumber++;
            quantity -= MAX_REQUEST_QUANTITY;
        }
        return found;
    }


    @Override
    public Iterable<Vacancy> getVacancy() {
        return vacancyRepository.findAll();
    }

    @Override
    public Iterable<Vacancy> getVacancyPerPage(long specialisationId, long areaId, Pageable page) {
        return vacancyRepository.findBySpecialisationAndAreaId(specialisationId, areaId, page).getContent();
    }


}
