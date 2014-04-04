require 'spec_helper'

describe Idea do

  it { should have_and_belong_to_many :users }
  it { should have_and_belong_to_many :tags }
  it { should have_and_belong_to_many :formats }

  it { should validate_presence_of :title }
  it { should validate_presence_of :content }
  it { should validate_presence_of :summary }

  it { should_not allow_value('12').for(:title) }
  it { should allow_value('123').for(:title) }
  it { should_not allow_value("#{'m'*93}").for(:title) }

  it { should_not allow_value('12').for(:summary) }
  it { should_not allow_value("#{'m'*143}").for(:summary) }

  it { should_not allow_value('12').for(:summary) }
  it { should_not allow_value("#{'m'*10001}").for(:summary) }

end
