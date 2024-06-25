package teamproject.ssja.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//P_DATE  NOT NULL DATE       
//P_PRICE NOT NULL NUMBER(20) 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ProfitDto {
	private String P_DATE;
	private int P_PRICE;
}
