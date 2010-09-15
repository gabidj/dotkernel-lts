<fieldset style="width: 100%">
<legend>List Settings Variables</legend>
<form method="post" name="configs" action="{SITE_URL}/admin/system/settings-update">
<input type="hidden" name='send' value='on'>
<table cellpadding="0" cellspacing="1" class="big_table" width="100%">
	<tr>
		<td class='table_subhead' width='33%'><span class="table_subheading">Name</span></td>
		<td class='table_subhead' width='34%'><span class="table_subheading">Value</span></td>
		<td class='table_subhead' width='33%'><span class="table_subheading">Default</span></td>
	</tr>
	<!-- BEGIN textarea -->
	<tr>
		<td class='row2' valign="top"><p><b>{NAME}</b><br /> {EXPLANATION}</p></td>
		<td class='row1'><textarea name="{VARIABLE}" rows="{NR_ROWS}" cols="50">{CURRENT_VALUE}</textarea></td>
		<td class='row1' valign="top">{DEFAULT}</td>
	</tr>

	<!-- END textarea -->
	<!-- BEGIN option -->
	<tr>
		<td class='row2' valign="top"><p><b>{NAME}</b><br /> {EXPLANATION}</p></td>
		<td class='row1'>
			<select name="{VARIABLE}" style='min-width: 280px;'>
				<!-- BEGIN options -->
				<option value="{LIST_OPTION}" {SELECTED_OPTION}>{LIST_OPTION}</option>
				<!-- END options -->
			</select>
		</td>
		<td class='row1' valign="top">{DEFAULT}</td>
	</tr>
	<!-- END option -->
	<!-- BEGIN radio -->
	<tr>
		<td class='row2'><p><b>{NAME}</b><br /> {EXPLANATION}</p></td>
		<td class='row1' valign="middle">
			<!-- BEGIN radios -->
			<input type="radio"  style="height: auto;" id="{VARIABLE}_{POSIBLE_VALUE}" name="{VARIABLE}" value="{POSIBLE_VALUE}" {CHECKED_OPTION}/><label for="{VARIABLE}_{POSIBLE_VALUE}">{POSIBLE_VALUE_TXT}</label>&nbsp;
			<!-- END radios -->
		</td>
		<td class='row1' valign="top">{DEFAULT}</td>
	</tr>

	<!-- END radio -->
	<tr>
		<td colspan="3" class="row1">
			<center><input type="submit" value="Update " class="small_btn"></center>
		</td>
	</tr>
</table>
</form>
</fieldset>