<?php

class RealtyPhotos extends \Phalcon\Mvc\Model
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
    public $realty_id;

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



    public function initialize()
    {
        $this->belongsTo("member_id", "Members", "id");
        $this->belongsTo("realty_id", "Realties", "id");
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
            'realty_id' => 'realty_id',
            'file_path' => 'file_path',
            'filename' => 'filename', 
            'caption' => 'caption'
        );
    }

}
