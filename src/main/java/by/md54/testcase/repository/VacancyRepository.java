package by.md54.testcase.repository;

import by.md54.testcase.entity.Vacancy;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional

public interface VacancyRepository extends CrudRepository<Vacancy, Long>, PagingAndSortingRepository<Vacancy, Long> {

    void deleteAllByAreaIdAndSpecialisation(long areaId, Long specialisation);

    Page<Vacancy> findBySpecialisationAndAreaId(long specialisation, long areaId, Pageable page);

    Page<Vacancy> findAll(Pageable pageable);

}
