module Insectdb
class Mrna < ActiveRecord::Base
  self.table_name = 'mrna'
  has_many :mrna_segments
  has_many :segments, :through => :mrna_segments
  has_one :gene_mrna
  has_one :gene, :through => :gene_mrna

  def self.dump
    self.where(:fref => ['2L','2R','3L','3R','X'])
        .map{|r| [ r['mrna_id'],
                   r['fref'],
                   r['fstrand'],
                   r['fstart'],
                   r['fstop']
                 ].join(SEPARATOR)}
        .join("\n")
  end
end
end
