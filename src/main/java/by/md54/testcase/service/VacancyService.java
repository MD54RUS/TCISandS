package by.md54.testcase.service;

import by.md54.testcase.entity.Vacancy;
import org.springframework.data.domain.Pageable;


public interface VacancyService {
    void loadVacancy();

    Iterable<Vacancy> getVacancy();

    Iterable<Vacancy> getVacancyPerPage(Pageable page);
}
