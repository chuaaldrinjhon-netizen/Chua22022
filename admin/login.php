<?php

session_start();

include("connect.php");

$username = $_POST['username'];
$password = $_POST['password'];
$sql = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
$result = $conn->query($sql);

    if($result -> num_rows == 1){
        $row = $result -> fetch_assoc();
        $_SESSION['username'] = $row['username'];
        $_SESSION['role'] = $row['role'];
            if($row['role'] == 'admin'){
                header("Location: index.php");
            }else{
                header("Location: ../user/index.php");
            }
    }else{
        echo "Invalid Login <a href= '../index.php'> Try Again </a>";
    }

?>