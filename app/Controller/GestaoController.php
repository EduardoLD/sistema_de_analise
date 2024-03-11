<?php

Class GestaoController
{
    public function __construct()
    {
        global $p;
    
        $model = strToClass($p);
        $this->model = new Model;
    }

    public function index()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        
        carrega_twig('Preview_gestao.twig', [
            'p'             => $p,
            'existe_gestao' => $this->existeGestao()
        ]);
    }

    public function existeGestao()
    {
        return $this->model->execQuery("SELECT * FROM gestao");
    }
}