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

  it 'should have a slug' do
    test_idea = Idea.create({:title => 'Apples to Apples', :content => "#{'m'*143}", :summary => "#{'m'*13}"})
    Idea.all.first.slug.should eq 'apples-to-apples'
  end

  describe '.published' do
    it 'should list ideas that are not yet published' do
      test_idea1 = Idea.create({:title => 'Apples to Apples', :content => "#{'m'*143}", :summary => "#{'m'*13}", :published => false})
      test_idea2 = Idea.create({:title => 'Apples to oranges', :content => "#{'m'*143}", :summary => "#{'m'*13}", :published => true})
      Idea.unpublished.should eq [test_idea1]
      Idea.published.should eq [test_idea2]

    end
  end
end
