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

namespace App\Ext\Twig;

use Zion\Menu\Menu;
use Zion\Exception\Exception;
use Pixel\Twig\Carregador as CarregadorPixel;
use Base\Sistema\Modulo\ModuloClass;
use App\Notificacao\Notificacao;
use Base\Sistema\Organograma\OrganogramaForm;
use Base\Sistema\Organograma\OrganogramaClass;

class Carregador extends CarregadorPixel
{

    public function __construct($namespace = '')
    {
        parent::__construct($namespace);

        $this->menu();
        $this->pageHeader();
        $this->organogramaHeader();
        $this->notificacoes();
        $this->erro();
    }

    private function menu()
    {
        $menu = new \Twig_SimpleFunction('menu', function () {

            $m = new Menu();

            $dados = [
                'titulo' => \SIS_NOME_PROJETO,
                'versao' => \SIS_RELEASE,                
                'nomeUsuario' => $_SESSION['pessoaFisicaNome'],
                'avatarUsuario' => $_SESSION['pessoaFisicaAvatar'],
                'menu' => $m->geraMenu(true)
            ];

            return $this->twig()->render('menu.html.twig', $dados);
        });

        $this->twig()->addFunction($menu);
    }

    protected function organogramaHeader()
    {
        $organogramaHeader = new \Twig_SimpleFunction('organogramaHeader', function ($pos) {

            $orgForm = new OrganogramaForm();
            $orgClass = new OrganogramaClass();

            $organograma = [
                'organograma' => $orgForm->getOrganogramaTopoForm(),
                'resetOrganograma' => $orgClass->getResetOrganograma()
            ];

            return $organograma[$pos];
        });

        $this->twig()->addFunction($organogramaHeader);
    }

    private function notificacoes()
    {
        $notificacoes = new \Twig_SimpleFunction('notificacoes', function () {

            if(isset($_SESSION['usuarioCod'])){
                return (new Notificacao())->getUltimasNotificacoes($_SESSION['usuarioCod']);
            } else {
                return ['handler' => ''];
            }
        });

        $this->twig()->addFunction($notificacoes);
    }

    private function erro()
    {
        $erro = new \Twig_SimpleFunction('erro', function ($exception) {

            return ['exception' => $exception,
                'exceptionTrace' => Exception::getMessageTrace($exception),
                'env' => \SIS_RELEASE,
                'debug' => \SIS_DEBUG,
                'requestData' => $_REQUEST,
                'sessionData' => $_SESSION];
        });

        $this->twig()->addFunction($erro);
    }

    private function pageHeader()
    {

        $pageHeader = new \Twig_SimpleFunction('pageHeader', function ($pos) {

            if (\defined('MODULO')) {

                $modulo = (new ModuloClass)->getDadosModulo(\MODULO);

                $dadosModulo = [
                    'titulo' => \SIS_NOME_PROJETO,
                    'modulonome' => $modulo['modulonome'],
                    'moduloclass' => $modulo['moduloclass'],
                    'modulodesc' => $modulo['modulodesc'],
                    'versao' => \SIS_RELEASE,
                    'nomeUsuario' => $_SESSION['pessoaFisicaNome'],
                    'avatarUsuario' => $_SESSION['pessoaFisicaAvatar']
                ];

                return $dadosModulo[$pos];
            }

            return 'não definido';
        });

        $this->twig()->addFunction($pageHeader);
    }

}