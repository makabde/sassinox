require 'sassinox/version'
require 'fileutils'
require 'thor'

module Sassinox
	class    Generator < Thor
		map ['-v', '--version'] => :version

		desc 'install', 'Install Sassinox files into your project'
		method_options :path => :string, :force => :boolean
		def install
			if sassinox_files_already_exist? && !options[:force]
				puts "Sassinox files already installed, doing nothing."
			else
				install_files
				puts "Sassinox files installed to #{install_path}/"
			end
		end

		desc 'update', 'Update Sassinox'
		method_options :path => :string
		def update
			if sassinox_files_already_exist?
				remove_sassinox_directory
				install_files
				puts "Sassinox files updated."
			else
				puts "No existing sassinox installation found, doing nothing."
			end
		end

		desc 'version', 'Display Sassinox version'
		def version
			say "Sassinox #{Sassinox::VERSION}"
		end

		private

		def sassinox_files_already_exist?
			install_path.exist?
		end

		def install_path
			@install_path ||=if options[:path]
				Pathname.new(File.join(options[:path], 'sassinox'))
			else
				Pathname.new('sassinox')
			end
		end

		def install_files
			make_install_directory
			copy_in_scss_files
		end

		def remove_sassinox_directory
			FileUtils.rm_rf("sassinox")
		end

		def make_install_directory
			FileUtils.mkdir_p(install_path)
		end

		def copy_in_scss_files
			FileUtils.cp_r(all_stylesheets, install_path)
		end

		def all_stylesheets
			Dir["#{stylesheets_directory}/*"]
		end

		def stylesheets_directory
			File.join(top_level_directory, "vendor", "assets", "stylesheets")
		end

		def top_level_directory
			File.dirname(File.dirname(File.dirname(__FILE__)))
		end
	end
end
