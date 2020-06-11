package by.md54.testcase.repository;

import by.md54.testcase.entity.Employer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface EmployerRepository extends CrudRepository<Employer, Long> {
    void update(Employer employer);

    Employer findById(long id);
}
