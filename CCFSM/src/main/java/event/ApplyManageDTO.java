package event;

public class ApplyManageDTO {

	private String idx;
	private String event_title;
	private String applicant_id;
	private String applicant_center;
	private String applicant_num;
	private String contect_info;
	private String apply_state;
	private String regidate;

	public ApplyManageDTO() {

	}

	public ApplyManageDTO(String event_title, String applicant_id, String applicant_center,
			String applicant_num, String contect_info, String apply_state) {
		this.event_title = event_title;
		this.applicant_id = applicant_id;
		this.applicant_center = applicant_center;
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

	public String getEvent_title() {
		return event_title;
	}

	public void setEvent_title(String event_title) {
		this.event_title = event_title;
	}

	public String getApplicant_id() {
		return applicant_id;
	}

	public void setApplicant_id(String applicant_id) {
		this.applicant_id = applicant_id;
	}

	public String getApplicant_center() {
		return applicant_center;
	}

	public void setApplicant_center(String applicant_center) {
		this.applicant_center = applicant_center;
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