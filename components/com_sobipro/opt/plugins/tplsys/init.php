<?php
/*
 * @author
 * Name: Mostafa Shalkami
 * Email: info[at]sobimarket.net
 * @copyright Copyright (C) 2013 Mostafa Shalkami. All rights reserved.
 * @license see http://www.gnu.org/licenses/gpl.html GNU/GPL Version 3.
 * You can use, redistribute this file and/or modify it under the terms of the GNU General Public License version 3
 */  

defined('SOBIPRO') || exit('Restricted access');

class SPTplsysApp extends SPApplication {

    public function __construct() {
    }

    public function provide($action) {
        return in_array($action, array('CreateAdmMenu', 'TemplateEngineRegisterFunctions'));
    }

    public function CreateAdmMenu(&$menu) {
        if (( Sobi::Section())) {
            $menu['AMN.APPS_SECTION_TPL']['tplsys'] = 'Template configuration';
        }
    }

    public function TemplateEngineRegisterFunctions(&$functions) {
        $class = SPLoader::loadClass( 'opt.plugins.tplsys.template' );
        $methods = get_class_methods( $class );
        if ( count( $methods ) ) {
            foreach ( $methods as $method ) {
                $functions[] = $class . '::' . $method;
            }
        }
    }

}
