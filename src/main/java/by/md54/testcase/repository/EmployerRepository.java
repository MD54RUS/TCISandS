package by.md54.testcase.repository;

import by.md54.testcase.entity.Employer;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface EmployerRepository extends CrudRepository<Employer, Long> {
    default void update(Employer employer) {
        if (!this.findById(employer.getId()).isPresent()) {
            this.save(employer);
        }
    }

    Optional<Employer> findById(long id);
}
