<?php

Class ApostasController
{
    public function __construct()
    {
        global $p;
    
        $model = strToClass($p);
        $this->model = new Model;
    }

    public function inclusao()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);

        carrega_twig('Inclusao_apostas.twig', [
            'p' => $p
        ]);
    }

    public function cria_formulario_aposta_simples()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        
        carrega_twig('Aposta_simples.twig', [
            'p'           => $p,
            'categorias'  => $this->model->execQuery("SELECT * FROM categorias ORDER BY str_categoria ASC"),
            'campeonatos' => $this->model->execQuery("SELECT * FROM campeonatos ORDER BY str_campeonato ASC"),
            'times'       => $this->model->execQuery("SELECT * FROM times ORDER BY str_time ASC"),
            'mercados'    => $this->model->execQuery("SELECT * FROM mercados ORDER BY str_mercado ASC")
        ]);
    }

    public function salvaInclusao()
    {
        ver($_POST,0);
        ver('Função para salvar aposta.');
    }
}