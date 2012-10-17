module Insectdb
class Type < ActiveRecord::Base
  self.inheritance_column = 'inheritance_type'
  self.table_name = 'segment_type'
  belongs_to :segment
end
end
