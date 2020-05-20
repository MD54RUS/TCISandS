package by.md54.testcase.entity;

import by.md54.testcase.DTO.SpecialisationDTO;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "specialisation")
public class Specialisation {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name")
    private String name;


    public Specialisation() {
    }


    public Specialisation(SpecialisationDTO dto) {
        this.id = dto.id;
        this.name = dto.name;
    }

    public Specialisation(long id, String name) {
        this.id = id;
        this.name = name;
    }


}
