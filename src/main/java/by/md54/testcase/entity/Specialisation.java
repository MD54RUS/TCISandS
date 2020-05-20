package by.md54.testcase.entity;

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

    public Specialisation(Specialisation specialisation) {


    }
}
