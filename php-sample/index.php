<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>InputValidation test</title>
</head>
<body>
<h2>Test template data injection with unescaped html</h2>
<form id="unescaped-data" method="post" action="data.php">
    <label for="data">Data</label><br>
    <textarea name="data" id="data" cols="50" rows="5"><script>alert('oops');</script></textarea><br>
    <label for="template">Template to use</label><br>
    <select id="template" name="template">
        <option value="php">Plain PHP</option>
        <option value="twig">PHP+twig</option>
    </select>
    <br>
    <input type="submit" value="Submit">
</form>

</body>
</html>
