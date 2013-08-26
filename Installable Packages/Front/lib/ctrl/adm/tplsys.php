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
SPLoader::loadController('config', true);
SPLoader::loadModel('tplsys');
ini_set("display_errors", 1);
error_reporting(E_ALL);

/**
 * @author Mostafa shalkami
 */
class SPTplsysCtrl extends SPConfigAdmCtrl {

    /**
     * @var string
     */
    protected $_type = 'tplsys';

    /**
     * @var string
     */
    protected $_defTask = 'list';

    public function execute() {
        $this->_task = strlen($this->_task) ? $this->_task : $this->_defTask;
        switch ($this->_task) {
            case 'list':
                $this->config();
                Sobi::ReturnPoint();
                break;
            case 'save':
                $this->saveData();
                break;
            default:
                if (!( parent::execute() )) {
                    Sobi::Error(__CLASS__, 'Task not found', SPC::WARNING, 404, __LINE__, __FILE__);
                }
                break;
        }
    }

    private function saveData() {
        $data = SPRequest::search('SPCfg_');
        foreach ($data as $view => $positions) {
            foreach ($positions as $key => $cfg) {
                $data[$view][$key]['fields'] = implode(",", $cfg['fields']);
            }
        }
        $model = new SPTplsysModel;
        $cfg = $model->getCfg();
        $cfg['vcard'] = array_merge(array("modes" => $cfg['vcard']['modes']), $data['SPCfg_vcard']);
        $cfg['details'] = array_merge(array("modes" => $cfg['details']['modes']), $data['SPCfg_details']);
        $cfg['edit'] = array_merge(array("modes" => $cfg['edit']['modes']), $data['SPCfg_edit']);
        $model->write_ini_file($cfg);
        Sobi::Redirect(SPMainFrame::getBack(), Sobi::Txt('Saved'));
    }

    private function config() {
        $view = $this->getView('tplsys');
        SPFactory::header()
                ->addJsFile('jquery')
                ->addJsFile('jquery-ui')
                ->addJsFile('bootstrap', true)
                ->addJsFile('bootstrap-select', true)
                ->addJsFile('tplsys', true);
        SPFactory::header()
                ->addCssFile('bootstrap', true)
                ->addCssFile('bootstrap-select', true)
                ->addCssFile('tplsys', true);
        $model = new SPTplsysModel;
        $cfg = $model->getCfg();
        $fieldsEdit = $model->fields('edit');
        $fieldsVcard = $model->fields('vcard');
        $fieldsDetails = $model->fields('details');
        $view->assign($fieldsEdit, 'fieldsEdit');
        $view->assign($fieldsVcard, 'fieldsVcard');
        $view->assign($fieldsDetails, 'fieldsDetails');
        $view->assign($cfg, 'cfg');
        $view->loadConfig('config.tplsys');
        $view->setTemplate('config.tplsys');
        $view->display();
    }

}
