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

$schema['delivery_date'] = array(
    'class' => '\Tygh\Addons\LoogaruDeliveryDate\Documents\Order\DeliveryDateVariable',
	'arguments' => array('#context', '@formatter'),
);

return $schema;