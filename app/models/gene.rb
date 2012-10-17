class Gene < ActiveRecord::Base
  self.table_name = 'gene'
  has_many :gene_mrnas
  has_many :mrnas, :through => :gene_mrnas

  def self.dump
    self.all
        .map { |r| [r['gene_id'], r['attribute_id']].join(SEPARATOR) }
        .join("\n")
  end
end
