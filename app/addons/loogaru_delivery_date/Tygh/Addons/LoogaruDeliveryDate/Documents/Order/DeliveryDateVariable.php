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

namespace Tygh\Addons\LoogaruDeliveryDate\Documents\Order;

use Tygh\Template\Document\Order\Context;
use Tygh\Template\IVariable;
use Tygh\Tools\Formatter;
use Tygh\Registry;

class DeliveryDateVariable implements IVariable
{
    public $date;
    public $week_day;
    public $time;
    public $time_period;
    public $unix_timestamp;


    public function __construct(Context $context, Formatter $formatter)
    {
	$order = $context->getOrder();
	$format = Registry::get('settings.Appearance.date_format');
	if (!empty($order->data['delivery_date'])) {
        $this->unix_timestamp = $order->data['delivery_date'];
	    $this->date = $formatter->asDatetime($order->data['delivery_date'], $format);
	    $this->week_day = $formatter->asDatetime($order->data['delivery_date'], '%A');
        if ($formatter->asDatetime($order->data['delivery_date'], '%S') == "01") {
            $this->time = $formatter->asDatetime($order->data['delivery_date'], '%H:%M');
        }
        $this->time_period = $order->data['delivery_time_period'];
    	}
	  
    }
}
