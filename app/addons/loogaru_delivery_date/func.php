<?php
/*********************************************************
*                                                        *
*   (c) 2017 Loogaru, Durkin Andrey                      *
*                                                        *
* This software is under MIT license, so it's FREE.      *
* FREE as you can feel FREE to DONATE at http://looga.ru *
* Thank you!!                                            *
*                                                        *
*********************************************************/
use Tygh\Registry;
use Tygh\Shippings\Shippings;

if (!defined('BOOTSTRAP')) { die('Access denied'); }

function fn_loogaru_delivery_date_get_orders(&$params, &$fields, &$sortings, &$condition, $join, $group) {
    $fields[] = '?:orders.delivery_date as delivery_date';
    $fields[] = '?:orders.delivery_time_period as delivery_time_period';
    $sortings['delivery_date'] = 'delivery_date';

    if (!empty($params['dd_period']) && $params['dd_period'] != 'A') {
        /*list($params['dd_time_from'], $params['dd_time_to']) = fn_create_periods($params);*/
        $params['dd_time_from'] = fn_parse_date($params['dd_time_from']);
        $params['dd_time_to'] = fn_parse_date($params['dd_time_to']);
        $condition .= db_quote(" AND (?:orders.delivery_date >= ?i AND ?:orders.delivery_date <= ?i)", $params['dd_time_from'], $params['dd_time_to']);
    }
}

function fn_loogaru_delivery_date_update_cart_by_data_post(&$cart, $new_cart_data, $auth)
{
    if (!empty($new_cart_data['delivery_date'])) {
        $cart['delivery_date'] = $new_cart_data['delivery_date'];
    }
    if (!empty($new_cart_data['delivery_time_period'])) {
        $cart['delivery_time_period'] = $new_cart_data['delivery_time_period'];
    }
}

function fn_loogaru_get_shipping_methods()
{
    $condition = " AND ?:shippings.status = 'A'";
    if (Registry::get('runtime.company_id') && !fn_allowed_for('ULTIMATE')) {
        $condition = fn_get_company_condition('?:shippings.company_id');
        $company_data = Registry::get('runtime.company_data');
        if (!empty($company_data['shippings'])) {
            $condition .= db_quote(" OR ?:shippings.shipping_id IN (?n)", explode(',', $company_data['shippings']));
        }
    }

    $shippings = db_get_hash_array("SELECT ?:shippings.shipping_id, ?:shipping_descriptions.shipping FROM ?:shippings LEFT JOIN ?:shipping_descriptions ON ?:shippings.shipping_id = ?:shipping_descriptions.shipping_id AND ?:shipping_descriptions.lang_code = ?s LEFT JOIN ?:companies ON ?:companies.company_id = ?:shippings.company_id WHERE 1 $condition ORDER BY ?:shippings.position", 'shipping_id', CART_LANGUAGE);


    foreach ($shippings as $value) {
        $shippings_for_settings[$value['shipping_id']] = $value['shipping'];
    }

    return $shippings_for_settings;
}

function fn_settings_variants_addons_loogaru_delivery_date_date_for()           {return fn_loogaru_get_shipping_methods();}
function fn_settings_variants_addons_loogaru_delivery_date_time_for()           {return fn_loogaru_get_shipping_methods();}
function fn_settings_variants_addons_loogaru_delivery_date_time_periods_for()   {return fn_loogaru_get_shipping_methods();}