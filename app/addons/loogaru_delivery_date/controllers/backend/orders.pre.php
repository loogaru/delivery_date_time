<?php
/*********************************************************
*                                                        *
*   (c) 2017 Loogaru, Durkin Andrey                      *
*                                                        *
* This software is under MIT license, so it's FREE.		 *
* FREE as you can feel FREE to DONATE at http://looga.ru *
* Thank you!!											 *
*                                                        *
*********************************************************/

if (!defined('BOOTSTRAP')) { die('Access denied'); }

if ($_SERVER['REQUEST_METHOD'] == 'POST' && $mode == 'update_details' && !empty($_POST['update_order']['delivery_date'])) {
	if (!empty($_POST['update_order']['delivery_time'])) {
	    $_POST['update_order']['delivery_date'] = fn_parse_datetime($_POST['update_order']['delivery_date'] . ' ' . $_POST['update_order']['delivery_time']) + 1;
	} else {
		$_POST['update_order']['delivery_date'] = fn_parse_date($_POST['update_order']['delivery_date']);
	}
}

if ($mode == 'manage') {
	$smarty = Tygh::$app['view'];
	$smarty->assign('tomorrow', strtotime('+1 day'));
}
