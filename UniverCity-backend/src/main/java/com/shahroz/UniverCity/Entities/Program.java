package com.shahroz.UniverCity.Entities;


import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
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
    private long program_id;

    private String name;
    private String degreeType;


    @ManyToOne
    @JoinColumn(name = "university_id")
    private University university;



}
