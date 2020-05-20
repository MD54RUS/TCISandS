package by.md54.testcase.entity;

import by.md54.testcase.DTO.AreaDTO;
import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.LinkedList;
import java.util.List;

@Entity
@Data
@Table(name = "area")
public class Area {
    @Id
    @Column(name = "id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "parent")
    private Long parentId;

    public Area(long id, String name, Long parentId) {
        this.id = id;
        this.name = name;
        this.parentId = parentId;
    }

    public Area(AreaDTO dto) {
        this.parentId = dto.parent_id;
        this.id = dto.id;
        this.name = dto.name;
    }

    public static List<Area> parseAnswer(AreaDTO dto) {
        List<Area> res = new LinkedList<>();
        Area temp = new Area(dto.id, dto.name, dto.parent_id);
        res.add(temp);
        if (dto.areas != null) {
            for (AreaDTO one : dto.areas) {
                res.addAll(parseAnswer(one));
            }
        }
        return res;
    }

    public Area() {
    }


}

