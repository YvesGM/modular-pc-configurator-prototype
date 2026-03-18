<?php

abstract class ConfiguratorRepository
{
    protected ComponentsRepository $componentsRepository;
    protected CompAttributesRepository $compAttributesRepository;
    protected CompTypeRepository $compTypeRepository;
    protected CompCategoryRepository $compCategoryRepository;
    
    protected CompatibilityRepository $compatibilityRepository;
    
    protected CurrencyRepository $currencyRepository;
    protected PromotionsRepository $promotionsRepository;
    protected TaxRepository $TaxesRepository;

    public function __construct()
    {
        $this->componentsRepository = new ComponentsRepository();
        $this->compAttributesRepository = new CompAttributesRepository();
        $this->compTypeRepository = new CompTypeRepository();
        $this->compCategoryRepository = new CompCategoryRepository();
        
        $this->compatibilityRepository = new CompatibilityRepository();
        
        $this->currencyRepository = new CurrencyRepository();
        $this->promotionsRepository = new PromotionsRepository();
        $this->TaxesRepository = new TaxRepository();
    }
}