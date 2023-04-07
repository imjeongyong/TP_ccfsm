<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Event</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css"
	integrity="sha512-zoTHZpHqXOuV7rGQatIu/M7y8s1dDIz7sRtIgHtVRZp9XlccjKp6CBvLlW0tuNJQ0xuUG7FjvzIHrgUpmdG8LQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />


</head>
<body>
	<div class="container mt-5">
		<h1>Create Event</h1>
		<form action="insert_event.jsp" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					type="text" class="form-control" id="title" name="title" required>
			</div>
			<div class="mb-3">
				<label for="content" class="form-label">Content</label> <input
					type="text" class="form-control" id="content" name="content"
					required>
			</div>
			<div class="mb-3">
				<label for="start_date" class="form-label">Start Date and
					Time</label> <input type="datetime-local" class="form-control"
					id="start_date" name="start_date" required>
			</div>
			<div class="mb-3">
				<label for="end_date" class="form-label">End Date and Time</label> <input
					type="datetime-local" class="form-control" id="end_date"
					name="end_date" required>
			</div>
			<div class="mb-3">
				<label for="capa" class="form-label">Capacity</label> <input
					type="number" class="form-control" id="capa" name="capa" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</body>
</html>