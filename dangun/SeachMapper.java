package dangun;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface SeachMapper {
	List<SeachDTO> seachlist(Map params);
	int totalCount(Map params);
	List<CountryDTO>coun(String country_name);
}
