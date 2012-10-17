module Insectdb
class Segment < ActiveRecord::Base
  self.table_name = 'segment'
  has_many :mrna_segments
  has_many :mrnas, :through => :mrna_segments
  has_many :genes, :through => :mrnas
  has_one  :type

  def self.dump
    self.where("segment.fref" => ['2L','2R','3L','3R','X'])
        .to_a
        .map{|r| [ r['segment_id'],
                   r['fref'],
                   r['fstart'],
                   r['fstop'],
                   r.type.type ].join(SEPARATOR)}
        .join("\n")
  end

  def gene
    genes.limit(1).first
  end
end
end
