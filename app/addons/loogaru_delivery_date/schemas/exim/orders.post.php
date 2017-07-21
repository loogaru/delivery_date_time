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

$schema['export_fields']['Delivery date'] = array (
    'db_field' => 'delivery_date',
    'process_get' => array('fn_timestamp_to_date', '#this'),
    'convert_put' => array('fn_date_to_timestamp', '#this'),
);

$schema['export_fields']['Time interval'] = array (
    'db_field' => 'delivery_time_period',
);

return $schema;
