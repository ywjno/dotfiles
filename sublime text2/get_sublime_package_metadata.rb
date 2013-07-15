# encoding: utf-8

require "find"
require 'json'

jsons = []
Dir.foreach(Dir.pwd) do |dir|
  real_path = File.expand_path dir
  unless real_path == Dir.pwd
    if File.exist?(real_path + '/package-metadata.json')
      jsons << JSON.load(File.read(real_path + '/package-metadata.json')).merge('path_name' => dir).delete_if {|k, v| k =~ /version|description/}
    end
  end
end

File.open(File.expand_path(Dir.pwd + '/package-metadatas.json'), 'w') do |file|
  file.puts jsons.join("\n")
end
