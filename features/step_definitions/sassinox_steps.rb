Given /^sassinox is already installed$/ do
  install_sassinox
end

Given /^I install sassinox to "([^"]*)"$/ do |path|
end

Then /^the sass directories(?: with "([^"]+)" prefix)? should have been generated$/ do |prefix|
  sass_directories = ["extends", "functions", "mixins"]
  sass_directories.map!{ |directory| sassinox_path(prefix, directory) }
  check_directory_presence(sass_directories, true)
end

Then /^the master sassinox partial should have been generated(?: within "([^"]+)" directory)?$/ do |prefix|
  check_file_presence([sassinox_path(prefix, '_sassinox.scss')], true)
end

Then /^sassinox should not have been generated$/ do
  check_directory_presence(['sassinox'], false)
end

Then /^the output should contain the current version of Sassinox$/ do
  step %(the output should contain exactly "Sassinox #{Sassinox::VERSION}\n")
end
