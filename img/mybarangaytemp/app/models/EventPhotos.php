<?php

class EventPhotos extends 
\Phalcon\Mvc\Model
{	
	/**
     *
     * @var integer
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
     * @var integer
     */
    public $member_id;

    /**
     *
     * @var integer
     */
    public $event_id;

    /**
     *
     * @var string
     */
    public $file_path;

    /**
     *
     * @var string
     */
    public $filename;

    /**
     *
     * @var string
     */
    public $caption;
	public function initialize() {
		$this->belongsTo('member_id', 'Members', 'id');
		$this->belongsTo('event_id', 'Events', 'id');
	}

	public function columnMap()
    {
        return array(
            'id' => 'id', 
            'created' => 'created', 
            'modified' => 'modified', 
            'member_id' => 'member_id',
            'event_id' => 'event_id',
            'file_path' => 'file_path',
            'filename' => 'filename', 
            'caption' => 'caption'
        );
    }
}