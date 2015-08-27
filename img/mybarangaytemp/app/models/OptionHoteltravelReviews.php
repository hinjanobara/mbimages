<?php

class OptionHoteltravelReviews extends 
\Phalcon\Mvc\Model
{
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $business_id;
	public $price_range;
	public $wifi;
	public $has_tv;
	public $accepts_credit_cards;
	public $parking;
	public $bike_parking;
	public $good_for_groups;
	public $good_for_kids;
	
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
		'price_range' => 'price_range',
		'wifi' => 'wifi',
		'has_tv' => 'has_tv',
		'accepts_credit_cards' => 'accepts_credit_cards',
		'parking' => 'parking',
		'bike_parking' => 'bike_parking',
		'good_for_groups' => 'good_for_groups',
		'good_for_kids' => 'good_for_kids'
		);
	    }
}
?>
