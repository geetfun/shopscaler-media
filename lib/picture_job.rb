class PictureJob < Struct.new(:id)
  def perform
    p = ::Pictures::Source.find(id)
    if p.source.reprocess!
      p.converted!
    end
  end
end