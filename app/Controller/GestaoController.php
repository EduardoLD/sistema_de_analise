<?php

Class GestaoController extends CadastroController
{

    public function index()
    {
        $p      = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        $gestao = $this->busca_gestao();

        if ( $gestao ) {
            $this->adiciona_info_gestao($gestao);
        }
        
        carrega_twig('Preview_gestao.twig', [
            'p'      => $p,
            'gestao' => $gestao
        ]);
    }

    public function busca_gestao()
    {
        return $this->model->execQuery("SELECT * FROM gestao ORDER BY id LIMIT 1", false, false);
    }

    public function adiciona_info_gestao(&$gestao)
    {
        $gestao += [
            'flo_stoploss_val'    => (($gestao['flo_stoploss_porc'] / 100) * $gestao['flo_banca_final']),
            'flo_meta_diaria_val' => (($gestao['flo_meta_diaria_porc'] / 100) * $gestao['flo_banca_final'])
        ];
    }
}