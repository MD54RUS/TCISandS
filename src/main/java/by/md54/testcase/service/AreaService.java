package by.md54.testcase.service;

        import by.md54.testcase.entity.Area;

public interface AreaService {
    void loadAreas();
    Iterable<Area> getAreas();
    Iterable<Area> findByParent(Long id);
    Area getArea(long id);

}
