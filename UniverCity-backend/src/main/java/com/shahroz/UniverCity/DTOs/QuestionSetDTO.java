package com.shahroz.UniverCity.DTOs;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QuestionSetDTO {

    private int difficulty;
    private long subCategoryId;
    private long categoryId;
    private int count;

}

