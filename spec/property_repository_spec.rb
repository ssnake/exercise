class EventRepository
  Event = Struct.new(:type, :created_at, :data)

  def initialize(source:)
    @source = source
  end

  def all
    source
      .read
      .map{|obj| Event.new(obj["type"], obj["created_at"], obj["data"])}
  end

  private

  attr_reader :source
end


class PropertyRepository
  Property = Struct.new(:id, :title)

  def initialize(source:)
    @source = source
  end

  def all
    source
      .read
      .map{|obj| Property.new(obj["id"], obj["title"])}
  end

  private

  attr_reader :source
end

class JsonReader
  def initialize(path, root_key)
    @path = path
    @root_key = root_key
    require 'json'
  end

  def read
    @read ||= JSON.parse(File.read(@path))[@root_key]
  end
end

RSpec.describe PropertyRepository do
  let(:subject) { described_class.new(source: JsonReader.new('data/properties.json', 'properties')) }

  it 'returns property objects' do
    properties = subject.all

    expect(properties.find{|property| property.id == 1}.title)
      .to eq('Modern 2 bedrooms flat in Covent Garden')

    expect(properties.find{|property| property.id == 2}.title)
      .to eq('Antique 3 bedrooms flat in South Kensington')
  end
end

RSpec.describe EventRepository do
  let(:subject) { described_class.new(source: JsonReader.new('data/events.json', 'events')) }

  it 'returns events objects' do
    events = subject.all

    expect(events.first.type).to eq("BookingConfirmed")
    expect(events.last.type).to eq("BookingCheckedIn")
  end
end
