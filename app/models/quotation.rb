class Quotation < ApplicationRecord
    validates :author_name, :category, :quotation, presence: true

    # params is object return from strong parameter method
    def self.get_quotation_params(params)
        if !params["category"].nil? and !params["category"].empty?

        elsif !params["newcategory"].nil? and !params["newcategory"].empty?
            params["category"] = params["newcategory"]
        end

        params.delete "newcategory"
        return params
    end
end
