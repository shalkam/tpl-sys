jQuery( document ).ready( function() {
    jQuery('tbody.toggle tr.slide').hide();
    jQuery('tbody.toggle').mouseover(function() {
        jQuery("tr", this).css({
            "border-bottom": "0"
        });
        jQuery("td", this).css({
            "border-bottom": "0"
        });
        jQuery("tr.slide",this).show();
    });
    jQuery('tbody.toggle').mouseout(function() {
        jQuery("tr", this).css({
            "border-bottom": ""
        });
        jQuery("td", this).css({
            "border-bottom": ""
        });
        jQuery("tr.slide", this).hide();
    });
});