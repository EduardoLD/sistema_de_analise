<?php

Class GestaoController extends CadastroController
{

    public function index()
    {
        $p = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        $gestao = $this->busca_gestao();
        // ver($gestao);
        carrega_twig('Preview_gestao.twig', [
            'p'      => $p,
            'gestao' => $gestao
        ]);
    }

    public function busca_gestao()
    {
        return $this->model->execQuery("SELECT * FROM gestao ORDER BY id LIMIT 1", false, false);
    }

}