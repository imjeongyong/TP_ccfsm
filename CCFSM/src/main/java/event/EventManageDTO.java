package event;

public class EventManageDTO {

	private String idx;
	private String userid;
	private String event_title;
	private String center_name;
	private String applicant_num;
	private String contect_info;
	private String apply_state;
	private String regidate;
	
	public EventManageDTO() {
		
	}
	
	public EventManageDTO(String idx, String userid, String event_title, String center_name, String applicant_num, String contect_info, String apply_state) {
		this.idx = idx;
		this.userid = userid;
		this.event_title = event_title;
		this.center_name = center_name;
		this.applicant_num = applicant_num;
		this.contect_info = contect_info;
		this.apply_state = apply_state;
	}

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getCenter_name() {
		return center_name;
	}

	public void setCenter_name(String center_name) {
		this.center_name = center_name;
	}

	public String getApplicant_num() {
		return applicant_num;
	}

	public void setApplicant_num(String applicant_num) {
		this.applicant_num = applicant_num;
	}

	public String getContect_info() {
		return contect_info;
	}

	public void setContect_info(String contect_info) {
		this.contect_info = contect_info;
	}
	
	public String getApply_state() {
		return apply_state;
	}

	public void setApply_state(String apply_state) {
		this.apply_state = apply_state;
	}

	public String getRegidate() {
		return regidate;
	}

	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
}