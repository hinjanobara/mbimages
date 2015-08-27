<?php

class AutomotiveFuels extends 
\Phalcon\Mvc\Model 
{
	public $id;
	public $created;
	public $modified;
	public $name;

	public function initialize() {
		$this->hasMany('id', 'Automotives' ,'fuel_type_id');
	}

	public function getSource() {
		return "automotive_fuels";
	}
	public function columnMap()
    {
        return array(
            'id' => 'id',
            'created' => 'created',
            'modified' => 'modified',
            'name' => 'name'        
        );
    }
}