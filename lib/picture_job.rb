class PictureJob < Struct.new(:id)
  def perform
    p = Picture.find(id)
    if p.source.reprocess!
      p.converted!
    end
  end
end