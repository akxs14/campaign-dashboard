require 'rubygems'
require 'sequel'

Sequel::Model.plugin(:schema)
DB = Sequel.connect(:adapter => 'mysql', 
                    :host => 'localhost', 
                    :database => 'attalon',
                    :user => 'root',
                    :password=>'')

unless DB.table_exists?(:ads)
  DB.create_table :ads do
    primary_key :id
    String      :name
    Integer     :height
    Integer     :width
    String      :template
  end
end

unless DB.table_exists?(:campaigns)
  DB.create_table :campaigns do
    primary_key :id
    String      :title
    Datetime    :start_date
    Datetime    :end_date
    Decimal     :monetary_budget
    Decimal     :action_budget
    String      :status
    Integer     :currency_id
    Integer     :campaign_type_id
    Integer     :user_id
  end
end

unless DB.table_exists?(:campaign_types)
  DB.create_table :campaign_types do
    primary_key :id
    String      :symbol
    String      :name
  end
end

unless DB.table_exists?(:creative_templates)
  DB.create_table :creative_templates do
    primary_key :id
    String      :description
    String      :html
    Integer     :width
    Integer     :height
  end
end

unless DB.table_exists?(:currencies)
  DB.create_table :currencies do
    primary_key :id
    String      :name
    String      :symbol
    Decimal     :rate_to_euro
  end
end

class Ad < Sequel::Model(:ads)
end

class Campaign < Sequel::Model(:campaigns)
end

class CreativeTemplate < Sequel::Model(:creative_templates)
end

class CampaignType < Sequel::Model(:campaign_types)
end

class Currency < Sequel::Model(:currencies)
end

