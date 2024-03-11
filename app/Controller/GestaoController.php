<?php

Class GestaoController extends CadastroController
{

    public function index()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        
        carrega_twig('Preview_gestao.twig', [
            'p'             => $p,
            'existe_gestao' => false//$this->existeGestao()
        ]);
    }

    public function existeGestao()
    {
        return $this->model->execQuery("SELECT * FROM gestao");
    }

}