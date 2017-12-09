require 'telegraph'

describe Telegraph::Account do
  let(:token) {'a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5'}
  let(:test_client) { Telegraph.setup(token) }
  let(:account_params) do
    {
      'short_name' => 'test_name',
      'author_name' => 'test_author',
      'author_url' => 'http://test_url.com',
      'page_count' => 100
    }
  end

  before(:each) do
    allow_any_instance_of(described_class).to receive(:client) { test_client }
  end

  subject { described_class.new(account_params) }

  its(:access_token) { is_expected.to eq token }
  its(:short_name) { is_expected.to eq 'test_name' }
  its(:author_name) { is_expected.to eq 'test_author' }
  its(:author_url) { is_expected.to eq 'http://test_url.com' }
  its(:page_count) { is_expected.to eq 100 }
end