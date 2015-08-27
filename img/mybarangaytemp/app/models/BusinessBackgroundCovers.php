<?php

class BusinessBackgroundCovers extends 
\Phalcon\Mvc\Model 
{	
	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $business_id;
	public $file_path;
	public $filename;
	public $primary_pic;
	
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
            'file_path' => 'file_path',
            'filename' => 'filename', 
            'primary_pic' => 'primary_pic'
        );
    }
}