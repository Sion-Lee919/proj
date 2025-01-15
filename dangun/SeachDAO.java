package dangun;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class SeachDAO implements SeachService{
	
	@Autowired
	SeachMapper mapper;
	
	@Override
	public List<SeachDTO> seachlist( int pagenum, String keyword) {
		int cnt =5;
		int start = (pagenum-1)*cnt+1;
		int end = pagenum *cnt;
		
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		params.put("start", start);
		params.put("end", end);
		
		return mapper.seachlist(params);
		}

	@Override
	public int totalCount(String keyword) {
		Map<String, Object> params = new HashMap<>();
		params.put("keyword", keyword);
		return mapper.totalCount(params);
	}

	@Override
	public List<CountryDTO> coun(String country_name) {
		 if (country_name == null || country_name.trim().isEmpty()) {
		        return new ArrayList<>();  // 빈 리스트 반환
		    }
		return mapper.coun(country_name);
	}
	
	
	
}
