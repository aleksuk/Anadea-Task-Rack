require_relative 'spec_helper'

describe ProductModel do

  before do
    described_class.class_eval do 
      @@products = []
    end
  end

  it "counts product" do
    expect(described_class.count).to eq(0)

    product = described_class.new 'pen', 12

    expect { product.save }.to change { described_class.count }.by(1)
  end

  it "all products" do
    expect(described_class.all).to eq([])

    product = described_class.new 'pen', 12

    expect { product.save }.to change { described_class.all }.from([]).to([product])
  end

  it "find" do
    described_class.new('pen', 20).save
    described_class.new('tv', 3000).save
    result = described_class.new('laptop', 1000).save

    expect(described_class.find('something')).to be_falsey
    expect(described_class.find('laptop')).to be(result)
  end

end