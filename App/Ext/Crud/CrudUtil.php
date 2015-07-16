<?php

/*

  Sappiens Framework
  Copyright (C) 2014, BRA Consultoria

  Website do autor: www.braconsultoria.com.br/sappiens
  Email do autor: sappiens@braconsultoria.com.br

  Website do projeto, equipe e documentação: www.sappiens.com.br

  Este programa é software livre; você pode redistribuí-lo e/ou
  modificá-lo sob os termos da Licença Pública Geral GNU, conforme
  publicada pela Free Software Foundation, versão 2.

  Este programa é distribuído na expectativa de ser útil, mas SEM
  QUALQUER GARANTIA; sem mesmo a garantia implícita de
  COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
  PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
  detalhes.

  Você deve ter recebido uma cópia da Licença Pública Geral GNU
  junto com este programa; se não, escreva para a Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
  02111-1307, USA.

  Cópias da licença disponíveis em /Sappiens/_doc/licenca

 */

/**
 *  @author Pablo Vanni - pablovanni@gmail.com
 *  Classe de utilidades - Usanda na manutenção básica
 *  Atualizada em 14-10-2014 por Pablo Vanni
 */

namespace App\Ext\Crud;

use Zion\Banco\Conexao;
use Pixel\Crud\CrudUtil as CrudZion;
use App\Ext\Arquivo\ArquivoUpload;
use Pixel\Form\MasterDetail\MasterDetail;
use Pixel\Form\MasterVinculo\MasterVinculo;
use App\Servicos\Organograma\OrganogramaSql;

class CrudUtil extends CrudZion
{

    public function __construct($banco = '')
    {
        parent::__construct($banco);
    }

    /**
     * Metodo que processa e retorna partes de uma clausula SQL de acordo com os filtros
     * returna String
     * 
     * @param Object $fil - Objeto de Filtro
     * @param Object|Array $objForm - Um objeto de Form ou um Array de posições e valores
     * @param Array $filtroDinamico - Array de informações sobre o filtro dinamico, posições e alias sql
     * @param Object $queryBuilder - Objeto do queryBuilder
     * @param String $aliasOrganograma - Alias para filtro do organograma
     * @param string $modoBusca - Estilo de Busca, Padrão LIKE (REGEXP|FULLTEXT|LIKE)
     */
    public function getSqlFiltro($fil, $objForm, array $filtroDinamico, $queryBuilder, $aliasOrganograma, $modoBusca = 'LIKE')
    {
        parent::getSqlFiltro($fil, $objForm, $filtroDinamico, $queryBuilder, $modoBusca);

        if (isset($_SESSION['organogramaCod']) and \is_numeric($_SESSION['organogramaCod'])) {

            if ($aliasOrganograma) {
                $aliasOrganograma = $aliasOrganograma . '.';
            }

            $queryBuilder->andWhere($queryBuilder->expr()->eq($aliasOrganograma . 'organogramaCod', $_SESSION['organogramaCod']));
        }
    }

    /**
     * Receber uma string de parametros e o objetoform e processa-os retornando um vetor com os paremtros prontos para a inserção
     * retorna Array
     */
    public function insert($tabela, array $campos, $objForm, array $ignorarObjetos = [])
    {
        if (isset($_SESSION['organogramaCod']) and \is_numeric($_SESSION['organogramaCod']) and \is_object($objForm)) {

            $objForm->set('organogramaCod', $_SESSION['organogramaCod']);

            $campos[] = 'organogramaCod';
        }

        parent::startTransaction();

        $objeto = \is_object($objForm);

        $codigo = parent::insert($tabela, $campos, $objForm, ['upload', 'masterDetail', 'masterVinculo']);

        $this->tiposEspeciaisApp($objeto, $objForm, $codigo, $ignorarObjetos);

        parent::stopTransaction();

        return $codigo;
    }

    public function update($tabela, array $campos, $objForm, array $criterio, array $tipagemCriterio = [], array $ignorarObjetos = [])
    {

        if (isset($_SESSION['organogramaCod']) and \is_numeric($_SESSION['organogramaCod']) and \is_object($objForm)) {

            $criterio['organogramaCod'] = $_SESSION['organogramaCod'];
        }

        parent::startTransaction();

        $objeto = \is_object($objForm);

        $codigo = \current($criterio);

        $linhasAfetadas = parent::update($tabela, $campos, $objForm, $criterio, $tipagemCriterio, ['upload', 'masterDetail', 'masterVinculo']);

        $this->tiposEspeciaisApp($objeto, $objForm, $codigo, $ignorarObjetos);

        parent::stopTransaction();

        return $linhasAfetadas;
    }

    public function delete($tabela, array $criterio, array $tipagemCriterio = [])
    {
        if (isset($_SESSION['organogramaCod']) and \is_numeric($_SESSION['organogramaCod'])) {
            $criterio['organogramaCod'] = $_SESSION['organogramaCod'];
            $tipagemCriterio['organogramaCod'] = \PDO::PARAM_INT;
        }

        return parent::delete($tabela, $criterio, $tipagemCriterio);
    }

    public function tiposEspeciaisApp($objeto, $objForm, $codigo, $ignorarObjetos)
    {
        if ($objeto) {

            $arrayForm = $objForm->getObjetos();

            foreach ($arrayForm as $objeto) {

                $tipoBase = $objeto->getTipoBase();

                if (\in_array($tipoBase, $ignorarObjetos)) {
                    continue;
                }

                switch ($tipoBase) {

                    case 'upload':

                        $upload = new ArquivoUpload();
                        $objeto->setCodigoReferencia($codigo);
                        $upload->sisUpload($objeto);
                        break;

                    case 'masterDetail':

                        $masterDetail = new MasterDetail();
                        $objeto->setCodigoReferencia($codigo);
                        $masterDetail->gravar($objeto);
                        break;

                    case 'masterVinculo':

                        $masterVinculo = new MasterVinculo();
                        $objeto->setCodigoReferencia($codigo);
                        $masterVinculo->gravar($objeto);
                        break;
                }
            }
        }
    }

    public function buscaTexto($tabela, $campo, $valor)
    {
        $con = Conexao::conectar();

        $qb = $con->qb();

        $qb->select('*')
                ->from($tabela, '')
                ->where($qb->expr()->eq($campo, ':' . $campo))
                ->setParameter($campo, $qb->expr()->literal($valor), \PDO::PARAM_STR);

        (new OrganogramaSql())->doOrganograma($qb);

        return $con->paraArray($qb);
    }

    public function buscaNumero($tabela, $campo, $valor)
    {
        $con = Conexao::conectar();

        $qb = $con->qb();

        $qb->select('*')
                ->from($tabela, '')
                ->where($qb->expr()->eq($campo, ':' . $campo))
                ->setParameter($campo, $valor, \PDO::PARAM_INT);

        (new OrganogramaSql())->doOrganograma($qb);

        return $con->paraArray($qb);
    }

}
