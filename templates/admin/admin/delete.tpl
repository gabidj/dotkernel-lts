<form action="{SITE_URL}/admin/admin/delete/id/{ID}" method="post" >
<input type="hidden" name="send" value="on">
<fieldset style="width: 500px">
<legend>Delete Admin Acccount: {USERNAME}</legend>
	<table cellpadding="0" cellspacing="1" class="big_table">
		<tr>
			<td class="row2">Are you sure you want to delete this account ?</td>
		</tr>
		<tr>
			<td class="row1">
				Yes<input type="radio" value="1" name='delete' style="height: auto;" />
				No<input type="radio" value="0" name='delete' style="height: auto;" checked /></td>
		</tr>	
		<tr>
			<td class="row1" style="text-align: center;">
				<input type="submit" onclick="" class="small_btn" value="Yes">
				</td>
		</tr>
	</table>
</fieldset>
</form>