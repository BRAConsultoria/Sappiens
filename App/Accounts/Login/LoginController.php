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

use App\Ext\Core\Controller;

class LoginController extends Controller
{

    private $loginClass;

    public function __construct()
    {
        parent::__construct();
        $this->loginClass = new LoginClass();
    }

    protected function iniciar()
    {

        $retorno = '';

        try {

            $this->loginClass->verificaSessaoIniciada();

        } catch (\Exception $ex) {

            $retorno = $ex;
        }

        return $this->layout()->render('login_personalizado.html.twig', 
            ['pageHeader' => 
                [
                    'titulo' => SIS_NOME_PROJETO, 
                    'slogan' => SIS_NOME_PROJETO_SLOGAN,
                    'versao' => SIS_RELEASE
                ]
            ]);
    }

    protected function getAuth()
    {
        $l = \filter_input(\INPUT_POST, 'email');
        $p = \filter_input(\INPUT_POST, 'signin_password');

        $retorno = ['login' => ['email' => $l]];
        
        try {

            if ($this->loginClass->getAuth($l, $p)) {

                header('location: ' . \SIS_URL_BASE . 'Dashboard');

            } else {

                $retorno['login']['mensagem'] = 'Oops! Dados incorretos...';
                $retorno['login']['sucesso'] = false; 
            }
        } catch (\Exception $e) {
            $retorno['login']['mensagem'] = $e->getMessage();
            $retorno['login']['sucesso'] = false; 

        }

        return $this->layout()->render('login_personalizado.html.twig', 
            ['pageHeader' => 
                [
                    'titulo' => SIS_NOME_PROJETO, 
                    'slogan' => SIS_NOME_PROJETO_SLOGAN,
                    'versao' => SIS_RELEASE
                ],
             'retorno' => $retorno
            ]);                
    }

    protected function recovery()
    {
        $l = \filter_input(\INPUT_POST, 'email');
        $retorno = ['recovery' => []];
        
        try {

            if ($this->loginClass->recovery($l) === true) {
                $retorno['recovery']['mensagem']    = 'Um email com instruções para a redefinição da sua senha foi enviado para';
                $retorno['recovery']['sucesso']     = true;
            }

        } catch (\Exception $e) {
            $retorno['recovery']['mensagem'] = $e->getMessage();
        }
        
        $retorno['recovery']['email'] = $l;
                
        return $this->layout()->render('login_personalizado.html.twig', 
            ['pageHeader' => 
                [
                    'titulo' => SIS_NOME_PROJETO, 
                    'slogan' => SIS_NOME_PROJETO_SLOGAN,
                    'versao' => SIS_RELEASE
                ],
             'retorno' => $retorno
            ]);    
    }

    protected function recoverPass()
    {

        $email = \filter_input(\INPUT_GET, 'email');
        $hash = \filter_input(\INPUT_GET, 'hash');

        $retorno = ['reset' => ['email' => $email,
                                'hash'  => $hash
                               ]]; 

        try {

            if ($this->loginClass->validaHash($email, $hash) === false) {
                header("location: " . \SIS_URL_BASE . '');
            }
            
        } catch (\Exception $e) {
            $retorno['reset']['mensagem'] = $e->getMessage();
            $retorno['reset']['sucesso'] = false;
        }

        return $this->layout()->render('login_personalizado.html.twig', 
            ['pageHeader' => 
                [
                    'titulo' => SIS_NOME_PROJETO, 
                    'slogan' => SIS_NOME_PROJETO_SLOGAN,
                    'versao' => SIS_RELEASE
                ],
             'retorno' => $retorno
            ]);    
    }

    protected function setNewPass()
    {

        $email = \filter_input(\INPUT_POST, 'email');
        $hash = \filter_input(\INPUT_POST, 'hash');

        $senha = \filter_input(\INPUT_POST, 'new_password');
        $senhaB = \filter_input(\INPUT_POST, 'new_password_b');
        
        $retorno = ['reset' => ['email' => $email,
                                'hash'  => $hash
                               ]]; 

        try {

            if ($this->loginClass->validaHash($email, $hash) === false) {
                header("location: " . SIS_URL_BASE . '');
            }

            if ($this->loginClass->setNewPass($email, $hash, $senha, $senhaB) === true) {
                
                $retorno['reset']['sucesso'] = true;
            }
            
        } catch (\Exception $e) {

            $retorno['reset']['mensagem'] = $e->getMessage();
            $retorno['reset']['sucesso'] = false;

        }

        return $this->layout()->render('login_personalizado.html.twig', 
            ['pageHeader' => 
                [
                    'titulo' => SIS_NOME_PROJETO, 
                    'slogan' => SIS_NOME_PROJETO_SLOGAN,
                    'versao' => SIS_RELEASE
                ],
             'retorno' => $retorno
            ]);    
    }

}
