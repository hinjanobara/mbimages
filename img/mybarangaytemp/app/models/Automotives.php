<?php

class Automotives extends 
\Phalcon\Mvc\Model 
{
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $name;
	public $price;
	public $location;
	public $brand;
	public $model;
	public $year_model;
	public $condition_id;
	public $body_type;
	public $transmission;
	public $mileage;
	public $fuel_type_id;
	public $details;
	public $view_hits;

	public function initialize() {
		$this->belongsTo('condition_id', 'AutomotiveConditions', 'id');
		$this->belongsTo('fuel_type_id', 'AutomotiveFuels', 'id');
		$this->belongsTo('member_id', 'Members', 'id'); 
		$this->hasMany('id', 'AutomotivePhotos', 'automotive_id');
	}

	public function columnMap()
    {
        return array(
            'id' => 'id',
            'created' => 'created',
            'modified' => 'modified',
            'member_id' => 'member_id',
            'name' => 'name',
            'price' => 'price',
            'brand' => 'brand',
            'model' => 'model',
            'location' => 'location',
            'year_model' => 'year_model',
            'condition_id' => 'condition_id',
            'body_type'=> 'body_type',
            'transmission' => 'transmission',
            'mileage' => 'mileage',
            'fuel_type_id' => 'fuel_type_id',
            'details' => 'details',
            'view_hits' => 'view_hits'       
        );
    }
}