<html>
	<head>
		<title>Submit Button</title>
	</head>
	<body>
		<form method="post">
<input type="submit" name="submit">
</form>

		<?php
		$host = "sigma.tecnico.ulisboa.pt";
		$user = "istXXXXX";
		$pass = "XXXXX";
		$dbhost = "db.ist.utl.pt";
		$dbpass ="XXXXX";
		$dbname = "istXXXXX";
		$dsn = "mysql:host=$dbhost;dbname=$dbname";
		try{
			$connection = new PDO($dsn, $user, $dbpass);
		}
		catch(PDOException $exception){
			echo("<p>Error: ");
			echo($exception->getMessage());
			echo("</p>");
			exit();
			
		}$test = 'Ana';
		$sql = "call display_devices($test)";
				$result = $connection->query($sql);
				foreach($result as $row){
				echo("<tr>");
				for($j = 0; $j < count($row); $j++){
					echo("<td>{$row[$j]}</td>");
				}
				echo("</tr>\n");
			}
		?>
		<form method="post" action="http://web.ist.utl.pt/ist176971/project1.php">
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
				$name = $_POST['name'];
				$sql = "call display_all_readings($name)";
				$result = $connection->query($sql);

				foreach($result as $row){
					echo("\n<tr>");
					for($j = 0; $j < count($row); $j++){
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
				$sql = "call display_all_settings($name)";
				$result = $connection->query($sql);

				foreach($result as $row){
				echo("<tr>");
				for($j = 0; $j < count($row); $j++){
					echo("<td>{$row[$j]}</td>");
				}
				echo("</tr>\n");
			}
		}
		?>
		</table>		
	</body>
</html>
	
		
		