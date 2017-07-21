<td>
{hook name="loogaru_delivery_date:wrap"}
	{if $o.delivery_date>0}
		{$without_time = $o.delivery_date|date_format:"%d.%m.%y"|fn_date_to_timestamp}
		{if $without_time>($smarty.now-24*60*59)}
			<div>
			{if $o.delivery_date|date_format:"%D"==$smarty.now|date_format:"%D"}
				<strong title="{$o.delivery_date|date_format:"%e %b"}">{__("loogaru_today")}</strong>
			{elseif $o.delivery_date|date_format:"%D"==$tomorrow|date_format:"%D"}
				<strong title="{$o.delivery_date|date_format:"%e %b"}">{__("loogaru_tomorrow")}</strong>
			{else}{$o.delivery_date|date_format:"%e %b"}
			{/if}
		{else}
			<div class="muted">{$o.delivery_date|date_format:"%e %b"}
		{/if}
		{if $addons.loogaru_delivery_date.show_time == "Y" && $o.delivery_date|date_format:"%S" == "01"}
			{$o.delivery_date|date_format:"%H:%M"}
		{/if}
		{if $addons.loogaru_delivery_date.show_time_periods == "Y" && $o.delivery_time_period != ""}
			{$o.delivery_time_period}
		{/if}
			</div>
	{/if}
{/hook}
</td>