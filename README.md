Welcome to the **acts_as_dasherize_vanity** 


This "acts_as" extension provides the capabilities a application to allow to generate meaning full dasherize vanity urls for SEO perpose.

## Installation    

Gemfile:
gem 'acts_as_dasherize_vanity'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_dasherize_vanity
                                              
## Usage

### Models:

If need to apply in User model on default field than need to add 2 field in users table
default field: 

**name**
**dasherize_vanity**

and add this line in model(user.rb)

acts_as_dasherize_vanity 

Example:

class User < ActiveRecord::Base
 
    acts_as_dasherize_vanity

end

Than it will work

If have product model and need to apply in Product model on custom field than need to add 2 field custom field in products table

suppose you have filed name in product model

**product_name**
**product_dasherize_vanity_url**

than add this line in model(product.rb)  

acts_as_dasherize_vanity({ initial_column: "product_name", dasherize_vanity_column: "product_dasherize_vanity_url" })   

Example

class Product < ActiveRecord::Base  
  
     acts_as_dasherize_vanity({ initial_column: "product_name", dasherize_vanity_column:"product_dasherize_vanity_url" })

end

Than it will work.

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
         @user = User.where("dasherize_vanity= ?",params[:id],params[:id]).first 
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
