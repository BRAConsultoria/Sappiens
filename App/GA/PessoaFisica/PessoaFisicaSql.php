<?php

namespace App\GA\PessoaFisica;

use Zion\Banco\Conexao;
use Pixel\Filtro\Filtrar;
use App\Ext\Crud\CrudUtil;
use App\Servicos\Organograma\OrganogramaSql;

class PessoaFisicaSql
{

    /**
     * @var \Zion\Banco\Conexao
     */
    protected $con;

    public function __construct()
    {
        $this->con = Conexao::conectar();
    }

    public function filtrarSql($objForm, $colunas)
    {
        $fil = new Filtrar($objForm);
        $util = new CrudUtil();

        $qb = $this->con->qb();

        $qb->select('*')
                ->from('pessoa_fisica', 'a');

        $util->getSqlFiltro($fil, $objForm, $colunas, $qb, 'a');

        return $qb;
    }

    public function getDadosSql($cod)
    {
        $qb = $this->con->qb();

        $qb->select('*')
                ->from('pessoa_fisica', 'a')
                ->where($qb->expr()->eq('a.pessoaFisicaCod', ':pessoaFisicaCod'))
                ->setParameter('pessoaFisicaCod', $cod);

        (new OrganogramaSql())->filtrarOrganogramaSql($qb, 'a');

        return $qb;
    }

}
