<?php

Class Model
{
    protected $insert_id;

    public function __construct() {
        // echo "Classe Model instanciada.";
    }

    public function execQuery($sql='', $insert=false, $fetchAll=true)
    {
        if ( !empty($sql) ) {
            $con = Connection::getConn();
            $sql = $con->prepare($sql);

            $sql->execute();

            if ( $insert ) {
                $_SESSION['insert_id'] = $con->lastInsertId();
            }

            if ( $fetchAll ) {
                return $sql->fetchAll();
            } else {
                return $sql->fetch();
            }
        }
    }

    public function insert($tab, $dados, $ignore=0)
    {
        $sql = 'insert ' . ($ignore ? ' ignore ' : '') . 'into ' . $tab . ' (' . implode(",", array_keys($dados)) . ') values (' . "'" . implode("','", $dados) . "'" . ')';

        $this->execQuery($sql, true);
    }

    public function update($tab, $dados, $where='')
    {
        $cpos_upd = '';

        foreach ($dados as $key => $value) {
            if ($key != 'str_logo') {
                if ($cpos_upd != '') {
                    $cpos_upd .= ', ';
                }

                if (is_numeric($value)) {
                    $cpos_upd .= "$key = $value";
                } else {
                    $cpos_upd .= "$key = '$value'";
                }
            }
        }
        
        if ( !empty($where) ) {
            $sql = "UPDATE $tab SET $cpos_upd WHERE $where";
            $this->execQuery($sql, false);
        }
    }

    public function delete($tab, $where='')
    {
        if ( !empty($where) ) {
            $sql = "DELETE FROM $tab WHERE $where";
            $this->execQuery($sql, false);
        }
    }

    public function query_lista_confrontos()
    {
        return "SELECT con.*, cat.str_categoria, camp.str_campeonato, camp.str_logo logo_camp, t_casa.str_time time_casa, t_casa.str_logo logo_time_casa,
                t_visitante.str_time time_visitante, t_visitante.str_logo logo_time_visitante
                FROM confrontos con
                    INNER JOIN categorias cat
                    ON cat.id = con.id_categoria
                    
                    INNER JOIN campeonatos camp
                    ON camp.id = con.id_campeonato
                    
                    INNER JOIN times t_casa
                    ON t_casa.id = con.id_time_casa
                    
                    INNER JOIN times t_visitante
                    ON t_visitante.id = con.id_time_visitante
                ORDER BY dat_data DESC";
    }
}