require 'spec_helper'

describe Person do
  it 'Allows a person to be created' do
    person = Person.new(
      title: "Mr",
      first_name: "Joe",
      last_name: "Example",
    )
    expect(person).to be_valid
  end

  it 'Allows a person to be created with just a title' do
    person = Person.new(
      title: "Mr",
      first_name: "",
      last_name: "Example",
    )
    expect(person).to be_valid
  end

  it 'Allows a person to be created with just a first name' do
    person = Person.new(
      title: "",
      first_name: "Joe",
      last_name: "Example",
    )
    expect(person).to be_valid
  end

  it 'Does not allow a person to be created without a last name' do
    person = Person.new(
      title: "Mr",
      first_name: "Joe",
      last_name: "",
    )
    expect(person).to_not be_valid
  end

  it 'Does not allow a person to be created without a first name or title' do
    person = Person.new(
      title: "",
      first_name: "",
      last_name: "Example",
    )
    expect(person).to_not be_valid
  end
end