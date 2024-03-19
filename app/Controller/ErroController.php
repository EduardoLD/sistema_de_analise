<?php

Class ErroController 
{
    public function index()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);

        echo 'Classe não encontrada!';
        echo '<br>';
        echo 'Verifique se criou a classe ' . $p .'Controller.';
    }
}