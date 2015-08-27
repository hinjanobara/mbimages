<?php

class EventDatetimes extends 
\Phalcon\Mvc\Model {

	public $id;
	public $event_id;
	public $date;
	public $to_time;
	public $from_time;


	public function initialize() {
		$this->belongsTo("event_id", "Events", "id");
	}

}