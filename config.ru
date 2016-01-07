# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

if Rails.env.production?
	map '/scholar' do
		run Bibapp::Application
	end
else
	run Bibapp::Application
end
