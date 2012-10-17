module Insectdb
class GeneMrna < ActiveRecord::Base
  self.table_name = 'mrna_dependence'
  belongs_to :gene
  belongs_to :mrna

  def self.dump
    self.all
        .map { |r| [r['mrna_id'], r['gene_id']].join(SEPARATOR) }
        .join("\n")
  end
end
end
