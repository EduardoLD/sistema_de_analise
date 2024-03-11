<?php

require_once 'lib/Database/Connection.php';
require_once 'app/Src/Sys.php';

require_once 'autoload.php';
require_once 'vendor/autoload.php';

$template = file_get_contents('app/view/html/estrutura.html');
$get      = filter_input_array(INPUT_GET, FILTER_SANITIZE_FULL_SPECIAL_CHARS);

ob_start();
    $core = new Core;
    $core->start($get);

    $saida = ob_get_contents();
ob_end_clean();

$tplPronto = str_replace('{{ conteudo }}', $saida, $template);

echo $tplPronto;