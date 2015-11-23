<html>
	<head>
		<title>Transfer devices to the new PAN</title>
	</head>
	<body>

		<?php
			include_once("credentials.php");
			// what the file should include:
			// $user = "istXXXXX";
			// $dbhost = "db.ist.utl.pt";
			// $dbpass ="XXXXXX";
			// $dbname = "ist173373";
			$dsn = "mysql:host=$dbhost;dbname=$dbname";
		?>

		<form method="post" action="project2.php">
			<p>Enter the patient's name:</p>
			<input type="text" name="name" />
			<input type="submit" name="submit" value="submit" />
		</form>

		<p>Devices from the previous PAN. Select the ones you want to transfer:</p>			

		<?php
			// find the patients 2 most recent PAN's
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
				
				$get_patients = "select number from Patient where name = '$name'";
				
				$result = $connection->query($get_patients);
				
				
				foreach($result as $row){
					  echo("<a href='project2b.php?ID=$row[0]'>$name : $row[0]</a></br>");
				}	
				
				$connection = null;
			}
		?>
	</body>
</html>

