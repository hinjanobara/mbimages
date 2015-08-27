<?php

class AutomotiveConditions extends 
\Phalcon\Mvc\Model
{	
	/**
     *
     * @var int
     */
    public $id;
    /**
     *
     * @var string
     */
    public $created;
	/**
     *
     * @var string
     */
    public $modified;
    /**
     *
     * @var string
     */
    public $name;

	public function initialize() {
		$this->hasMany("id", "Automotives", "condition_id");
	}

	/**
     * Independent Column Mapping.
     */
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