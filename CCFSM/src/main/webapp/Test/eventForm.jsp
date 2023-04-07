<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <title>FullCalendar Example</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

</head>
<body>
	<form>
		<div>
			<label for="title">제목:</label> <input type="text" name="title"
				id="title" />
		</div>
		<div>
			<label for="start">시작일:</label> <input type="text" name="start"
				id="start" />
		</div>
		<div>
			<label for="end">종료일:</label> <input type="text" name="end" id="end" />
		</div>
		<input type="submit" value="저장" />
	</form>

	<script>
		$(document).ready(function() {
			$('#start, #end').datetimepicker({
				format : 'YYYY-MM-DD HH:mm:ss' // 날짜와 시간 형식 설정
			});

			$('form').submit(function(e) {
				e.preventDefault();

				var title = $('#title').val();
				var start = $('#start').val();
				var end = $('#end').val();

				// FullCalendar 이벤트 객체 생성
				var event = {
					title : title,
					start : start,
					end : end
				};

				// FullCalendar에 이벤트 추가
				$('#calendar').fullCalendar('renderEvent', event, true);
			});
		});
	</script>
</body>
</html>