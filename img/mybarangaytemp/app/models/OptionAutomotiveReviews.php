<?php

class OptionAutomotiveReviews extends 
\Phalcon\Mvc\Model 
{
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $business_id;
	public $wifi;
	public $has_tv;
	public $accepts_credit_cards;
	public $bike_parking;

	public function initialize() {
		$this->belongsTo("member_id", "Members", "id");
		$this->belongsTo("business_id", "Business", "id");
	}

		public function columnMap()
	    {
		return array(
		   'id' => 'id',
		   'created' => 'created',
		   'modified' => 'modified',
		   'member_id' => 'member_id',
		   'business_id' => 'business_id',
		'wifi' => 'wifi',
		'has_tv' => 'has_tv',
		'accepts_credit_cards' => 'accepts_credit_cards'
		);
	    }
}
>
