module Insectdb
class MrnaSegment < ActiveRecord::Base
  self.table_name = 'segment_ali'
  belongs_to :mrna
  belongs_to :segment

  def self.dump
    self.where("source_id = 2")
        .map{ |r| [r['mrna_id'], r['segment_id']].join(SEPARATOR) }
        .join("\n")
  end
end
end
