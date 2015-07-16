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

namespace App;

\define('SIS_ID_NAMESPACE_PROJETO', 'App');
\define('SIS_DIR_BASE', \str_replace('\\', '/', \dirname(__FILE__)) . '/');
$_SESSION['SIS_DIR_BASE'] = \SIS_DIR_BASE;

\define('SIS_URL_BASE', '//localhost/Sappiens/App/');
\define('SIS_URL_BASE_SITE', '//localhost/Sappiens/App/Tema/Vendor/');
\define('SIS_URL_BASE_STATIC', \SIS_URL_BASE . 'Static/');
\define('SIS_URL_BASE_STORAGE', '//localhost/Sappiens/App/Storage/');

\define('SIS_DIR_DEFAULT_BASE', 'C:/xampp/htdocs/Base/');
\define('SIS_URL_DEFAULT_BASE', '//localhost/Base/');

\define('SIS_FM_BASE', 'C:/xampp/htdocs/Zion/');
\define('SIS_URL_FM_BASE', '//localhost/Zion/');

\define('SIS_NAMESPACE_PROJETO', 'C:/xampp/htdocs/Sappiens');
\define('SIS_NAMESPACE_FRAMEWORK', \SIS_FM_BASE . 'Lib');
\define('SIS_NAMESPACE_BASE', 'C:/xampp/htdocs');
\define('SIS_NAMESPACE_SITES', \SIS_NAMESPACE_PROJETO . '/App/Render');

\define('SOCKET_CONNECTION_PORT', '8081');
\define('SOCKET_START_DELAY', '30000');

\define('SIS_URL_BASE_RENDER', '//localhost/Sappiens/App/Render/Sites/');