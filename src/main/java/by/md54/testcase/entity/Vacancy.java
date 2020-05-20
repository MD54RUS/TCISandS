package by.md54.testcase.entity;

import by.md54.testcase.DTO.VacancyDTO;
import lombok.Data;

import javax.persistence.*;
import java.math.BigDecimal;
import java.sql.Date;

@Entity
@Data
@Table(name = "vacancy")
public class Vacancy {
    @Id
    @Column(name = "id")
    private long id;
    @Column(name = "salary")
    private BigDecimal salary;
    @Column(name = "name")
    private String name;
    @JoinColumn
    @ManyToOne
    private Area area;
    @JoinColumn
    @ManyToOne
    private Employer employer;
    @Column(name = "specialisation")
    private Long specialisation;
    @Column(name = "published")
    private Date published;

    public Vacancy(VacancyDTO dto) {
        this.id = dto.id;
        try {
            this.salary = dto.salary.from == null ? dto.salary.to : dto.salary.from;
        } catch (NullPointerException ex) {
            this.salary = null;
        }
        this.name = dto.name;
        this.area = new Area(dto.area);
        this.employer = new Employer(dto.employer);
        this.specialisation = dto.specialisation;
        this.published = new java.sql.Date(dto.published_at.getTime());
    }

    public Vacancy() {
    }
}
