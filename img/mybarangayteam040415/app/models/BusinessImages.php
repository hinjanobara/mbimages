<?php

class BusinessImages extends \Phalcon\Mvc\Model
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
    public $business_id;

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

    /**
     *
     * @var string
     */
    public $type;


    public function initialize()
    {
        $this->belongsTo("member_id", "Members", "id");
        $this->belongsTo("business_id", "Business", "id");
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
            'member_id' => 'member_id',
            'business_id' => 'business_id',
            'file_path' => 'file_path',
            'filename' => 'filename', 
            'caption' => 'caption',
            'type' => 'type'
        );
    }

}
