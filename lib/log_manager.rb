module LogManager

  @rotation_frequency = 'daily'
  @saved_files = 1
  @compress = false

  class << self
    attr_accessor :rotation_frequency, :saved_files, :compress
  end

  def self.hi
    "Hi #{self.project_name}, If you are looking for a gem that helps you manage your log and also make your day awesome, You just found it!"
  end

  def self.path
    Dir.pwd.to_s
  end

  def self.log_rotate
    File.open(self.project_name, "w") do |f|
      f.puts(self.path + '/log/*.log {')
      f.puts('  ' + @rotation_frequency)
      f.puts('  missingok')
      f.puts('  rotate ' + @saved_files.to_s)
      if @compress
        f.puts('  compress')
        f.puts('  delaycompress')
      end
      f.puts('  notifempty')
      f.puts('  copytruncate')
      f.puts('}')
    end
    return true
  end

  def self.project_name
    self.path.split('/').last
  end

  def self.setup enviroment = 'development'
    if self.validate_file
      config = YAML::load(File.open(File.join(Dir.pwd, 'config', "log_manager.yml")))
      enviroment_config = config[enviroment]
      @rotation_frequency = enviroment_config['rotation_frequency']
      @saved_files = enviroment_config['saved_files']
      @compress = enviroment_config['compress']
      return true
    else
      "File doesnt exists yet, please run 'rails generate log_manager:install"
    end
  end

  def self.validate_file
    return File.open(File.join(Dir.pwd, 'config', "log_manager.yml")).exist?
  end

end