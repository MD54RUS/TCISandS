package by.md54.testcase.repository;

import by.md54.testcase.entity.Area;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
@Transactional

public interface AreaRepository extends CrudRepository<Area, Long> {

    default void update(Area area) {
        if (!this.findById(area.getId()).isPresent()) {
            this.save(area);
        }
    }

    Optional<Area> findById(long id);
}
