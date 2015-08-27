<?php

class JobLogos extends \Phalcon\Mvc\Model
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
    public $job_id;

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



    public function initialize()
    {
        $this->belongsTo("member_id", "Members", "id");
        $this->belongsTo("job_id", "Jobs", "id");
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
            'job_id' => 'job_id',
            'file_path' => 'file_path',
            'filename' => 'filename'
        );
    }

}
