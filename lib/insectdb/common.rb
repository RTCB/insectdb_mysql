module Insectdb

  Insectdb::SEPARATOR = ';'

  def self.connect
    config =
      YAML::load(
        File.open(
          File.join(
            File.dirname(__FILE__),  '../../config/database.yml')))

    ActiveRecord::Base.establish_connection(config)
  end

  def self.export_to_dir( path )
    p = lambda { |f| File.join(path, f) }

    ex = lambda do |mess, &block|
      time = Time.now
      puts mess
      block.call
      puts " took #{Time.now-time} sec"
    end

    ex.call('Dumping segments...') do
      File.open(p.call('segment'),'w') {|f| f << InsExp::Segment.dump}
    end

    ex.call("Dumping mrnas...") do
      File.open(p.call('mrna'),'w') {|f| f << InsExp::Mrna.dump}
    end

    ex.call("Dumping genes...") do
      File.open(p.call('gene'),'w') {|f| f << InsExp::Gene.dump}
    end

    ex.call("Dumping genes_mrnas...") do
      File.open(p.call('genes_mrnas'),'w') {|f| f << InsExp::GeneMrna.dump}
    end

    ex.call("Dumping mrnas_segments...") do
      File.open(p.call('mrnas_segments'),'w') {|f| f << InsExp::MrnaSegment.dump}
    end
  end

end
