<?php

class ReviewResponds extends 
\Phalcon\Mvc\Model
{
	public function initialize() {
		$this->belongsTo("member_id", "Members", "id");
		$this->belongsTo("review_id", "Reviews", "id");
		$this->belongsTo("business_id", "Business", "id");
	}

	public function columnMap()
    {
        return array(
            'id' => 'id', 
            'created' => 'created', 
            'modified' => 'modified', 
           	'member_id' => 'member_id',
           	'review_id' => 'review_id',
           	'business_id' => 'business_id',
           	'content' => 'content'
        );
    }
}