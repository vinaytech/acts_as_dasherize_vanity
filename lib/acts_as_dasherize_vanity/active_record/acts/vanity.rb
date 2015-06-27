module ActiveRecord
  module Acts 
    module Vanity 
      def self.included(base)
        base.extend(ClassMethods)
      end
      module ClassMethods
        def acts_as_dasherize_vanity(options = {})
          configuration = { :initial_column => "name", :dasherize_vanity_column => "dasherize_vanity" }
          configuration.update(options) if options.is_a?(Hash)
          class_eval <<-EOV
            include ActiveRecord::Acts::Vanity::InstanceMethods
            def initial_column
              '#{configuration[:initial_column]}'
            end
            def dasherize_vanity_column
              '#{configuration[:dasherize_vanity_column]}'
            end
            before_validation  :set_vanity
            validates_presence_of :#{configuration[:dasherize_vanity_column]}
            validates_uniqueness_of :#{configuration[:dasherize_vanity_column]}
          EOV
        end
        def set_all_vanities
          all.each{|ff| ff.set_vanity;ff.save }
        end
        def reset_all_vanities
          all.each{|ff| ff.clear_vanity;ff.set_vanity;ff.save }
        end
      end
      module InstanceMethods
        def set_vanity
          if self.send("#{initial_column}").present?
            tmp = self.send("#{initial_column}").downcase.tr(" ", "_").dasherize
            bp = self.class.where("#{dasherize_vanity_column} = '#{tmp}'").first
            if bp && bp.id != self.id
              tstr = false
              tstr_num = 1
              while tstr == false
                if bp = self.class.where("#{dasherize_vanity_column} = '#{tmp}-#{tstr_num.to_s}'").first and bp.id != self.id
                  tstr_num += 1
                else
                  tstr = true
                  self[dasherize_vanity_column.to_sym] = tmp+"-"+tstr_num.to_s
                end
              end
            else  
              if self.send("#{initial_column}").present?
                self[dasherize_vanity_column.to_sym] = self.send("#{initial_column}").downcase.tr(" ", "_").dasherize  
              else  
                self[dasherize_vanity_column.to_sym] = nil
              end
            end
          end
        end
        def vanity
          self.class.columns_hash.include?('dasherize_vanity') ? read_attribute(:dasherize_vanity) : self.send(dasherize_vanity_column)
        end
        def clear_vanity
          self[dasherize_vanity_column.to_sym] = nil
        end
        def reset_vanity
          self.clear_vanity
          self.set_vanity
        end
        private
      end
    end
  end
end