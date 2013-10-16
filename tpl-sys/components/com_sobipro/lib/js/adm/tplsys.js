/*
 * @author
 * Name: Mostafa Shalkami
 * Email: info[at]sobimarket.net
 * @copyright Copyright (C) 2013 Mostafa Shalkami. All rights reserved.
 * @license see http://www.gnu.org/licenses/gpl.html GNU/GPL Version 3.
 * You can use, redistribute this file and/or modify it under the terms of the GNU General Public License version 3
 */
jQuery(document).ready(function(){
    jQuery('option:selected', jQuery('select.multisel')).each(function() {
        jQuery('#SobiPro #'+ jQuery(this).closest('.tab-pane').attr('id') +' select.multisel option[value="' + jQuery(this).val() + '"]').attr('disabled', 'disabled');
        jQuery(this).removeAttr("disabled");
    });
    jQuery('select').selectpicker();
    jQuery('select.multisel').change(function(){
        jQuery('option:not(:selected:disabled)', this).each(function() {
            if(jQuery(this).is(":disabled") == false){
                jQuery('#SobiPro .tab-pane.active select.multisel option[value="' + jQuery(this).val() + '"]').removeAttr("disabled");
            }
        });
        jQuery('option:selected', this).each(function() {
            jQuery('#SobiPro .tab-pane.active select.multisel option[value="' + jQuery(this).val() + '"]').attr('disabled', 'disabled');
            jQuery(this).removeAttr("disabled");
        });
        jQuery('#SobiPro .tab-pane.active select.multisel').selectpicker('refresh');
    });
});
