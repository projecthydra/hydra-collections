require 'spec_helper'

describe Hydra::Collections::SearchService do
  before do
    @login = 'vanessa'
    @session = {:history => [17, 14, 12, 9]}
    @service = Hydra::Collections::SearchService.new(@session, @login)
  end

  it "should get the documents for the first history entry" do
    expect(Search).to receive(:find).with(17).and_return(Search.new(:query_params=>{:q=>"World Peace"}))
    expect(@service).to receive(:get_search_results).and_return([:one, [:doc1, :doc2]])
    expect(@service.last_search_documents).to eq([:doc1, :doc2])
  end

  describe 'apply_gated_search' do
    before(:each) do
      allow(RoleMapper).to receive(:roles).with(@login).and_return(['umg/test.group.1'])
      params = @service.apply_gated_search({}, {})
      @group_query = params[:fq].first.split(' OR ')[1]
    end
    it "should escape slashes in groups" do
      expect(@group_query).to eq('edit_access_group_ssim:umg\/test.group.1')
    end
    it "should allow overriding Solr's access control suffix" do
      allow_any_instance_of(Hydra::Collections::SearchService).to receive(:solr_access_control_suffix).and_return("edit_group_customfield")
      @service = Hydra::Collections::SearchService.new({}, '')
      params = @service.apply_gated_search({}, {})
      @public_query = params[:fq].first.split(' OR ')[0]
      expect(@public_query).to eq('edit_group_customfield:public')
    end
  end
end
