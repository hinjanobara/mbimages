<?php

class MemberPhotos extends \Phalcon\Mvc\Model
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
    public $primary_pic;


    public function initialize()
    {
         $this->belongsTo("member_id", "Member", "id");
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
            'file_path' => 'file_path',
            'filename' => 'filename',
            'caption' => 'caption',
            'primary_pic' => 'primary_pic'
        );
    }

}
