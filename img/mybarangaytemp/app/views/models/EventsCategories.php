<?php

class EventsCategories extends \Phalcon\Mvc\Model
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
    public $user_id;

    /**
     *
     * @var string
     */
    public $name;
    public function getSource() {
        return "events_categories";
    }
    public function initialize() {
        $this->hasMany("id", "Events", "event_category_id");
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
            'user_id' => 'user_id',
            'name' => 'name'
        );
    }

}
