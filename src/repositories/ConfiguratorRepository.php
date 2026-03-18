<?php

require_once __DIR__ . '/components/ComponentsRepository.php';
require_once __DIR__ . '/components/CompTypeRepository.php';
require_once __DIR__ . '/components/CompCategoryRepository.php';
require_once __DIR__ . '/components/CompAttributesRepository.php';
require_once __DIR__ . '/compatibility/CompatibilityRepository.php';
require_once __DIR__ . '/pricing/CurrencyRepository.php';
require_once __DIR__ . '/pricing/TaxRepository.php';
require_once __DIR__ . '/pricing/PromotionsRepository.php';
abstract class ConfiguratorRepository
{
    protected ComponentsRepository $componentsRepository;
    protected CompAttributesRepository $compAttributesRepository;
    protected CompTypeRepository $compTypeRepository;
    protected CompCategoryRepository $compCategoryRepository;
    
    protected CompatibilityRepository $compatibilityRepository;
    
    protected CurrencyRepository $currencyRepository;
    protected PromotionsRepository $promotionsRepository;
    protected TaxRepository $taxRepository;

    public function __construct()
    {
        $this->componentsRepository = new ComponentsRepository();
        $this->compAttributesRepository = new CompAttributesRepository();
        $this->compTypeRepository = new CompTypeRepository();
        $this->compCategoryRepository = new CompCategoryRepository();
        
        $this->compatibilityRepository = new CompatibilityRepository();
        
        $this->currencyRepository = new CurrencyRepository();
        $this->promotionsRepository = new PromotionsRepository();
        $this->taxRepository = new TaxRepository();
    }
}