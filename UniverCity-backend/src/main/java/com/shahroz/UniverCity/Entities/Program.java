package com.shahroz.UniverCity.Entities;


import jakarta.persistence.*;
import lombok.*;

@Entity
@ToString
@Builder
@AllArgsConstructor
@Setter
@Getter
@NoArgsConstructor
public class Program {

    @Id
    @GeneratedValue

    private long program_id;

    private String name;
    private String degreeType;


    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;



}
