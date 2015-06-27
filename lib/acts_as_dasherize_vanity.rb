require "acts_as_dasherize_vanity/version"
require 'acts_as_dasherize_vanity/active_record/acts/vanity'   
module ActsAsDasherizeVanity
  ActiveRecord::Base.send(:include, ActiveRecord::Acts::Vanity)   
end