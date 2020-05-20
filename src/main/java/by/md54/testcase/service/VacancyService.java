package by.md54.testcase.service;

import by.md54.testcase.entity.Vacancy;
import org.springframework.data.domain.Pageable;


public interface VacancyService {
    int loadVacancy(long specialisationId, long areaId);

    Iterable<Vacancy> getVacancy();

    Iterable<Vacancy> getVacancyPerPage(long specialisationId, long areaId, Pageable page);
}
