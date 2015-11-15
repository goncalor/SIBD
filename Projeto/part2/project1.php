<html>
	<head>
		<title>Find patient's readings and settings</title>
	</head>
	<body>

		<?php
			$host = "sigma.tecnico.ulisboa.pt";
			$user = "istXXXXX";
			$pass = "XXXXXXX";
			$dbhost = "db.ist.utl.pt";
			$dbpass ="XXXXXX";
			$dbname = "istXXXXX";
			$dsn = "mysql:host=$dbhost;dbname=$dbname";
		?>

		<form method="post" action="project1.php">
			<p>Enter the patient's name:</p>
			<input type="text" name="name" />
			<input type="submit" name="submit" value="submit" />
		</form>

		<table border="1">
			<caption>Readings</caption>
 			<tr>
 				<td><em>Read Date</em></td>
				<td><em>Serial Number</em></td>
				<td><em>Manufacturer</em></td>
				<td><em>Units</em></td>
				<td><em>Value</em></td>
			</tr>

			<?php
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
					$connection = null;

					foreach($result as $row){
						echo("\n<tr>");
						for($j = 0; $j < 5; $j++){
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
 				<td><em>Setting Date</em></td>
				<td><em>Serial Number</em></td>
				<td><em>Manufacturer</em></td>
				<td><em>Units</em></td>
				<td><em>Value</em></td>
			</tr>

			<?php
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
					foreach($result as $row){
						echo("<tr>");
						for($j = 0; $j < 5; $j++){
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
	
		
		
