package by.md54.testcase.service;

import by.md54.testcase.entity.Vacancy;
import org.springframework.data.domain.Pageable;


public interface VacancyService {
    int loadVacancy(long specialisationId, long areaId);

//    Iterable<Vacancy> getVacancy(long specialisationId, long areaId);

    Iterable<Vacancy> getVacancyPerPage(long specialisationId, long areaId, Pageable page);

    int getVacancyCount(long specialisation, long areaId);
}
