require_relative 'spec_helper'

describe Order do

  let(:order) { described_class.new }

  before do
    described_class.class_eval do 
      @@orders = []
    end
  end

  it '.add' do
    param = {}

    expect { order.add(param) }.to change { order.instance_variable_get("@products").count }.by(1)
  end

  it '.save' do
    expect { order.save }.to change { described_class.class_variable_get("@@orders").count }.by(1)
  end

  it '.all' do
    order.add({})
    order.save
    order.save

    expect(described_class.all.size).to eq(2)
  end

  it '.delete_all' do
    order.add({})
    order.save
    order.save

    described_class.delete_all

    expect(described_class.class_variable_get("@@orders")).to be_empty
  end

  it '.show_price' do
    product1 = double()
    product2 = double()

    allow(product1).to receive(:price) { 1 }
    allow(product2).to receive(:price) { 2 }

    order.add product1
    order.add product2

    expect(order.show_price).to eq(3);
  end
end