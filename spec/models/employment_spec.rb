require 'spec_helper'

describe Employment do
  it 'Allows an employment to be created' do
    person = create_person
    location = Location.find(1)
    employment = Employment.new(person_id: person.id, location_id: location.id, role: "Manager")
    expect(employment).to be_valid
    employment.save
    expect(person.locations.last).to eq location
  end
    it 'Employment cannot be created without a person or location' do
    employment = Employment.new(person_id: nil, location_id: nil, role: "Manager")
    expect(employment).to_not be_valid
  end

end
