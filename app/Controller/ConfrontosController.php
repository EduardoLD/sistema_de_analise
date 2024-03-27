<?php

Class ConfrontosController extends CadastroController
{
    public function alteracao($id)
    {
        $p            = filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS);
        $query        = $this->model->query_lista_confrontos();
        $dados        = $this->model->execQuery($query, false, false);

        carrega_twig('Alteracao_confrontos.twig', [
            'p'           => $p,
            'id'          => $id,
            'op'          => filter_input(INPUT_GET, 'op', FILTER_SANITIZE_SPECIAL_CHARS),
            'cabec'       => $this->model->execQuery("SELECT COLUMN_NAME fields FROM information_schema.columns WHERE table_schema = 'db_analise' AND table_name = '$p'"),
            'campeonatos' => $this->model->execQuery("SELECT * FROM campeonatos ORDER BY str_campeonato"),
            'dados'       => $dados,
            'categorias'  => $this->model->execQuery("SELECT c.id, c.str_categoria FROM categorias c ORDER BY c.id"),
            'times'       => $this->model->execQuery("SELECT * FROM times ORDER BY str_time")
        ]);
    }

    public function salvaAlteracao()
    {
        $id     = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
        $tab    = filter_input(INPUT_GET, 'tab', FILTER_SANITIZE_SPECIAL_CHARS);
        $post   = filter_input_array(INPUT_POST, FILTER_SANITIZE_FULL_SPECIAL_CHARS);
        $mypost = array_map_recursive( fn($e) => html_entity_decode(htmlentities($e, ENT_QUOTES, 'UTF-8'), ENT_QUOTES , 'UTF-8') , $_POST);

        $this->model->update($tab, $mypost, "id = $id");
        
        redirect('?p=' . $tab);
    }
}