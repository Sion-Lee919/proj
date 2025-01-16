package dangun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class SeachController {
	@Autowired
	@Qualifier("seachDAO")
	SeachService seachService;
	
	
	@GetMapping("/seachlistt")
	public String seachlistt() {
		
		return "seach/list";
	}
	
	@RequestMapping(value="/seachlistt2", produces = {"application/json;charset=utf-8"})
	@ResponseBody
	public List<CountryDTO> country(@RequestParam(value ="country_name", required = false) String country_name) {
		List<CountryDTO> countrylist = seachService.coun(country_name);
		return countrylist;
	}
	
	@GetMapping("/seachlisttt")
	public ModelAndView seachlist(@RequestParam(value="pagenum", required = false, defaultValue = "1") int pagenum,  @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		ModelAndView mv = new ModelAndView();
		List<SeachDTO> list = seachService.seachlist(pagenum, keyword);
		int total = seachService.totalCount(keyword);
		mv.addObject("seachlist",list);
		mv.addObject("total",total);
		mv.addObject("keyword",keyword);
		mv.setViewName("seach/blist");
		return mv;
	}
	
}
