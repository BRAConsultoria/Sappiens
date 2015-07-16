<?php

namespace App\Servicos\Organograma;

class OrganogramaSql
{

    public function filtrarOrganogramaSql($qb, $alias)
    {
        if (isset($_SESSION['organogramaCod'])) {
            $qb->innerJoin($alias, 'organograma', 'agng', $alias.'.organogramaCod = agng.organogramaCod')
                    ->andWhere('INSTR(agng.organogramaAncestral,CONCAT(\'|\', ' . $_SESSION['organogramaCod'] . ',\'|\')) > 0');
        }
    }

}
