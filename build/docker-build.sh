#!/bin/bash

services=(
    "eshopbasket|eshop/basket.api|../src/Services/Basket/Basket.API"
    "eshopcatalog|eshop/catalog.api|../src/Services/Catalog/Catalog.API"
    "eshopidentity|eshop/identity.api|../src/Services/Identity/Identity.API"
    "eshopordering|eshop/ordering.api|../src/Services/Ordering/Ordering.API"
    "eshoporderingbg|eshop/ordering.backgroundtasks|../src/Services/Ordering/Ordering.BackgroundTasks"
    "eshopwebspa|eshop/webspa|../src/Web/WebSPA"
    "eshopwebmvc|eshop/webmvc|../src/Web/WebMVC"
    "eshopwebstatus|eshop/webstatus|../src/Web/WebStatus"
    "eshoppayment|eshop/payment.api|../src/Services/Payment/Payment.API"
    "eshopocelotapigw|eshop/ocelotapigw|../src/ApiGateways/ApiGw-Base"
    "eshopmobileshoppingagg|eshop/mobileshoppingagg|../src/ApiGateways/Mobile.Bff.Shopping/aggregator"
    "eshopwebshoppingagg|eshop/webshoppingagg|../src/ApiGateways/Web.Bff.Shopping/aggregator"
    "eshoporderingsignalrhub|eshop/ordering.signalrhub|../src/Services/Ordering/Ordering.SignalrHub"
)

for service in "${services[@]}"; do
    IFS='|' read -ra serviceInfo <<< "$service"
    serviceName="${serviceInfo[0]}"
    imageName="${serviceInfo[1]}"
    dockerfilePath="${serviceInfo[2]}"
    
    echo "Setting Docker build $serviceName ($imageName)"
    
    docker build -t "${imageName}:teste" -f "${dockerfilePath}/Dockerfile" "${dockerfilePath}"
done
