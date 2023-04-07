package membership;

public class MemberDTO {

	private String id;
	private String pass;
	private String name;
	private String regidate;
	private String apply_event;
	private String apply_state;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}

	public String getApply_event() {
		return apply_event;
	}

	public void setApply_event(String apply_event) {
		this.apply_event = apply_event;
	}

	public String getApply_state() {
		return apply_state;
	}

	public void setApply_state(String apply_state) {
		this.apply_state = apply_state;
	}
}