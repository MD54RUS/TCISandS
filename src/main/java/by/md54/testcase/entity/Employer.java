package by.md54.testcase.entity;

import by.md54.testcase.DTO.EmployerDTO;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "employer")
public class Employer {
    @Id
    @Column(name = "id")
    long id;

    @Column(name = "name")
    String name;

    public Employer() {
    }

    public Employer(EmployerDTO dto) {
        this.id = dto.id;
        this.name = dto.name;
    }
}
