<?php
/*
 * @author
 * Name: Mostafa Shalkami
 * Email: info[at]sobimarket.net
 * @copyright Copyright (C) 2013 Mostafa Shalkami. All rights reserved.
 * @license see http://www.gnu.org/licenses/gpl.html GNU/GPL Version 3.
 * You can use, redistribute this file and/or modify it under the terms of the GNU General Public License version 3
 */
//ini_set("display_errors", 1);
//error_reporting(E_ALL);
$cfg = $this->get('cfg');
?>
<div id="SobiPro">
    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">           
                <?php $this->menu(); ?>
            </div>
            <div class="span9">
                <div class="tabbable">
                    <ul class="nav nav-tabs" style="margin-bottom: 0">
                        <li class="active">
                            <a href="#pane1" data-toggle="tab">
                                V-Card view fields positions
                            </a>
                        </li>
                        <li>
                            <a href="#pane2" data-toggle="tab">
                                Details view fields positions
                            </a>
                        </li>
                        <li>
                            <a href="#pane3" data-toggle="tab">
                                Edit form fields positions
                            </a>
                        </li>
                    </ul>
                    <div class="tab-content" style="background:#fff; padding: 10px; border: 1px solid #DDDDDD; border-top: none; overflow: visible;">
                        <div id="pane1" class="tab-pane active">
                            <?php
                            foreach ($cfg['vcard'] as $position => $title) :
                                if ($position != 'modes') :
                                    ?>
                                    <div class="row-fluid">
                                        <div class="controls span12">
                                            <h4><?php echo $position ?></h4>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Title</span>
                                                <?php $this->field('text', 'SPCfg_vcard[' . $position . '][title]', $cfg['vcard'][$position]['title'], array('class' => '')); ?>
                                            </div>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Style</span>
                                                <?php $this->field('select', 'SPCfg_vcard[' . $position . '][mode]', $cfg['vcard']['modes'], $cfg['vcard'][$position]['mode'], false, array('class' => '')); ?>
                                            </div>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Fields</span>
                                                <?php $this->field('select', 'SPCfg_vcard[' . $position . '][fields]', $this->get('fieldsVcard'), explode(",", $cfg['vcard'][$position]['fields']), true, array('class' => 'span10 multisel')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <?php
                                endif;
                            endforeach;
                            ?>
                        </div>
                        <div id="pane2" class="tab-pane">
                            <?php
                            foreach ($cfg['details'] as $position => $title) :
                                if ($position != 'modes') :
                                    ?>
                                    <div class="row-fluid">
                                        <div class="controls span12">
                                            <h4><?php echo $position ?></h4>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Title</span>
                                                <?php $this->field('text', 'SPCfg_details[' . $position . '][title]', $cfg['details'][$position]['title'], array('class' => '')); ?>
                                            </div>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Style</span>
                                                <?php $this->field('select', 'SPCfg_details[' . $position . '][mode]', $cfg['details']['modes'], $cfg['details'][$position]['mode'], false, array('class' => '')); ?>
                                            </div>
                                            <div class="input-prepend">
                                                <span class="add-on">Block Fields</span>
                                                <?php $this->field('select', 'SPCfg_details[' . $position . '][fields]', $this->get('fieldsDetails'), explode(",", $cfg['details'][$position]['fields']), true, array('class' => 'span10 multisel')); ?>
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
                                    <?php
                                endif;
                            endforeach;
                            ?>
                        </div>
                        <div id="pane3" class="tab-pane">
                            <?php foreach ($cfg['edit'] as $position => $title) : ?>
                                <div class="row-fluid">
                                    <div class="controls span12">
                                        <h4><?php echo $position ?></h4>
                                        <div class="input-prepend">
                                            <span class="add-on">Block Title</span>
                                            <?php $this->field('text', 'SPCfg_edit[' . $position . '][title]', $cfg['edit'][$position]['title'], array('class' => '')); ?>
                                        </div>
                                        <div class="input-prepend">
                                            <span class="add-on">Block Style</span>
                                            <?php $this->field('select', 'SPCfg_edit[' . $position . '][mode]', $cfg['positions']['modes'], $cfg['edit'][$position]['mode'], false, array('class' => '')); ?>
                                        </div>
                                        <div class="input-prepend">
                                            <span class="add-on">Block Fields</span>
                                            <?php $this->field('select', 'SPCfg_edit[' . $position . '][fields]', $this->get('fieldsEdit'), explode(",", $cfg['edit'][$position]['fields']), true, array('class' => 'span10 multisel')); ?>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                            <?php endforeach; ?>
                        </div>
                    </div><!-- /.tab-content -->
                </div><!-- /.tabbable -->
            </div>
        </div>
    </div>
</div>
