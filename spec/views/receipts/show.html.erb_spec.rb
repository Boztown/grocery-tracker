require 'rails_helper'

RSpec.describe "receipts/show", type: :view do
  before(:each) do
    @receipt = assign(:receipt, Receipt.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
