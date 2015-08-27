<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Events extends \Phalcon\Mvc\Model
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
    public $name;

    /**
     *
     * @var string
     */
    public $event_date;

    /**
     *
     * @var string
     */
    public $website;

    /**
     *
     * @var string
     */
    public $telephone;

    /**
     *
     * @var string
     */
    public $street;

    /**
     *
     * @var string
     */
    public $city;

    /**
     *
     * @var integer
     */
    public $country_id;

    /**
     *
     * @var string
     */
    public $lat;

    /**
     *
     * @var string
     */
    public $lng;

    /**
     *
     * @var integer
     */
    public $event_category_id;

    /**
     *
     * @var string
     */
    public $eventinfo;

    /**
     *
     * @var string
     */


    public function initialize()
    {
        $this->belongsTo("event_category_id", "EventsCategories", "id");
        $this->belongsTo("country_id", "Countries", "id");
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
            'name' => 'name',
            'event_date' => 'event_date',
            'website' => 'website',
            'telephone' => 'telephone',
            'street' => 'street',
            'city' => 'city',
            'country_id' => 'country_id',
            'lat' => 'lat',
            'lng' => 'lng',
            'event_category_id' => 'event_category_id',
            'eventinfo' => 'eventinfo'
        );
    }

}
