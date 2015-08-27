<?php

class AutomotivePhotos extends 
\Phalcon\Mvc\Model
{	

	public $id;
	public $created;
	public $modified;
	public $member_id;
	public $automotive_id;
	public $file_path;
	public $filename;
	public $caption;

	public function initialize() {
		$this->belongsTo('automotive_id', 'Automotives', 'id');
	}

	public function columnMap()
    {
        return array(
            'id' => 'id',
            'created' => 'created',
            'modified' => 'modified',
            'member_id' => 'member_id',
            'automotive_id' => 'automotive_id',
            'file_path' => 'file_path',
            'filename' => 'filename',
            'caption' => 'caption'       
        );
    }
}