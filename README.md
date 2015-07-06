Welcome to the **acts_as_dasherize_vanity** 


This "acts_as" extension provides the capabilities a application to allow to generate meaning full dasherize vanity urls for SEO perpose.

## Installation    

Gemfile:
gem 'acts_as_dasherize_vanity'

And execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_dasherize_vanity
                                              
## Usage

### Models:

To apply dasherize vanity in  User model add below two field on users table

**name**
**dasherize_vanity**

and add this line in user model

acts_as_dasherize_vanity 

Example:

class User < ActiveRecord::Base
 
    acts_as_dasherize_vanity

end

That's it.

Similarly for custom fields:

suppose you have custom column called name in product model. Then create these two fields in products table

**product_name**
**product_dasherize_vanity_url**

and add this line in your product model  

acts_as_dasherize_vanity({ initial_column: "product_name", dasherize_vanity_column: "product_dasherize_vanity_url" })   

Example

class Product < ActiveRecord::Base  
  
     acts_as_dasherize_vanity({ initial_column: "product_name", dasherize_vanity_column:"product_dasherize_vanity_url" })

end

### Url in view pages
for user

    <%= link_to 'Dasherize Vanity Url', user_path(user.dasherize_vanity), class: 'link' %>

for product

    <%= link_to 'Dasherize Vanity Url', product_path(product.product_dasherize_vanity_url), class: 'link' %>


### In controller 

     def set_product 
       if params[:id].is_number?
         @product = Product.where("id = ?",params[:id]).first
       else 
         @product = Product.where("product_dasherize_vanity_url = ?",params[:id]).first
       end
     end   

     def set_user 
       if params[:id].is_number?
         @user = User.where("id = ?",params[:id]).first 
       else
         @user = User.where("dasherize_vanity= ?",params[:id]).first 
       end
     end 

## publish in rubygems
https://rubygems.org/gems/acts_as_dasherize_vanity
## on github
https://github.com/vinaytech/acts_as_dasherize_vanity
## Sample app on github
https://github.com/vinaytech/rails_sample_app_acts_as_dasherize_vanity  


## Contributing

1. Fork it ( https://github.com/[my-github-username]/acts_as_dasherize_vanity/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request      
