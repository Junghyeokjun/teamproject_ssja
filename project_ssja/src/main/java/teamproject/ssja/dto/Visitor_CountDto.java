package teamproject.ssja.dto;
//VISIT_DATE  NOT NULL DATE      
//VISIT_COUNT          NUMBER(5)

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import oracle.sql.DATE;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Visitor_CountDto {
	DATE VISIT_DATE;
	int VISIT_COUNT;
}
