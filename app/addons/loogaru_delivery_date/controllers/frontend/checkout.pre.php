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

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($mode == 'update_steps') {

    if (!empty($_REQUEST['delivery_date'])) {
        if (!empty($_REQUEST['delivery_time'])) {
            $_SESSION['cart']['delivery_time'] = $_REQUEST['delivery_time'];
            $_REQUEST['delivery_date'] = fn_parse_datetime($_REQUEST['delivery_date'] . ' ' . $_REQUEST['delivery_time']) + 1;
        } else {
            $_REQUEST['delivery_date'] = fn_parse_date($_REQUEST['delivery_date']);
        }
    } else {
        $_REQUEST['delivery_date'] = '';
    }

    if (empty($_REQUEST['delivery_time_period'])) {
        $_REQUEST['delivery_time_period'] = '';
    }

    $_SESSION['cart']['delivery_date'] = $_REQUEST['delivery_date'];
    $_SESSION['cart']['delivery_time_period'] = $_REQUEST['delivery_time_period'];
    Tygh::$app['view']->assign('delivery_date', $_SESSION['cart']['delivery_date']);
    Tygh::$app['view']->assign('delivery_time_period', $_SESSION['cart']['delivery_time_period']);
}