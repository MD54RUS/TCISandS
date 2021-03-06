package by.md54.testcase.repository;

import by.md54.testcase.entity.Specialisation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface SpecialisationRepository extends CrudRepository<Specialisation, Long> {

    Specialisation findById(long id);

}
