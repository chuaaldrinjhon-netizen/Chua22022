<?php
    session_start();
    include("connect.php");

    if(isset($_POST['register'])){
        $username = $_POST['username'];
        $password = $_POST['password'];
        $role = $_POST['role'];

        $sql = "INSERT INTO users (username, password, role) VALUES ('$username', '$password', '$role')";

            if($conn->query($sql)){
                echo "Registration Completeeee <a href= '../Login.php'> Login Here </a>";
            }else{
                echo "Error: " . $conn ->error;
            }
    }

?>