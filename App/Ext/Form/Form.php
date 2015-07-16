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

use Pixel\Form\MasterDetail\FormMasterDetail;
use Pixel\Form\Form as FormPixel;
use App\Ext\Form\FormHtml;
use App\Ext\Arquivo\ArquivoUpload;
use App\Ext\Form\FormValida;

class Form extends FormPixel
{

    private $formApp;

    public function __construct()
    {
        parent::__construct();

        $this->formApp = new FormHtml();
    }
    
    /**
     * 
     * @param String $nome
     * @param String $identifica
     * @return \Pixel\Form\FormMasterDetail
     */
    public function masterDetail($nome, $identifica)
    {
        $iMasterDetail = new FormMasterDetail($nome, $identifica);
        
        $iMasterDetail->setIUpload(new ArquivoUpload());
        
        return $iMasterDetail;
    }

    /**
     * Este método é uma extenssão de Form de Pixel, foi criado para interceptar 
     * o campo de upload e a ele dar o poder para trabalhar com organograma de 
     * forma nativa.
     * 
     * Converte um grupo ou apenas o objeto passado por parêmetro em HTML de 
     * acordo com a sua configuração
     * @param null|String $nomeOuObjeto - Nome do objeto a ser convertido em HTML
     * @return String
     * @throws \Exception
     */
    public function getFormHtml($nomeOuObjeto = null)
    {
        $htmlCampos = [];

        if (\is_object($nomeOuObjeto)) {
            $obj[$nomeOuObjeto->getNome()] = $nomeOuObjeto;
            $nome = $nomeOuObjeto->getNome();
            $tipoBase = $nomeOuObjeto->getTipoBase();
        } else {
            $nome = $nomeOuObjeto;

            if ($nomeOuObjeto) {
                $obj = [$nomeOuObjeto => $this->objetos[$nomeOuObjeto]];

                $tipoBase = $this->objetos[$nomeOuObjeto]->getTipoBase();
            } else {
                $obj = $this->objetos;
            }
        }

        foreach ($obj as $idCampo => $objCampos) {

            switch ($objCampos->getTipoBase()) {
                case 'upload':
                    $htmlCampos[$idCampo] = $this->formApp->montaUpload($objCampos);
                    break;
                default : $htmlCampos[$idCampo] = parent::getFormHtml($idCampo);
            }
        }

        return $nome ? $htmlCampos[$nome] : $htmlCampos;
    }
    
    public function validar($nome = null)
    {
        $valida = new FormValida();

        $obj = $nome ? array($this->objetos[$nome]) : $this->objetos;

        foreach ($obj as $objCampos) {
            $valida->validar($objCampos);
        }
    }
}
