package by.md54.testcase.service;

import by.md54.testcase.entity.Specialisation;

public interface SpecialisationService {
    void loadSpec();

    Iterable<Specialisation> getAll();

    Specialisation getSpecById(long id);
}
