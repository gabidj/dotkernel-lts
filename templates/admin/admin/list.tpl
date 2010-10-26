<script>
	var userToken="{USERTOKEN}";
</script>
<script type="text/javascript" src="{SITE_URL}/externals/dojo/dojo.xd.js"></script>
<script type="text/javascript" src="{TEMPLATES_URL}/js/admin/admin.js"></script>
<div id="adminList">
	{PAGINATION}
	<fieldset>
	<legend>List Admins</legend>
	<table cellpadding="0" cellspacing="0" class="big_table" width="100%">
		<tr>
			<td class="table_subhead" style="text-align: center; width: 20px;"><span>#</span></td>
			<td class="table_subhead"><span>Username</span></td>
			<td class="table_subhead"><span>Email</span></td>
			<td class="table_subhead"><span>First name</span></td>
			<td class="table_subhead"><span>Last name</span></td>
			<td class="table_subhead" width="70px"><span>Active</span></td>
			<td class="table_subhead"><span>Creation Date</span></td>
			<td class="table_subhead" width="230px"><span>Action</span></td>
		</tr>
	<!-- BEGIN list -->
		<tr>
			<td class="row{BG}" style="text-align: center;">{ID}</td>
			<td class="row{BG}"> <a href="{SITE_URL}/admin/admin/update/id/{ID}">{USERNAME}</a> </td>
			<td class="row{BG}">{EMAIL}</td>
			<td class="row{BG}">{FIRSTNAME}</td>
			<td class="row{BG}">{LASTNAME}</td>
			<td class="row{BG}" style="vertical-align: middle;">
				 <a  onclick="javascript: adminList('{SITE_URL}{ACTIVE_URL}',{ID},{ISACTIVE},{PAGE});" style="cursor: pointer;" title="Activate / Inactivate"  
				 class="{ACTIVE_IMG}_state">&nbsp;</a> </td>
			<td class="row{BG}">{DATE_CREATED}</td>
			<td class="row{BG}" > 				
			<table width="100%" class="action_table">
				<tr>
					<td width="25%"><a href="{SITE_URL}/admin/admin/update/id/{ID}" title="Edit/Update" class="edit_state">&nbsp;</a></td>
					<td width="25%"><a href="{SITE_URL}/admin/admin/delete/id/{ID}" title="Delete" class="delete_state">&nbsp;</a></td>
					<td width="25%"><a href="{SITE_URL}/admin/admin/logins/id/{ID}" title="User Logins" class="logins_state">&nbsp;</a></td>
					</tr>
			</table>
			</td>
			
		</tr>
	<!-- END list -->
	</table>
	</fieldset>
</div>