<?php

namespace App\Servicos\Organograma;

class OrganogramaForm
{

    public function getFormOrganograma($form)
    {
        $con = \Zion\Banco\Conexao::conectar();
        
        $qb = $con->qb();

        $qb->select('a.organogramaCod AS campoCod, '
                        . 'IF(a.organogramaOrdem != \'\',CONCAT(a.organogramaOrdem, \' - \', '
                        . 'a.organogramaNome, \' [\', b.organogramaClasNome,\']\'), '
                        . 'a.organogramaNome) AS campoDesc')
                ->from('organograma', 'a')
                ->innerJoin('a', 'organograma_clas', 'b', 'a.organogramaClasCod = b.organogramaClasCod')
                ->where('LOCATE(' . $_SESSION['organogramaCod'] . ', a.organogramaAncestral)')
                ->orderBy('a.organogramaCod, a.organogramaOrdem');

        return $form->chosen('organogramaCod', 'Organograma', true)
                        ->setValor($form->retornaValor('organogramaCod'))
                        ->setMultiplo(false)
                        ->setEmColunaDeTamanho('12')
                        ->setCampoCod('campoCod')
                        ->setOrdena(false)
                        ->setSqlCompleto($qb)
                        ->setCampoDesc('campoDesc');
    }

}
