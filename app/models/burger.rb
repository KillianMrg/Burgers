class Burger < ApplicationRecord
    def nutriments
        require 'openfoodfacts'

        product = Openfoodfacts::Product.get(self.code, locale: 'fr')
    
        if product == nil
          product = [["There is no data available."], [""]]
        else
          product = product.nutriments
        end
    
        return product
    end
end
