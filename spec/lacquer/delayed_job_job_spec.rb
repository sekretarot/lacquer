require File.expand_path(File.dirname(__FILE__) + '../../spec_helper')

describe "DelayedJobJob" do
  describe "perform" do
    it "should purge the parameter" do
      require File.expand_path('lib/lacquer/delayed_job_job')

      @varnish_mock = double('varnish')
      Lacquer::Varnish.stub(:new).and_return(@varnish_mock)

      @varnish_mock.should_receive(:purge).with('/').exactly(1).times
      Lacquer::DelayedJobJob.new('/').perform
    end
  end
end
