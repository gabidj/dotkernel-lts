{PAGINATION}
<fieldset style="width: 100%">
<legend>List Admins</legend>
<table cellpadding="0" cellspacing="1" class="big_table">
	<tr>
		<td class="table_subhead"><span>#</span></td>
		<td class="table_subhead"><span>Username</span></td>
		<td class="table_subhead"><span>Email</span></td>
		<td class="table_subhead"><span>First name</span></td>
		<td class="table_subhead"><span>Last name</span></td>
		<td class="table_subhead"><span>Active</span></td>
		<td class="table_subhead"><span>Creation Date</span></td>
	</tr>
<!-- BEGIN list -->
	<tr>
		<td class="row{BG}">{ID}</td>
		<td class="row{BG}"> <a href="{SITE_URL}/admin/admin/update/id/{ID}">{USERNAME}</a></td>
		<td class="row{BG}">{EMAIL}</td>
		<td class="row{BG}">{FIRSTNAME}</td>
		<td class="row{BG}">{LASTNAME}</td>
		<td class="row{BG}"><a href="{SITE_URL}/admin/admin/activate/id/{ID}/isActive/{ISACTIVE}"><img src="{IMAGES_URL}/{ACTIVE_IMG}.png" border='0'></a></td>
		<td class="row{BG}">{DATE_CREATED}</td>
	</tr>
<!-- END list -->
</table>
</fieldset>