require 'unit_spec_helper'

describe Rpush::Client::ActiveRecord::Notification do
  let(:notification) {Rpush::Client::ActiveRecord::Notification.new}

  it 'allows assignment of many registration IDs' do
    notification.registration_ids = %w(a b)
    expect(notification.registration_ids).to eq %w(a b)
  end

  it 'allows assignment of a single registration ID' do
    notification.registration_ids = 'a'
    expect(notification.registration_ids).to eq ['a']
  end

  it 'saves its parent App if required' do
    notification.app = Rpush::Client::ActiveRecord::App.new(name: "aname")
    expect(notification.app).to be_valid
    expect(notification).to be_valid
  end

  it 'sets expire_at' do
    Timecop.freeze(2019, 06, 14, 18, 54, 14) do
      notification.expiry = 10
      notification.run_callbacks(:save) {false}

      expect(notification.expire_at).to eq(Time.now + 10.seconds)
    end
  end
end if active_record?
