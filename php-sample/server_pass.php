<!DOCTYPE HTML>
<?php
$data = [
    "good" => "1",
    "bad" => "5;alert('oops!')",
];
?>

<html lang="eng">
<body>
<?php
$data_item  = $_GET['data'];
?>
<p>value of a is </p>
<p id="result"></p>

<script>
    var a = <?php echo $data[$data_item] ?>;
    document.getElementById("result").innerHTML = a+1;
</script>

</body>
</html>
