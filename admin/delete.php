<?php
include("connect.php");

if (isset($_GET['id'])) {
    $id = $_GET['id'];

    $sql = "DELETE FROM students WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);

    if ($stmt->execute()) {
        echo "<script>
            alert('Data Deleted Successfully');
            window.location.href = 'view.php';
        </script>";
    } else {
        echo "Error deleting record.";
    }

    $stmt->close();
    $conn->close();
} else {
    echo "No ID received.";
}
?>
