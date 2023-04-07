package event;

public class EventDTO {

	private String idx;
	private String title;
	private String content;
	private String start_date;
	private String end_date;
	private String capa;
	private String event_state;
	private String applicant_center_num;

	public String getIdx() {
		return idx;
	}

	public void setIdx(String idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getCapa() {
		return capa;
	}

	public void setCapa(String capa) {
		this.capa = capa;
	}

	public String getEvent_state() {
		return event_state;
	}

	public void setEvent_state(String event_state) {
		this.event_state = event_state;
	}

	public String getApplicant_center_num() {
		return applicant_center_num;
	}

	public void setApplicant_center_num(String applicant_center_num) {
		this.applicant_center_num = applicant_center_num;
	}
}