<?php

class OptonRestaReviews extends 
\Phalcon\Mvc\Model 
{	
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $business_id;
	public $main_title;
	public $caters;
	public $wifi;
	public $has_tv;
	public $price_range;
	public $accepts_credit_cards;
	public $parking;
	public $bike_parking;
	public $attire;
	public $good_for_groups;
	public $good_for_kids;
	public $takes_reservations;
	public $delivery;
	public $take_away;
	public $waiter_service;
	public $outdoor_seating;
	public $good_for;
	public $alcohol;
	public $noise_level;
	public $ambience;

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
      		'main_title' => 'main_title',
      		'caters' => 'caters',
      		'wifi' => 'wifi',
      		'has_tv' => 'has_tv',
      		'price_range' => 'price_range',
      		'accepts_credit_cards' => 'accepts_credit_cards',
      		'parking' => 'parking',
      		'bike_parking' => 'bike_parking',
      		'attire' => 'attire',
      		'good_for_groups' => 'good_for_groups',
      		'good_for_kids' => 'good_for_kids',
      		'takes_reservations' => 'takes_reservations',
      		'delivery' => 'delivery',
      		'take_away' => 'take_away',
      		'waiter_service' => 'waiter_service',
      		'outdoor_seating' => 'outdoor_seating',
      		'good_for' => 'good_for',
      		'alcohol' => 'alcohol',
      		'noise_level' => 'noise_level',
      		'ambience' => 'ambience'
        );
    }
    
}
