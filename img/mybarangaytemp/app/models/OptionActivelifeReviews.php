<?php
class OptionActivelifeReviews extends 
\Phalcon\Mvc\Model
{
	
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $business_id;
	public $price_range;
	public $good_for_kids;
	public $parking;
	public $bike_parking

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
		   'good_for_kids' => 'good_for_kids',
  		   'parking' => 'parking',
 		   'bike_parking' => 'bike_parking'
		);
	}
}
?>
