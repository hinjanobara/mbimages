<?php

class FriendRequests extends \Phalcon\Mvc\Model
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
    public $requester_id;

    /**
     *
     * @var string
     */
    public $status;


    public function initialize()
    {
         $this->belongsTo("requester_id", "Members", "id");
         $this->belongsTo("member_id", "Members", "id");
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
            'requester_id' => 'requester_id',
            'status' => 'status'
        );
    }

}
