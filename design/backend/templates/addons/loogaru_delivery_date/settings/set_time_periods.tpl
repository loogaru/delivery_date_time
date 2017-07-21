{$settings_id = $data.object_id-1}
{$setted = $addons.loogaru_delivery_date.setted_time_periods}
<table width="1" class="table" style="width: 68%; margin:0 auto;">
    <thead>
        <tr class="cm-first-sibling">
            <th>{__("description")}</th>
            <th>&nbsp;</th>
        </tr>
    </thead>
{$count=1}
{if $setted != "N"}
    {foreach name="values" from=$setted key="value" item="no" }
        {$value = str_replace("_", " ", $value)}
        <tr class="cm-first-sibling">
            <td>
                <input class="span6" type="text" name="addon_data[options][{$settings_id}][{$count}]" value="{$value}" />
            </td>
            <td>
                {include file="buttons/multiple_buttons.tpl" only_delete="Y"}
            </td>
        </tr>
        {$count=$count+1}
    {/foreach}
{/if}
        <tr id="box_elm_values_{$id}" {if $hide_multiple_buttons}class="{$hide_multiple_buttons}"{/if}>
            <td><input class="span6" type="text" name="addon_data[options][{$settings_id}][{$count}]" /></td>
            <td>{include file="buttons/multiple_buttons.tpl" item_id="elm_values_`$id`" tag_level=3}</td>
        </tr>
</table>