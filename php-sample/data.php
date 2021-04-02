<?php
require __DIR__ . '/vendor/autoload.php';
use Twig\Environment;
use Twig\Loader\FilesystemLoader;

$data  = $_POST['data'];
$template  = $_POST['template'];
?>
<?php if ($template == 'php'): ?>
<html lang="eng">
  <body>
    <p>value of a is </p>
        <p id="result"></p>
         <script>
             var a = <?php echo $data ?>;
            document.getElementById("result").innerHTML = a+1;
    </script>
</body>
</html>
<?php endif; ?>
<?php
    if ($template != 'php') {
        $loader = new FilesystemLoader(__DIR__ . '/templates');
        $twig = new Environment($loader);
        echo $twig->render('data.twig', ['data' => $data]);
    }
?>
