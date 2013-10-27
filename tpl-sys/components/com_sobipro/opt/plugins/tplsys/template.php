<?php

/*
 * @author
 * Name: Mostafa Shalkami
 * Email: info[at]sobimarket.net
 * @copyright Copyright (C) 2013 Mostafa Shalkami. All rights reserved.
 * @license see http://www.gnu.org/licenses/gpl.html GNU/GPL Version 3.
 * You can use, redistribute this file and/or modify it under the terms of the GNU General Public License version 3
 */

abstract class tplPos {

    public static function fieldsXML($view) {
        SPLoader::loadModel('tplsys');
        $model = new SPTplsysModel;
        $cfg = $model->getCfg();
        $doc = new DOMDocument(Sobi::Cfg('xml.version', '1.0'), Sobi::Cfg('xml.encoding', 'UTF-8'));
        $positions = $doc->createElement('positions');
        foreach ($cfg[$view] as $name => $data) {
            if ($name != 'modes') {
                $fieldsXML = $doc->createElement($name);
                $fields = $data['fields'];
                $fieldsXML->appendChild($doc->createElement('title', $data['title']));
                $fieldsXML->appendChild($doc->createElement('mode', $data['mode']));
                // if it's more than one field in the position - field names separated by a comma
                if (strstr($fields, ",")) {
                    $fields = explode(",", $fields);
                    foreach ($fields as $field) {
                        // we need to get the field name id ( field_test )id from a string like this 16|field_test
                        $nid = end(explode('|', $field));
                        $fieldsXML->appendChild($doc->createElement('field', $nid));
                    }
                } else {
                    $nid = end(explode('|', $fields));
                    if ($nid)
                        $fieldsXML->appendChild($doc->createElement('field', $nid));
                }
                $positions->appendChild($fieldsXML);
            }
        }
        return $positions;
    }

}
?>

