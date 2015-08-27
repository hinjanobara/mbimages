<?php


class Things extends \Phalcon\Mvc\Model
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
    public $thing_condition_id;

    /**
     *
     * @var integer
     */
    public $thing_category_id;

    /**
     *
     * @var string
     */
    public $name;

    /**
     *
     * @var string
     */
    public $price;

    /**
     *
     * @var string
     */
    public $details;

    /**
     *
     * @var integer
     */
    public $view_hits;


    public function initialize()
    {
        $this->belongsTo("thing_category_id", "ThingCategories", "id");
        $this->belongsTo("thing_condition_id", "ThingConditions", "id");
        $this->belongsTo("member_id", "Members", "id");
        $this->hasMany("id", "ThingPhotos", "thing_id");
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
            'price' => 'price',
            'thing_condition_id' => 'thing_condition_id',
            'thing_category_id' => 'thing_category_id',
            'details' => 'details',
            'view_hits' => 'view_hits'
        );
    }

}
