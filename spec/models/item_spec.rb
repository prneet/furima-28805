require 'rails_helper'

RSpec.describe Item, type: :model do
  before '#create' do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/sample.jpg")
  end

  describe
end
