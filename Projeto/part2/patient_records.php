<html>
	<head>
		<title>Find patient's readings and settings</title>
	</head>
	<body>

		<?php
			include_once("credentials.php");
			// what the file should include:
			// $user = "istXXXXX";
			// $dbhost = "db.ist.utl.pt";
			// $dbpass ="XXXXXX";
			// $dbname = "istXXXXX";
			$dsn = "mysql:host=$dbhost;dbname=$dbname";
		?>

		<form method="post" action="patient_records.php">
			<p>Enter the patient's name:</p>
			<input type="text" name="name" />
			<input type="submit" name="submit" value="submit" />
		</form>

		<table border="1">
			<caption>Readings</caption>
 			<tr>
 				<td>Patient Number</td>
 				<td>Read Date</td>
				<td>Serial Number</td>
				<td>Manufacturer</td>
				<td>Units</td>
				<td>Value</td>
			</tr>

			<?php
				// display readings for this patient
				if(isset($_POST['submit'])) {
					try{
						$connection = new PDO($dsn, $user, $dbpass);
					}
					catch(PDOException $exception){
						echo("<p>Error: ");
						echo($exception->getMessage());
						echo("</p>");
						exit();
					}
					$name = $_POST['name'];
					$sql = "call display_all_readings('$name');";
					$result = $connection->query($sql);
					if ($result == FALSE){
						$info = $connection->errorInfo();
						echo("<p>Error: {$info[2]}</p>");
						exit();
					}

					$connection = null;

					foreach($result as $row){
						echo("\n<tr>");
						for($j = 0; $j < 6; $j++){
							echo("<td>{$row[$j]}</td>");
						}
						echo("</tr>");
					}
				}
			?>

		</table>
		<br><br>
		<table border="1">
			<caption>Settings</caption>
 			<tr>
 				<td><em>Patient Number</em></td>
 				<td><em>Setting Date</em></td>
				<td><em>Serial Number</em></td>
				<td><em>Manufacturer</em></td>
				<td><em>Units</em></td>
				<td><em>Value</em></td>
			</tr>

			<?php
				// display settings for this patient
				if(isset($_POST['submit'])) {
					try{
						$connection = new PDO($dsn, $user, $dbpass);
					}
					catch(PDOException $exception){
						echo("<p>Error: ");
						echo($exception->getMessage());
						echo("</p>");
						exit();
					}
					$sql = "call display_all_settings('$name');";
					$result = $connection->query($sql);
					if ($result == FALSE){
						$info = $connection->errorInfo();
						echo("<p>Error: {$info[2]}</p>");
						exit();
					}
					foreach($result as $row){
						echo("<tr>");
						for($j = 0; $j < 6; $j++){
							echo("<td>{$row[$j]}</td>");
						}
						echo("</tr>\n");
					}
					$connection = null;
				}
			?>

		</table>		
	</body>
</html>

