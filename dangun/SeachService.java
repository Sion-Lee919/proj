package dangun;

import java.util.List;

public interface SeachService {
	List<SeachDTO> seachlist(int pagenum, String keyword);
	int totalCount(String keyword);
	List<CountryDTO>coun(String country_name);
}
