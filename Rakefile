require 'yaml'

def command_echoing_output(cmd)
  puts "[run] #{cmd}"
  IO::popen(cmd) do |o|
    o.each { |output| print output }
  end
end

def quote(string)
  '"' + string + '"'
end

def fixup_path path
  path.gsub(File::SEPARATOR, File::ALT_SEPARATOR || File::SEPARATOR)
end

def path_join *parts
  fixup_path File.join(parts)
end

def exist_or_die filename
  if not File.exists? filename
    puts 'Rake aborted!'
    abort "Could not find #{filename} - this must be in the same directory as the Rakefile"
  end
  YAML::load(File.read(filename))
end

def compile compiler, swf_name, main_src
  FileUtils.mkdir_p SETTINGS[:output]

  arguments = [
    "-swf-version=#{SETTINGS[:swf_version]}",
    "-static-link-runtime-shared-libraries=true",
    "-o #{quote path_join(SETTINGS[:output], swf_name)}",
    SETTINGS[:srcs].map { |lib| "-source-path+=#{lib}"},
    "#{quote main_src}",
  ].flatten

  puts "Building #{swf_name}"
  `#{compiler} #{arguments.join ' '}`
end

def decompile decompiler, swf_name
  FileUtils.mkdir_p SETTINGS[:output]
  abc_name = "#{swf_name}.abc"
  arguments = [
    "-abc",
    "#{quote path_join(SETTINGS[:output], swf_name)}",
    ">",
    "#{quote path_join(SETTINGS[:output], abc_name)}",
  ].flatten

  puts "Decompiling #{swf_name} to #{abc_name}"
  `#{decompiler} #{arguments.join ' '}`
end

SETTINGS = exist_or_die 'build.yml'
MXMLC = quote path_join(SETTINGS[:legacy_sdk], 'bin', 'mxmlc')
ASC2 = quote path_join(SETTINGS[:asc2_sdk], 'bin', 'mxmlc')
SWFDUMP = quote path_join(SETTINGS[:asc2_sdk], 'bin', 'swfdump')

SETTINGS[:main] = fixup_path(SETTINGS[:main])
SETTINGS[:srcs].map! { |src| quote fixup_path(src)}

desc "Delete #{SETTINGS[:output]}"
task :clean do
  if File.exists? SETTINGS[:output]
    FileUtils.rm_r SETTINGS[:output]
  end
end

desc "Build #{SETTINGS[:app_name]} with the legacy ActionScript compiler"
task :build_legacy do
  swf = 'test_legacy.swf'
  compile MXMLC, swf, SETTINGS[:main]
  decompile SWFDUMP, swf
end

desc "Build #{SETTINGS[:app_name]} with the new ActionScript 2 compiler"
task :build_asc2 do
  swf = 'test_asc2.swf'
  compile ASC2, swf, SETTINGS[:main]
  decompile SWFDUMP, swf
end

task :default => [:build_legacy, :build_asc2]
