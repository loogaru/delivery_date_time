{$set = $addons.loogaru_delivery_date}
{if $settings.Appearance.calendar_date_format == "month_first"}
    {assign var="date_format" value="m/d/yyyy"}
    {assign var="date_format_smarty" value="%m/%d/%Y"}
{else}
    {assign var="date_format" value="d/m/yyyy"}
    {assign var="date_format_smarty" value="%d/%m/%Y"}
{/if}

{if $cart.chosen_shipping.$group_key == $shipping.shipping_id && $set.date_for[$shipping.shipping_id]}

	<div class="ty-control-group">
		<div class="controls">
		<div class="ty-calendar__block" style="width:187px;">
			<input class="delivery_date ty-calendar__input" type="text" name="delivery_date" data-value="{if $smarty.session.cart.delivery_date}{$smarty.session.cart.delivery_date|date_format:$date_format_smarty}{/if}" /><i class="ty-icon-calendar ty-calendar__button" style="pointer-events:none;"></i></div>

		{if $set.show_time == "Y" && $set.time_for[$shipping.shipping_id]}
			<input class="delivery_time input-time" size="5" maxlength="5" type="text" name="delivery_time" value="{$smarty.session.cart.delivery_time}" placeholder="00:00" />
		{/if}

		{if $set.show_time_periods == "Y" && $set.time_periods_for[$shipping.shipping_id]}
			<select name="delivery_time_period">
            {foreach from=$set.setted_time_periods key=k item=v}
	            {$k = str_replace("_", " ", $k)}
	            <option {if $smarty.session.cart.delivery_time_period == $k} selected="selected"{/if} value="{$k}">{$k}</option>
            {/foreach}
        </select>


		{/if}

		<span>{__("loogaru_asterisk")}</span>
		</div>
		<script type="text/javascript">
		(function(_, $) {$ldelim}
		    $.ceEvent('on', 'ce.commoninit', function(context) {
			
		    	$('.delivery_date').pickadate({
					format: 'd mmmm yyyy (ddd)',
					formatSubmit: '{$date_format}',
					hiddenName: true,
					showMonthsShort: true,
					min: true,
					disable: [
						{if $set.disabled_dates && $set.disabled_dates != ""}{$set.disabled_dates},{/if}
						{if !isset($set.disabled_days.N)}{foreach from=$set.disabled_days key=k item=v}{$k}, {/foreach}{/if}
						{if $set.deadline && $set.deadline !="" && $set.deadline <= $smarty.now|date_format:"%k"}{
							from: true, to: true
						},{/if}
					],
					close: '',
					clear: '',
					firstDay: 1,
		    	});
		    	$('.delivery_time').pickatime({
		    		format: 'H:i',
		    		formatSubmit: 'HH:i',
		    		hiddenName: true,
		    		{if $set.time_min && $set.time_min != ""}min: [{$set.time_min}],{/if}
		    		{if $set.time_max && $set.time_max != ""}max: [{$set.time_max}],{/if}
		    		{if $set.time_step && $set.time_step != ""}interval: {$set.time_step},{/if}
		    		clear: '',
		    	});

		    });
		{$rdelim}(Tygh, Tygh.$));
		</script>
	</div>

{/if}

