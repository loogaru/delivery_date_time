{$set = $addons.loogaru_delivery_date}
<div class="control-group">
    <label for="delivery_date" class="control-label">{__("loogaru_delivery_date")}:</label>
    	<div class="controls">
		{include file="common/calendar.tpl" date_id="delivery_date" date_name="update_order[delivery_date]" time_name="update_order[delivery_time]" date_val=$order_info.delivery_date|default:$smarty.const.TIME start_year=$settings.Company.company_start_year}

		{if $set.show_time == "Y"}
			<input class="input-time input-small" style="width:34px; float:right; padding:4px;" size="5" maxlength="5" type="text" name="update_order[delivery_time]" value="{if $order_info.delivery_date|fn_parse_date|date_format:"%S" == "01"}{$order_info.delivery_date|fn_parse_date|date_format:"%H:%M"}{/if}" placeholder="00:00" />
		{/if}

		{if $set.show_time_periods == "Y"}
			<select class="input-small" style="margin-top:3px;" name="update_order[delivery_time_period]">
				<option value="">--</option>
				{$period_in_list = "N"}
            {foreach from=$set.setted_time_periods key=k item=v}
	            {$k = str_replace("_", " ", $k)}
	            <option {if $order_info.delivery_time_period == $k}{$period_in_list = "Y"} selected="selected"{/if} value="{$k}">{$k}</option>
            {/foreach}
            {if $period_in_list == "N" && $order_info.delivery_time_period != ""}
            	<option selected="selected" value="{$order_info.delivery_time_period}">{$order_info.delivery_time_period}</option>
            {/if}
        	</select>
		{/if}
	</div>
</div>