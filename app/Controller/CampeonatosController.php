<?php

Class CampeonatosController extends CadastroController
{


    // public function index()
    // {
    //     // $dados = $this->testeAPI();
    //     // ver($dados);
    //     $loader     = new \Twig\Loader\FilesystemLoader('app/View/Html');
    //     $twig       = new \Twig\Environment($loader);
    //     $template   = $twig->load('Campeonatos.twig');
        
    //     $parametros = [
    //         'p'           => filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS),
    //         'campeonatos' => (new Model)->execQuery("SELECT * FROM campeonatos ORDER BY id")
    //     ];

    //     $conteudo   = $template->render($parametros);
        
    //     echo $conteudo;
    // }

    // public function inclusao()
    // {
    //     $loader   = new \Twig\Loader\FilesystemLoader('app/View/Html');
    //     $twig     = new \Twig\Environment($loader);
    //     $template = $twig->load('IncluiCampeonato.twig');

    //     $parametros = [
    //         'p' => filter_input(INPUT_GET, 'p', FILTER_SANITIZE_SPECIAL_CHARS)
    //     ];
        
    //     $conteudo = $template->render($parametros);
        
    //     echo $conteudo;
    // }

    public function testeAPI()
    {
        $APIkey = '71cd82793d2c42eead20afa46d3bf039';
        // code = PL > Premier League
        // code = CDB > Copa do Brasil
        $url = 'http://api.football-data.org/v4/competitions/CDB/teams';
        // $APIkey='a05f8428d3b8ca6175d178be76eafe8d947d955e5e7f49538164cc400eeb7660';
        // $url = "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId=4287&APIkey=$APIkey";

        // parametros:
        // ?met=Leagues                     LISTA DE CAMPEONATOS
        // ?met=Standings&leagueId=177      LISTA TIMES DO CAMPEONATO INFORMADO |177 = Premier League da Ghana|423 Copa da Lituania
        // ?&met=Teams&teamId=4287           LISTA TIME

        $curl_options = array(
          CURLOPT_URL => $url,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_HEADER => false,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_CONNECTTIMEOUT => 5
        );
        
        $curl = curl_init();
        curl_setopt_array( $curl, $curl_options );
        $result = curl_exec( $curl );
        
        $result = (array) json_decode($result);
        
        // var_dump($result);
        return $result;
    }
}