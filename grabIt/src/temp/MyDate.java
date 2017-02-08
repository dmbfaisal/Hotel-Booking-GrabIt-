package temp;

import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class MyDate 
{

	public static String currentDate()
	{
		return LocalDate.now().toString();
		
	}
	public static String tomDate()
	{
		return LocalDate.now().plus(1,ChronoUnit.DAYS).toString();	
	}
	public static long daysbetween(LocalDate b, LocalDate c)
	{
		return ChronoUnit.DAYS.between(b, c);
		
	}
	
	
	
}
