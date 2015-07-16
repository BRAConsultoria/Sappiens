<?php

/**
 *
 *    Sappiens Framework
 *    Copyright (C) 2014, BRA Consultoria
 *
 *    Website do autor: www.braconsultoria.com.br/sappiens
 *    Email do autor: sappiens@braconsultoria.com.br
 *
 *    Website do projeto, equipe e documentação: www.sappiens.com.br
 *   
 *    Este programa é software livre; você pode redistribuí-lo e/ou
 *    modificá-lo sob os termos da Licença Pública Geral GNU, conforme
 *    publicada pela Free Software Foundation, versão 2.
 *
 *    Este programa é distribuído na expectativa de ser útil, mas SEM
 *    QUALQUER GARANTIA; sem mesmo a garantia implícita de
 *    COMERCIALIZAÇÃO ou de ADEQUAÇÃO A QUALQUER PROPÓSITO EM
 *    PARTICULAR. Consulte a Licença Pública Geral GNU para obter mais
 *    detalhes.
 * 
 *    Você deve ter recebido uma cópia da Licença Pública Geral GNU
 *    junto com este programa; se não, escreva para a Free Software
 *    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
 *    02111-1307, USA.
 *
 *    Cópias da licença disponíveis em /Sappiens/_doc/licenca
 *
 */

namespace App\Accounts\Login;

use Zion\Banco\Conexao;

class LoginSql
{

    private $con;

    public function __construct()
    {
        $this->con = Conexao::conectar();
    }

    public function getAuth($l, $p)
    {
        $qb = $this->con->qb();

        $qb->select('a.usuarioCod', 'a.organogramaCod', 'a.perfilCod', 'a.usuarioLogin', 'a.numeroAcessos')
                ->from('_usuario', 'a')
                ->where($qb->expr()->eq('a.usuarioLogin', ':usuarioLogin'))
                ->andWhere($qb->expr()->eq('a.usuarioSenha', ':usuarioSenha'))
                ->setParameters([':usuarioLogin' => $l, ':usuarioSenha' => $p]);

        return $qb;
    }

    public function validaSenhaUsuarioSql($usuarioCod, $usuarioSenha)
    {
        $qb = $this->con->qb();

        $qb->select('a.usuarioCod')
                ->from('_usuario', 'a')
                ->where($qb->expr()->eq('a.usuarioCod', ':usuarioCod'))
                ->andWhere($qb->expr()->eq('a.usuarioSenha', ':usuarioSenha'))
                ->setParameters([':usuarioCod' => $usuarioCod, ':usuarioSenha' => $usuarioSenha], [\PDO::PARAM_INT, \PDO::PARAM_STR]);

        return $qb;
    }

    public function registraAcessoSql($usuarioCod, $numeroAcessos)
    {
        $qb = $this->con->qb();

        $qb->update("_usuario", "a")
                ->set("a.numeroAcessos", ":numeroAcessos")
                ->set("a.usuarioUltimoAcesso", $qb->expr()->literal(date('Y-m-d H:i:s')))
                ->where($qb->expr()->eq("a.usuarioCod", ":usuarioCod"))
                ->setParameter("numeroAcessos", $numeroAcessos, \PDO::PARAM_INT)
                ->setParameter("usuarioCod", $usuarioCod, \PDO::PARAM_INT);

        return $qb;
    }

    public function getDadosRecoverySql($l)
    {
        $qb = $this->con->qb();

        $qb->select('*')
                ->from('_usuario', 'a')
                ->where($qb->expr()->eq('a.usuarioLogin', ':usuarioLogin'))
                ->setParameter('usuarioLogin', $l, \PDO::PARAM_STR);

        return $qb;
    }

    public function getHashRecoverySql($usuarioCod, $hash)
    {
        $qb = $this->con->qb();

        $qb->insert("_usuario_recovery")
                ->values(['usuarioCod' => ':usuarioCod',
                    'usuarioRecoveryHash' => ':usuarioRecoveryHash',
                    'usuarioRecoveryDataHora' => $qb->expr()->literal(date('Y-m-d H:i:s')),
                    'usuarioRecoveryStatus' => $qb->expr()->literal("A")
                ])
                ->setParameters(['usuarioCod' => $usuarioCod,
                    'usuarioRecoveryHash' => $hash
                        ], ['usuarioCod' => \PDO::PARAM_INT,
                    'usuarioRecoveryHash' => \PDO::PARAM_STR
        ]);

        return $qb;
    }

    public function validaHashSql($usuarioCod, $hash)
    {
        $qb = $this->con->qb();

        $qb->select('a.*')
                ->from('_usuario_recovery', 'a')
                ->where($qb->expr()->eq('usuarioCod', ':usuarioCod'))
                ->andWhere($qb->expr()->eq('usuarioRecoveryHash', ':usuarioRecoveryHash'))
                ->setParameters([':usuarioCod' => $usuarioCod, ':usuarioRecoveryHash' => $hash], [\PDO::PARAM_INT, \PDO::PARAM_STR]);

        return $qb;
    }

    public function invalidaHashSql($usuarioCod, $hash)
    {
        $qb = $this->con->qb();

        $qb->update('_usuario_recovery')
                ->set("usuarioRecoveryStatus", $qb->expr()->literal('I'))
                ->where($qb->expr()->eq('usuarioCod', ':usuarioCod'))
                ->andWhere($qb->expr()->eq('usuarioRecoveryHash', ':usuarioRecoveryHash'))
                ->setParameters([':usuarioCod' => $usuarioCod, ':usuarioRecoveryHash' => $hash], [\PDO::PARAM_INT, \PDO::PARAM_STR]);

        return $qb;
    }

    public function setNewPassSql($usuarioCod, $senha)
    {
        $qb = $this->con->qb();

        $qb->update('_usuario')
                ->set("usuarioSenha", ":usuarioSenha")
                ->where($qb->expr()->eq('usuarioCod', ':usuarioCod'))
                ->setParameters([':usuarioCod' => $usuarioCod, ':usuarioSenha' => $senha], [':usuarioCod' => \PDO::PARAM_INT, ':usuarioSenha' => \PDO::PARAM_STR]);

        return $qb;
    }
    
    public function getDadosPessoaisSql($usuarioCod, $organogramaCod)
    {
        $qb = $this->con->qb();

        $qb->select('a.pessoaCod, b.pessoaFisicaCod, b.pessoaFisicaNome')
            ->from('pessoa', 'a')
            ->innerJoin('a', 'pessoa_fisica', 'b', 'a.pessoaCod = b.pessoaCod')
            ->where($qb->expr()->eq('a.usuarioCod', ':usuarioCod'))
            ->andWhere($qb->expr()->eq('a.organogramaCod', ':organogramaCod'))
            ->setParameters(['usuarioCod' => $usuarioCod, 'organogramaCod' => $organogramaCod], [\PDO::PARAM_INT, \PDO::PARAM_INT]);

        return $qb;
    }    
    
    public function getPessoaFisicaFotoSql($cod, $moduloCod)
    {

        $qb = $this->con->qb();

        $qb->select('a.uploadNomeFisico, '
                . 'a.uploadNomeOriginal, '
                . 'a.uploadMime, '
                . 'YEAR(a.uploadDataCadastro) AS Ano, '
                . 'MONTH(a.uploadDataCadastro) AS Mes, '
                . 'DAY(a.uploadDataCadastro) AS Dia')
           ->from('_upload', 'a')
           ->where($qb->expr()->eq('a.uploadCodReferencia', ':uploadCodReferencia'))
           ->andWhere($qb->expr()->eq('a.moduloCod', ':moduloCod'))
           ->andWhere($qb->expr()->eq('a.uploadNomeCampo', ':uploadNomeCampo'))
           ->setParameters(
                [
                    'uploadCodReferencia' => $cod,
                    'moduloCod' => $moduloCod,
                    'uploadNomeCampo' => 'uploadPessoaFisicaFoto'
                ], 
                [
                    'uploadCodReferencia' => \PDO::PARAM_INT,
                    'moduloCod' => \PDO::PARAM_INT,
                    'uploadNomeCampo' => \PDO::PARAM_STR,
                ]);

        return $qb;

    }    

}
