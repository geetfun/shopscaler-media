require 'test_helper'

class PictureTest < ActiveSupport::TestCase

  context "a new picture instance" do
    setup do
      @picture = Picture.new
    end
    
    should "be valid" do
      assert @picture.valid?
    end
  end

end
