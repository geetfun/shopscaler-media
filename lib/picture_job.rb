class PictureJob < Struct.new(:id)
  def perform
    p = Picture.find(id)
    m.source.reprocess!
  end
end