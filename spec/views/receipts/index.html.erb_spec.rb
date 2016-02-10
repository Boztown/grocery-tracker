require 'rails_helper'

RSpec.describe "receipts/index", type: :view do
  before(:each) do
    assign(:receipts, [
      Receipt.create!(),
      Receipt.create!()
    ])
  end

  it "renders a list of receipts" do
    render
  end
end
