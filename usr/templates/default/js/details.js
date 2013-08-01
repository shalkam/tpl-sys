if (typeof jQuery != 'undefined' && typeof MooTools != 'undefined' ) {
    Element.implement({
        slide: function(how, mode){
            return this;
        }
    });
}
jQuery( document ).ready( function() {
//    jQuery('div.SPBlock').filter(function () {
//        return jQuery(this).find('span.SPField').length == 0;
//    }).hide();
//    if(jQuery('div.SPDetails div.span8').find('.tabbable').length == 1) {
//        jQuery('div.tabbable div.tab-pane').each(function(){
//            if(jQuery(this).find('span.SPField').length == 0) {
//                jQuery('div.tabbable li.' + jQuery(this).attr("id")).hide();
//            }
//        });
//    }
});