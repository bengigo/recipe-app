require 'rails_helper'

RSpec.describe Food , type: :model do
    subject do
        @user=User.create(name: 'ali' , email: 'ali@gmail.com' , password: '123456')
        Food.create(name: 'rice' , measurement_unit: 'kilo' , price: 3 , quantity: 100 , user: @user)
    end

    before(:each) { subject.save }

    it 'should have name' do
        expect(subject.name).to eql('rice')
      end

      it 'should have an measurement unit' do
        expect(subject.measurement_unit).to eql('kilo')
      end
    
      it 'should have a price' do
        expect(subject.price).to eql(3)
      end
    
      it 'should have a quantity' do
        expect(subject.quantity).to eql(100)
      end
end