<?php

class IndexController extends ControllerBase
{
    public function initialize()
    {
        parent::initialize();
        $this->view->setTemplateAfter('main');
    }

    public function indexAction()
    {
        // $businessFeatured = Business::findFirst(array("order" => "id DESC"));
        // $this->view->setVar('businessFeatured', $businessFeatured);
        // $businessFeaturedImage = BusinessImages::findFirst(array('business_id="'.$businessFeatured->id.'"', "order" => "id DESC"));
        // $this->view->setVar('businessFeaturedImage', $businessFeaturedImage);

        //AUTOMOTIVE
        $phqlAutoFeatList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 141 AND 173 GROUP BY business_id";
        $autoFeatLists = $this->modelsManager->executeQuery($phqlAutoFeatList);
        $autoFeatIds = array();
        if(count($autoFeatLists) > 0){
            foreach($autoFeatLists as $autoFeatList) {
                $autoFeatIds[] = $autoFeatList->business_id;
            }
            $autoFeatIds = implode(',', $autoFeatIds);
            $phqlAutoBizFeatList = "SELECT * FROM Business WHERE id IN (".$autoFeatIds.") ORDER BY id DESC LIMIT 1";
            $autoBizFeatList = $this->modelsManager->executeQuery($phqlAutoBizFeatList);
        } else {
            $autoBizFeatList = array();
        }
        $this->view->setVar('autoBizFeatList', $autoBizFeatList);

        // case 'Restaurants': 743 - 1047
        // case 'Food': 289 - 350
        // case 'NightLife': 621 - 651

        // case 'Automotive': 141 - 173

        // case 'Hotels & Travel': 519 - 563

        // case 'Financial Services': 280 - 288
        // case 'Profesional Services': 664 - 708
        // case 'Event Planning & Services': 247 - 279

        // case 'Real Estate': 722 - 735

        // case 'Shopping': 1048 - 1171

        // case 'Health & Medical': 351 - 445
        // case 'Beauty & Spas': 174 - 204

        // case 'Home Services': 446 - 518
        // case 'Local Services': 566 - 616
        // case 'Pets': 652 - 663

        // case 'Active Life': 1 - 94
        // case 'Arts & Entertainment': 95 - 139
        // case 'Local Flavor': 564 - 565
        // case 'Bicycles': 205 - 209
        // case 'Education': 210 - 246
        // case 'Public Services & Government': 709 - 721
        // case 'Religious Organizations': 736 - 742
        // case 'Mass Media': 617 - 620


        //AUTOMOTIVE
        $phqlAutoList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 141 AND 173 GROUP BY business_id";
        $autoLists = $this->modelsManager->executeQuery($phqlAutoList);
        $autoIds = array();
        if(count($autoLists) > 0){
            foreach($autoLists as $autoList) {
                $autoIds[] = $autoList->business_id;
            }
            $autoIds = implode(',', $autoIds);
            $phqlAutoBizList = "SELECT * FROM Business WHERE id IN (".$autoIds.") ORDER BY id DESC LIMIT 7";
            $autoBizList = $this->modelsManager->executeQuery($phqlAutoBizList);
        } else {
            $autoBizList = array();
        }
        $this->view->setVar('autoBizList', $autoBizList);

        // $this->view->disable();
        // die();
        // print_r($autoBizList);

        //COMMUNITY
        $phqlCommunityList = "SELECT business_id FROM BusinessCategoryLists WHERE (business_category_id BETWEEN 1 AND 94) OR (business_category_id BETWEEN 95 AND 139) OR (business_category_id BETWEEN 564 AND 565) OR (business_category_id BETWEEN 205 AND 209) OR (business_category_id BETWEEN 210 AND 246) 
        OR (business_category_id BETWEEN 709 AND 721) OR (business_category_id BETWEEN 736 AND 742) OR (business_category_id BETWEEN 617 AND 620) GROUP BY business_id";
        $CommunityLists = $this->modelsManager->executeQuery($phqlCommunityList);
        $CommunityIds = array();
        if(count($CommunityLists) > 0){
            foreach($CommunityLists as $CommunityList) {
                $CommunityIds[] = $CommunityList->business_id;
            }
            $CommunityIds = implode(',', $CommunityIds);
            $phqlCommunityBizList = "SELECT * FROM Business WHERE id IN (".$CommunityIds.") ORDER BY id DESC LIMIT 7";
            $CommunityBizList = $this->modelsManager->executeQuery($phqlCommunityBizList);
        } else {
            $CommunityBizList = array();
        }
        $this->view->setVar('CommunityBizList', $CommunityBizList);

        //HEALTH & BEAUTY
        $phqlHBeautyList = "SELECT business_id FROM BusinessCategoryLists WHERE (business_category_id BETWEEN 351 AND 445) OR (business_category_id BETWEEN 174 AND 204) GROUP BY business_id";
        $HBeautyLists = $this->modelsManager->executeQuery($phqlHBeautyList);
        $HBeautyIds = array();
        if(count($HBeautyLists) > 0){
            foreach($HBeautyLists as $HBeautyList) {
                $HBeautyIds[] = $HBeautyList->business_id;
            }
            $HBeautyIds = implode(',', $HBeautyIds);
            $phqlHBeautyBizList = "SELECT * FROM Business WHERE id IN (".$HBeautyIds.") ORDER BY id DESC LIMIT 7";
            $HBeautyBizList = $this->modelsManager->executeQuery($phqlHBeautyBizList);
        } else {
            $HBeautyBizList = array();
        }
        $this->view->setVar('HBeautyBizList', $HBeautyBizList);

        //HOME & SERVICES
        $phqlHServList = "SELECT business_id FROM BusinessCategoryLists WHERE (business_category_id BETWEEN 446 AND 518) OR (business_category_id BETWEEN 566 AND 616) OR (business_category_id BETWEEN 652 AND 663) GROUP BY business_id";
        $HServLists = $this->modelsManager->executeQuery($phqlHServList);
        $HServIds = array();
        if(count($HServLists) > 0){
            foreach($HServLists as $HServList) {
                $HServIds[] = $HServList->business_id;
            }
            $HServIds = implode(',', $HServIds);
            $phqlHServBizList = "SELECT * FROM Business WHERE id IN (".$HServIds.") ORDER BY id DESC LIMIT 7";
            $HServBizList = $this->modelsManager->executeQuery($phqlHServBizList);
        } else {
            $HServBizList = array();
        }
        $this->view->setVar('HServBizList', $HServBizList);

        //FINANCIAL
        $phqlFinList = "SELECT business_id FROM BusinessCategoryLists WHERE (business_category_id BETWEEN 280 AND 288) OR (business_category_id BETWEEN 664 AND 708) OR (business_category_id BETWEEN 247 AND 279) GROUP BY business_id";
        $FinLists = $this->modelsManager->executeQuery($phqlFinList);
        $FinIds = array();
        if(count($FinLists) > 0){
            foreach($FinLists as $FinList) {
                $FinIds[] = $FinList->business_id;
            }
            $FinIds = implode(',', $FinIds);
            $phqlFinBizList = "SELECT * FROM Business WHERE id IN (".$FinIds.") ORDER BY id DESC LIMIT 7";
            $FinBizList = $this->modelsManager->executeQuery($phqlFinBizList);
        } else {
            $FinBizList = array();
        }
        $this->view->setVar('FinBizList', $FinBizList);

        //Hotels & Travel
        $phqlHTravelList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 519 AND 563 GROUP BY business_id";
        $HTravelLists = $this->modelsManager->executeQuery($phqlHTravelList);
        $HTravelIds = array();
        if(count($HTravelLists) > 0){
            foreach($HTravelLists as $HTravelList) {
                $HTravelIds[] = $HTravelList->business_id;
            }
            $HTravelIds = implode(',', $HTravelIds);
            $phqlHTravelBizList = "SELECT * FROM Business WHERE id IN (".$HTravelIds.") ORDER BY id DESC LIMIT 7";
            $HTravelBizList = $this->modelsManager->executeQuery($phqlHTravelBizList);
        } else {
            $HTravelBizList = array();
        }
        $this->view->setVar('HTravelBizList', $HTravelBizList);

        //REAL ESTATE
        $phqlRealtyList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 722 AND 735 GROUP BY business_id";
        $RealtyLists = $this->modelsManager->executeQuery($phqlRealtyList);
        $RealtyIds = array();
        if(count($RealtyLists) > 0){
            foreach($RealtyLists as $RealtyList) {
                $RealtyIds[] = $RealtyList->business_id;
            }
            $RealtyIds = implode(',', $RealtyIds);
            $phqlRealtyBizList = "SELECT * FROM Business WHERE id IN (".$RealtyIds.") ORDER BY id DESC LIMIT 7";
            $RealtyBizList = $this->modelsManager->executeQuery($phqlRealtyBizList);
        } else {
            $RealtyBizList = array();
        }
        $this->view->setVar('RealtyBizList', $RealtyBizList);

        //SHOPPING
        $phqlShoppingList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 1048 AND 1171 GROUP BY business_id";
        $ShoppingLists = $this->modelsManager->executeQuery($phqlShoppingList);
        $ShoppingIds = array();
        if(count($ShoppingLists) > 0){
            foreach($ShoppingLists as $ShoppingList) {
                $ShoppingIds[] = $ShoppingList->business_id;
            }
            $ShoppingIds = implode(',', $ShoppingIds);
            $phqlShoppingBizList = "SELECT * FROM Business WHERE id IN (".$ShoppingIds.") ORDER BY id DESC LIMIT 7";
            $ShoppingBizList = $this->modelsManager->executeQuery($phqlShoppingBizList);
        } else {
            $ShoppingBizList = array();
        }
        $this->view->setVar('ShoppingBizList', $ShoppingBizList);

        // //COMMUNITY - Active Life
        // $phqlCALList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 1 AND 94 GROUP BY business_id";
        // $CALLists = $this->modelsManager->executeQuery($phqlCALList);
        // $CALIds = array();
        // if(count($CALLists) > 0){
        //     foreach($CALLists as $CALList) {
        //         $CALIds[] = $CALList->business_id;
        //     }
        //     $CALIds = implode(',', $CALIds);
        //     $phqlCALBizList = "SELECT * FROM Business WHERE id IN (".$CALIds.") ORDER BY id DESC LIMIT 7";
        //     $CALBizList = $this->modelsManager->executeQuery($phqlCALBizList);
        // } else {
        //     $CALBizList = array();
        // }
        // $this->view->setVar('CALBizList', $CALBizList);

        // //COMMUNITY - Arts & Entertainment
        // $phqlAEList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 95 AND 139 GROUP BY business_id";
        // $AELists = $this->modelsManager->executeQuery($phqlAEList);
        // $AEIds = array();
        // if(count($AELists) > 0){
        //     foreach($AELists as $AEList) {
        //         $AEIds[] = $AEList->business_id;
        //     }
        //     $AEIds = implode(',', $AEIds);
        //     $phqlAEBizList = "SELECT * FROM Business WHERE id IN (".$AEIds.") ORDER BY id DESC LIMIT 7";
        //     $AEBizList = $this->modelsManager->executeQuery($phqlAEBizList);
        // } else {
        //     $AEBizList = array();
        // }
        // $this->view->setVar('AEBizList', $AEBizList);

        // //COMMUNITY - Local Flavor
        // $phqlLFList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 564 AND 565 GROUP BY business_id";
        // $LFLists = $this->modelsManager->executeQuery($phqlLFList);
        // $LFIds = array();
        // if(count($LFLists) > 0){
        //     foreach($LFLists as $LFList) {
        //         $LFIds[] = $LFList->business_id;
        //     }
        //     $LFIds = implode(',', $LFIds);
        //     $phqlLFBizList = "SELECT * FROM Business WHERE id IN (".$LFIds.") ORDER BY id DESC LIMIT 7";
        //     $LFBizList = $this->modelsManager->executeQuery($phqlLFBizList);
        // } else {
        //     $LFBizList = array();
        // }
        // $this->view->setVar('LFBizList', $LFBizList);

        // //COMMUNITY - Bicycles
        // $phqlBIKEList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 205 AND 209 GROUP BY business_id";
        // $BIKELists = $this->modelsManager->executeQuery($phqlBIKEList);
        // $BIKEIds = array();
        // if(count($BIKELists) > 0){
        //     foreach($BIKELists as $BIKEList) {
        //         $BIKEIds[] = $BIKEList->business_id;
        //     }
        //     $BIKEIds = implode(',', $BIKEIds);
        //     $phqlBIKEBizList = "SELECT * FROM Business WHERE id IN (".$BIKEIds.") ORDER BY id DESC LIMIT 7";
        //     $BIKEBizList = $this->modelsManager->executeQuery($phqlBIKEBizList);
        // } else {
        //     $BIKEBizList = array();
        // }
        // $this->view->setVar('BIKEBizList', $BIKEBizList);

        // //COMMUNITY - Education
        // $phqlEDUCList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 210 AND 246 GROUP BY business_id";
        // $EDUCLists = $this->modelsManager->executeQuery($phqlEDUCList);
        // $EDUCIds = array();
        // if(count($EDUCLists) > 0){
        //     foreach($EDUCLists as $EDUCList) {
        //         $EDUCIds[] = $EDUCList->business_id;
        //     }
        //     $EDUCIds = implode(',', $EDUCIds);
        //     $phqlEDUCBizList = "SELECT * FROM Business WHERE id IN (".$EDUCIds.") ORDER BY id DESC LIMIT 7";
        //     $EDUCBizList = $this->modelsManager->executeQuery($phqlEDUCBizList);
        // } else {
        //     $EDUCBizList = array();
        // }
        // $this->view->setVar('EDUCBizList', $EDUCBizList);

        // //COMMUNITY - Public Services & Government
        // $phqlPSGList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 709 AND 721 GROUP BY business_id";
        // $PSGLists = $this->modelsManager->executeQuery($phqlPSGList);
        // $PSGIds = array();
        // if(count($PSGLists) > 0){
        //     foreach($PSGLists as $PSGList) {
        //         $PSGIds[] = $PSGList->business_id;
        //     }
        //     $PSGIds = implode(',', $PSGIds);
        //     $phqlPSGBizList = "SELECT * FROM Business WHERE id IN (".$PSGIds.") ORDER BY id DESC LIMIT 7";
        //     $PSGBizList = $this->modelsManager->executeQuery($phqlPSGBizList);
        // } else {
        //     $PSGBizList = array();
        // }
        // $this->view->setVar('PSGBizList', $PSGBizList);

        // //COMMUNITY - Religious Organizations
        // $phqlROList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 736 AND 742 GROUP BY business_id";
        // $ROLists = $this->modelsManager->executeQuery($phqlROList);
        // $ROIds = array();
        // if(count($ROLists) > 0){
        //     foreach($ROLists as $ROList) {
        //         $ROIds[] = $ROList->business_id;
        //     }
        //     $ROIds = implode(',', $ROIds);
        //     $phqlROBizList = "SELECT * FROM Business WHERE id IN (".$ROIds.") ORDER BY id DESC LIMIT 7";
        //     $ROBizList = $this->modelsManager->executeQuery($phqlROBizList);
        // } else {
        //     $ROBizList = array();
        // }
        // $this->view->setVar('ROBizList', $ROBizList);

        // //COMMUNITY - Mass Media
        // $phqlMassMedList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 617 AND 620 GROUP BY business_id";
        // $MassMedLists = $this->modelsManager->executeQuery($phqlMassMedList);
        // $MassMedIds = array();
        // if(count($MassMedLists) > 0){
        //     foreach($MassMedLists as $MassMedList) {
        //         $MassMedIds[] = $MassMedList->business_id;
        //     }
        //     $MassMedIds = implode(',', $MassMedIds);
        //     $phqlMassMedBizList = "SELECT * FROM Business WHERE id IN (".$MassMedIds.") ORDER BY id DESC LIMIT 7";
        //     $MassMedBizList = $this->modelsManager->executeQuery($phqlMassMedBizList);
        // } else {
        //     $MassMedBizList = array();
        // }
        // $this->view->setVar('MassMedBizList', $MassMedBizList);

        //FOOD - Food
        $phqlFoodList = "SELECT business_id FROM BusinessCategoryLists WHERE (business_category_id BETWEEN 289 AND 350) OR (business_category_id BETWEEN 743 AND 1047) OR (business_category_id BETWEEN 621 AND 651) GROUP BY business_id";
        $FoodLists = $this->modelsManager->executeQuery($phqlFoodList);
        $FoodIds = array();
        if(count($FoodLists) > 0){
            foreach($FoodLists as $FoodList) {
                $FoodIds[] = $FoodList->business_id;
            }
            $FoodIds = implode(',', $FoodIds);
            $phqlFoodBizList = "SELECT * FROM Business WHERE id IN (".$FoodIds.") ORDER BY id DESC LIMIT 7";
            $FoodBizList = $this->modelsManager->executeQuery($phqlFoodBizList);
        } else {
            $FoodBizList = array();
        }
        $this->view->setVar('FoodBizList', $FoodBizList);

        //FOOD - Restaurant
        // $phqlRestoList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 743 AND 1047 GROUP BY business_id";
        // $RestoLists = $this->modelsManager->executeQuery($phqlRestoList);
        // $RestoIds = array();
        // if(count($RestoLists) > 0){
        //     foreach($RestoLists as $RestoList) {
        //         $RestoIds[] = $RestoList->business_id;
        //     }
        //     $RestoIds = implode(',', $RestoIds);
        //     $phqlRestoBizList = "SELECT * FROM Business WHERE id IN (".$RestoIds.") ORDER BY id DESC LIMIT 3";
        //     $RestoBizList = $this->modelsManager->executeQuery($phqlRestoBizList);
        // } else {
        //     $RestoBizList = array();
        // }
        // $this->view->setVar('RestoBizList', $RestoBizList);

        //FOOD - Nightlife
        // $phqlNLifeList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 621 AND 651 GROUP BY business_id";
        // $NLifeLists = $this->modelsManager->executeQuery($phqlNLifeList);
        // $NLifeIds = array();
        // if(count($NLifeLists) > 0){
        //     foreach($NLifeLists as $NLifeList) {
        //         $NLifeIds[] = $NLifeList->business_id;
        //     }
        //     $NLifeIds = implode(',', $NLifeIds);
        //     $phqlNLifeBizList = "SELECT * FROM Business WHERE id IN (".$NLifeIds.") ORDER BY id DESC LIMIT 2";
        //     $NLifeBizList = $this->modelsManager->executeQuery($phqlNLifeBizList);
        // } else {
        //     $NLifeBizList = array();
        // }
        // $this->view->setVar('NLifeBizList', $NLifeBizList);

        //FINANCIAL
        // $phqlFinancialList = "SELECT business_id FROM BusinessCategoryLists WHERE business_category_id BETWEEN 280 AND 288 GROUP BY business_id";
        // $financialLists = $this->modelsManager->executeQuery($phqlFinancialList);
        // $financialIds = array();
        // if(count($financialLists) > 0){
        //     foreach($financialLists as $financialList) {
        //      $financialIds[] = $financialList->business_id;
        //     }
        //     $financialIds = implode(',', $financialIds);
        //     $phqlFinancialBizList = "SELECT * FROM Business WHERE id IN (".$financialIds.") ORDER BY id DESC LIMIT 7";
        //     $finBizList = $this->modelsManager->executeQuery($phqlFinancialBizList);
        // } else {
        //     $finBizList = array();
        // }
        // $this->view->setVar('finBizList', $finBizList);
        
        
        $realties = Realties::find(array('limit' => 4, "order" => "id DESC"));
        $this->view->setVar('realties', $realties);
        
        $jobs = Jobs::find(array('limit' => 4, "order" => "id DESC"));
        $this->view->setVar('jobs', $jobs);

        $autos = Automotives::find(array('limit' => 4, "order" => "id DESC"));
        $this->view->setVar('autos', $autos);

        $things = Things::find(array('limit' => 4, "order" => "id DESC"));
        $this->view->setVar('things', $things);
        
    }

    public function searchAction()
    {
    	$keyword = $this->request->get("find");
    	$location = $this->request->get("near");
    	$searchWords = '';
    	$this->view->setVar('find', $keyword);
    	$this->view->setVar('near', $near);
        $country = Countries::findFirst(array('columns'    => '*', 
                                         'conditions' => 'country LIKE :country:', 
                                         'bind' => array('country' => $location)));
      
        $countryId = '';
        if($country) {
            $countryId = $country->id;
        } 

        $conditions = '';
        

        if(!empty($keyword)) {
            $conditions .= ' OR name LIKE :name:';
            $bind['name'] = '%'.$keyword.'%';
            $searchWords .= ', '.$keyword;
        }

        if(!empty($location)) {
            $conditions .= ' OR street LIKE :street: OR city LIKE :city:';
            $bind['street'] = '%'.$location.'%';
            $bind['city'] = '%'.$location.'%';
            $searchWords .= ', '.$location;
        }

        if(!empty($countryId)) {
            $conditions .= ' OR country_id = :country_id:';
            $bind['country_id'] = $countryId;
            $searchWords .= ', '.$country->country;
        }

        $searchWords = substr($searchWords, 2); 
        $business = Business::find(array('columns'    => '*', 
                                 'conditions' => substr($conditions, 3), 
                                 'bind' => $bind
                                    ));

        $this->view->setVar('business', $business);

        //CARS and TRUCKS
        $conditions = '';
        $bind = array();
        if (!empty($keyword)) {
            $conditions = ' OR name LIKE :name:';
            $bind['name'] = '%'.$keyword.'%';
        }

        if (!empty($keyword)) {
            $conditions .= ' OR brand LIKE :brand:';
            $bind['brand'] = '%'.$keyword.'%';
        }

        if (!empty($keyword)) {
            $conditions .= ' OR model LIKE :model:';
            $bind['model'] = '%'.$keyword.'%';
        }

        if (!empty($location)) {
            $conditions .= ' OR location LIKE :location:';
            $bind['location'] = $location;
        }

        $autos = Automotives::find([
                'columns' => '*',
                'conditions' => substr($conditions, 3),
                'bind' => $bind
            ]);

        $this->view->setVar('autos', $autos);

        $conditions = '';
        $bind = array();
        if (!empty($keyword)) {
            $conditions = 'name LIKE :name:';
            $bind['name'] = '%'.$keyword.'%';
        }
        $things = Things::find([
            'columns' => '*',
            'conditions' => $conditions,
            'bind' => $bind
        ]);
  
        $this->view->setVar('things', $things);

        //JOBS
        $conditions = ''; 
        $bind = array();
        if(!empty($keyword)) {
            $conditions .= ' OR position LIKE :position:';
            $bind['position'] = '%'.$keyword.'%';
            $searchWords .= ', '.$keyword;
        }
        if(!empty($keyword)) {
            $conditions .= ' OR company LIKE :company:';
            $bind['company'] = '%'.$keyword.'%';
            $searchWords .= ', '.$keyword;
        }
        if(!empty($location)) {
            $conditions .= ' OR street LIKE :street:';
            $bind['street'] = '%'.$location.'%';
            $conditions .= ' OR city LIKE :city:';
            $bind['city'] = '%'.$location.'%';
            $searchWords .= ', '.$location;
        }
        if(!empty($countryId)) {
            $conditions .= ' OR country_id LIKE :country_id:';
            $bind['country_id'] = $countryId;
            $searchWords .= ', '.$country->country;
        }

        $jobs = Jobs::find(array('columns'    => '*', 
                                     'conditions' => substr($conditions, 3), 
                                     'bind' => $bind
                                        ));
        $this->view->setVar('jobs', $jobs);
    }
    
    public function admin_indexAction()
    {   
        $claimRequests = ClaimRequests::find();
        $this->view->setVar('requests', $claimRequests);
        $this->view->setTemplateAfter('admin_default');
    }

    public function admin_cancel_requestAction($id = null) {
        $this->view->disable();

        $request = ClaimRequests::findFirst($id);

        $request->status = 'pending';

        if ($request->save()) {
            return $this->response->redirect('index/admin_index/');
        } else {
            $this->view->disable();
            echo "failed to update data";
        }
    }

    public function admin_reject_requestAction($id = null) {
         $this->view->disable();
         //echo "reject page";
        $request = ClaimRequests::findFirst($id);

        $request->status = 'rejected';

        if ($request->save()) {
            return $this->response->redirect('index/admin_index/');
        } else {
            $this->view->disable();
            echo "failed to update data";
        }
    }

}

