package by.md54.testcase.repository;

import by.md54.testcase.entity.Specialisation;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SpecialisationRepository extends CrudRepository<Specialisation, Long> {

    Optional<Specialisation> findById(long id);


}
