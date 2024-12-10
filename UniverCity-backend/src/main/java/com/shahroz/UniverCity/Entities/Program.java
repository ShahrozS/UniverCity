package com.shahroz.UniverCity.Entities;


import com.fasterxml.jackson.annotation.JsonIgnore;
import com.shahroz.UniverCity.University.University;
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


    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;



}
