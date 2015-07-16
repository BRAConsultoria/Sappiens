<?php

namespace App\GA\PessoaFisica;

use App\Ext\Crud\CrudUtil;
use Pixel\Grid\GridPadrao;
use Zion\Paginacao\Parametros;

class PessoaFisicaClass extends PessoaFisicaSql
{

    private $chavePrimaria;
    private $crudUtil;
    private $tabela;
    private $colunasCrud;
    private $colunasGrid;
    private $filtroDinamico;

    public function __construct()
    {
        parent::__construct();

        $this->crudUtil = new CrudUtil();

        $this->tabela = 'pessoa_fisica';
        $this->chavePrimaria = 'pessoaFisicaCod';

        $this->colunasCrud = [
            'pessoaFisicaNome',
            'pessoaFisicaCPF',
            'pessoaFisicaDataNascimento',
            'pessoaFisicaSexo',
            'pessoaFisicaStatus'
        ];

        $this->colunasGrid = [
            'pessoaFisicaNome'              => "Nome",
            'pessoaFisicaDataNascimento'    => "Data de nascimento",
            'pessoaFisicaCPF'               => "CPF",
            'pessoaFisicaSexo'              => "Sexo"
        ];

        $this->filtroDinamico = [
            'pessoaFisicaNome' => "a",
            'pessoaFisicaSexo' => "a",
            'pessoaFisicaCPF' => "a"
        ];
    }

    public function filtrar($objForm)
    {
        $grid = new GridPadrao();

        Parametros::setParametros("GET", $this->crudUtil->getParametrosGrid($objForm));

        $grid->setColunas($this->colunasGrid);

        $grid->setSql(parent::filtrarSql($objForm, $this->filtroDinamico));
        $grid->setChave($this->chavePrimaria);
        $grid->formatarComo('PessoaFisicaDataNascimento', 'DATA');
        $grid->substituaPor('PessoaFisicaSexo', [
            'M' => "Masculino",
            'F' => "Feminino"
        ]);
        $grid->setAliasOrdena('a');
        return $grid->montaGridPadrao();
    }

    public function cadastrar($objForm)
    {
        
        $objForm->set('usuarioCod', NULL);
        $objForm->set('pessoaTipo', 'F');
        
        $pessoaCod = $this->crudUtil->insert('pessoa', [
            'usuarioCod',
            'pessoaTipo',
        ], $objForm);
        
        $objForm->set('pessoaCod', $pessoaCod);

        return $this->crudUtil->insert($this->tabela, $this->colunasCrud, $objForm);
    }

    public function alterar($objForm)
    {
        $afetados = $this->crudUtil->update($this->tabela, $this->colunasCrud, $objForm, [$this->chavePrimaria => $objForm->get('cod')]);

        return $afetados;
    }

    public function remover($cod)
    {
        return $this->crudUtil->delete($this->tabela, [$this->chavePrimaria => $cod]);
    }

    public function setValoresFormManu($cod, $formIntancia)
    {
        $objForm = $formIntancia->getFormManu('alterar', $cod);

        $parametrosSql = $this->con->execLinhaArray(parent::getDadosSql($cod));

        $this->crudUtil->setParametrosForm($objForm, $parametrosSql, $cod);

        return $objForm;
    }

}
