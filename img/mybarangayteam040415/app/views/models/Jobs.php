<?php

use Phalcon\Mvc\Model\Validator\Email as Email;

class Jobs extends \Phalcon\Mvc\Model
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
    public $position;

    /**
     *
     * @var integer
     */
    public $job_category_id;

    /**
     *
     * @var string
     */
    public $job_description;

    /**
     *
     * @var string
     */
    public $company;

    /**
     *
     * @var string
     */
    public $website;

    /**
     *
     * @var string
     */
    public $email;

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
     * @var decimal
     */
    public $salary_from;

    /**
     *
     * @var decimal
     */
    public $salary_to;

    /**
     *
     * @var string
     */
    public $requirements;

    /**
     *
     * @var string
     */
    public $benefits;

    /**
     *
     * @var string
     */
    public $how_to_apply;

    /**
     *
     * @var integer
     */
    public $view_hits;

   

    public function initialize()
    {
        $this->belongsTo("job_category_id", "JobCategories", "id");
        $this->belongsTo("country_id", "Countries", "id");
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
            'position' => 'position',
            'job_category_id' => 'job_category_id',
            'job_description' => 'job_description',
            'company' => 'company',
            'website' => 'website',
            'email' => 'email',
            'telephone' => 'telephone',
            'street' => 'street',
            'city' => 'city',
            'country_id' => 'country_id',
            'salary_from' => 'salary_from',
            'salary_to' => 'salary_to',
            'requirements' => 'requirements',
            'benefits' => 'benefits',
            'how_to_apply' => 'how_to_apply',
            'view_hits' => 'view_hits'
        );
    }

}
