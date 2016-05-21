require 'spec_helper'

describe Lita::Handlers::OnewheelDownForEveryoneOrJustMe, lita_handler: true do
  it { is_expected.to route_command('isitdown www.com') }
  it { is_expected.to route_command('down www.com') }

  it 'will display up' do
    allow(RestClient).to receive(:get) { File.open('spec/fixtures/up.html').read }
    send_command 'isitdown www.google.com'
    expect(replies.count).to eq(1)
    expect(replies.last).to eq('It\'s just you.  http://www.google.com is up.')
  end

  it 'will display down' do
    allow(RestClient).to receive(:get) { File.open('spec/fixtures/down.html').read }
    send_command 'isitdown www.doooooogle.com'
    expect(replies.count).to eq(1)
    expect(replies.last).to eq('It\'s not just you!  http://www.doooooogle.com looks down from here.')
  end
end
