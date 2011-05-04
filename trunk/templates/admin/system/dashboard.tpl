<fieldset style="width: 460px;float: left;margin-right: 50px;">
	<legend>System Overview</legend>
	<!-- BEGIN warnings_table -->
	<table class="medium_table warnings" width="100%">
		<!-- BEGIN warnings_list -->
		<tr>
			<td class="{TD_CLASS}" width="150px">{WARNING_TYPE}</td>
			<td class="{TD_CLASS}">{WARNING_DESCRIPTION}</td>
		</tr>
		<!-- END warnings_list -->
	</table>
	<!-- END warnings_table -->
	<table class="medium_table" width="100%">
		<tr>
			<td width="150px">HOSTNAME</td>
			<td>{HOSTNAME}</td>
		</tr>
		<tr>
			<td>PHP</td>
			<td>{PHP} ({PHPAPI}) &nbsp;&nbsp;[ <a href="{SITE_URL}/admin/system/phpinfo">PHP Info</a> ]</td>
		</tr>
		<tr>
			<td>APC</td>
			<td>{APCVERSION} ({APCSTATUS}) &nbsp;&nbsp;[ <a href="{SITE_URL}/admin/system/apc-info/">APC Info</a> ]</td>
		</tr>
		<tr>
			<td>MYSQL</td>
			<td>MYSQL {MYSQL}</td>
		</tr>
		<tr>
			<td>Zend Framework</td>
			<td>{ZFVERSION}</td>
		</tr>
	</table>
	<table class="medium_table" width="100%">
		<tr>
			<td width="150px">GEOIP COUNTRY LOCAL</td>
			<td>{GEOIP_COUNTRY_LOCAL}</td>
		</tr>
		<!-- BEGIN is_geoip -->
	 	<tr>
			<td>GEOIP CITY</td>
			<td>{GEOIP_CITY_VERSION}</td>
		</tr>
		<tr>
			<td>GEOIP COUNTRY</td>
			<td>{GEOIP_COUNTRY_VERSION}</td>
		</tr>
		<!-- END is_geoip -->
	</table>
	<table cellpadding="0" cellspacing="0" class="medium_table" width="100%">
		<tr>
			<td width="150px">WURFL Cache Built</td>
			<td>{WURFLCACHEBUILT} [ <a href="{SITE_URL}/admin/system/build-wurfl-cache">build now</a> ]</td>
		</tr>
		<tr>
			<td>WURFL Date</td>
			<td>{WURFLDATE}</td>
		</tr>
	</table>
</fieldset>
{WIDGET_USER_LOGINS}
