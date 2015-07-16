<?php

require '../../Config.php';

\define('MODULO', 'PessoaFisica');

use App\GA\PessoaFisica\PessoaFisicaController;

echo (new PessoaFisicaController())->controle(\filter_input(\INPUT_GET, 'acao'));
