package by.md54.testcase.repository;

import by.md54.testcase.entity.Area;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
@Transactional

public interface AreaRepository extends CrudRepository<Area, Long> {

    Area findById(long id);

    Iterable<Area> getAreaByParentId(Long parentId);
}
