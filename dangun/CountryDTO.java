package dangun;

public class CountryDTO {
	String country;
	int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public CountryDTO(String country, int id) {
		super();
		this.country = country;
		this.id = id;
	}

	public CountryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
}
