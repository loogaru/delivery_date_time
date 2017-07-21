{script src="/js/addons/loogaru_delivery_date/lib/pickadate/picker.js"}
{script src="/js/addons/loogaru_delivery_date/lib/pickadate/picker.date.js"}
{script src="/js/addons/loogaru_delivery_date/lib/pickadate/picker.time.js"}

{$lang = $smarty.session.settings.cart_languageC.value}

{if $lang == "ar"}	{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/ar.js"}
{elseif $lang == "cs"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/cs_CZ.js"}
{elseif $lang == "da"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/da_DK.js"}
{elseif $lang == "de"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/de_DE.js"}
{elseif $lang == "el"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/el_GR.js"}
{elseif $lang == "es"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/es_ES.js"}
{elseif $lang == "fa"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/fa_IR.js"}
{elseif $lang == "fr"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/fr_FR.js"}
{elseif $lang == "hr"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/hr_HR.js"}
{elseif $lang == "hu"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/hu_HU.js"}
{elseif $lang == "it"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/it_IT.js"}
{elseif $lang == "ja"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/ja_JP.js"}
{elseif $lang == "nl"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/nl_NL.js"}
{elseif $lang == "no"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/no_NO.js"}
{elseif $lang == "pl"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/pl_PL.js"}
{elseif $lang == "pt"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/pt_PT.js"}
{elseif $lang == "ro"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/ro_RO.js"}
{elseif $lang == "ru"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/ru_RU.js"}
{elseif $lang == "sk"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/sk_SK.js"}
{elseif $lang == "sv"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/sv_SE.js"}
{elseif $lang == "tr"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/tr_TR.js"}
{elseif $lang == "uk"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/uk_UA.js"}
{elseif $lang == "vi"}{script src="/js/addons/loogaru_delivery_date/lib/pickadate/translations/vi_VN.js"}
{else}
{/if}