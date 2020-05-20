package by.md54.testcase.entity;

import by.md54.testcase.DTO.AreaDTO;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Data
@Table(name = "area")
public class Area {
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;


    public Area(AreaDTO area) {
        this.id = area.id;
        this.name = area.name;
    }

    public Area() {
    }
}

