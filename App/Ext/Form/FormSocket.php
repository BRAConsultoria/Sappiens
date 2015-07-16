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

namespace App\Ext\Form;

class FormSocket
{
    private $configs;
    
    /**
     * FormSocket::__construct()
     * 
     * @param mixed $form
     * @param array $campos
     * @param array $configs configs['nome'             => 'nome', 
     *                               'pesquisa'         => '{"tabela"      : ["nome"],
     *                                                      "campoDado"    : ["nomeCod", "nome"],
     *                                                      "condicao"     : {nomeCod: $nomeCod},
     *                                                      "orderna"      : "nomeCod",
     *                                                      "offset"       : 0,
     *                                                      "limit"        : 10,
     *                                                      "metodo"       : "getNome"}',
     *                               'evento'           => '$(document).ready(function{',
     *                               'startDelay'       => '',
     *                               'connectionPort    => ''
     *                              ]
     * @return object Objeto do método.
     */
    public function __construct($config = []) 
    {   
        $this->configs = $config;
    }


    public function setConfigs($configs)
    {
        if(is_array($configs)){
            $this->configs = $configs;
        } else {
            throw new \Exception("configs: O valor inforamdo deve ser um array");
        }
    }
    
    public function getConfigs(){
        return $this->configs;
    }
    /**
     * FormSocket::processar()
     * Parâmetro opcional, se tiver sido informado no construtor.
     * 
     * @param mixed $form
     * @param array $campos
     * @param array $configs configs['nome'             => 'nome', 
     *                               'pesquisa'         => '{"tabela"      : ["nome"],
     *                                                      "campoDado"    : ["nomeCod", "nome"],
     *                                                      "condicao"     : {nomeCod: $nomeCod},
     *                                                      "orderna"      : "nomeCod",
     *                                                      "offset"       : 0,
     *                                                      "limit"        : 10,
     *                                                      "metodo"       : "getNome"}',
     *                               'evento'           => '$(document).ready(function{',
     *                               'startDelay'       => '',
     *                               'connectionPort    => ''
     *                              ]
     * @return object Objeto do método.
     */
    public function processar($configs = NULL)
    {
        if(\is_array($configs)){
            $this->setConfigs($configs);
        } else {
            $configs    = $this->configs;
        }
        
        $wsObject = 'webSocket'. $configs['nome'];
        
        return ['threadId'          => $this->getRandomThreadId(),
                'nome'              => $wsObject,
                'pesquisa'          => $configs['pesquisa'],
                'evento'            => (empty($configs['evento']) ? 'setTimeout(function(){' : $configs['evento']),
                'callback'          => (empty($configs['callback']) ? '$(\'#'. $wsObject .'\').html(data);' : $configs['callback']),
                'startDelay'        => (empty($configs['startDelay']) ? NULL : $configs['startDelay']),
                'connectionPort'    => (\defined('SOCKET_CONNECTION_PORT') ? SOCKET_CONNECTION_PORT : '8081')
               ];
    }
    
    private function getRandomThreadId()
    {
        return md5(bin2hex(openssl_random_pseudo_bytes(30)));
    }
}