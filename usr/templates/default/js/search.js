/**
 * @version: $Id: search.js 3230 2013-02-25 15:46:41Z Radek Suski $
 * @package: SobiPro Component for Joomla!

 * @author
 * Name: Sigrid Suski & Radek Suski, Sigsiu.NET GmbH
 * Email: sobi[at]sigsiu.net
 * Url: http://www.Sigsiu.NET

 * @copyright Copyright (C) 2006 - 2013 Sigsiu.NET GmbH (http://www.sigsiu.net). All rights reserved.
 * @license GNU/GPL Version 3
 * This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License version 3
 * as published by the Free Software Foundation, and under the additional terms according section 7 of GPL v3.
 * See http://www.gnu.org/licenses/gpl.html and http://sobipro.sigsiu.net/licenses.

 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

 * $Date: 2013-02-25 16:46:41 +0100 (Mon, 25 Feb 2013) $
 * $Revision: 3230 $
 * $Author: Radek Suski $
 * File location: components/com_sobipro/usr/templates/default2/js/search.js $
 */

jQuery( document ).ready( function ()
{
	spSearchDefStr = jQuery( '#SPSearchBox' ).val();
	jQuery( '#SPSearchBox' ).bind( 'click', function ()
	{
		if ( jQuery( '#SPSearchBox' ).val() == spSearchDefStr ) {
			jQuery( '#SPSearchBox' ).val( '' );
		}
		;
	} );
	jQuery( '#SPSearchBox' ).bind( 'blur', function ()
	{
		if ( jQuery( '#SPSearchBox' ).val() == '' ) {
			jQuery( '#SPSearchBox' ).val( spSearchDefStr );
		}
		;
	} );
	jQuery( '.spsearchphrase' ).each( function ()
	{
		if ( jQuery( this ).hasClass( 'active' ) ) {
			jQuery( '#spsearchphrase' ).val( jQuery( this ).val() );
		}
	} );
	jQuery( '.spsearchphrase' ).click( function ()
	{
		jQuery( '#spsearchphrase' ).val( jQuery( this ).val() );
	} );
	try {
		jQuery( '#SPExtSearch' ).slideToggle( 'fast' );
		jQuery( '#SPExOptBt' ).bind( 'click', function ()
		{
			jQuery( '#SPExtSearch' ).slideToggle( 'fast' );
		} );
	}
	catch ( e ) {
	}
} );
