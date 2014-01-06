module ModelMirror
  module Settings
    extend self
  # Configuration defaults
    @config = {
                length_min:    'parsley-minlength',
                length_max:    'parsley-maxlength',
                length_range:  'parsley-rangelength',
                numericality:  'parsley-type',
                presence:      'parsley-required',
                format:        'parsley-regex',
                error_message: 'parsley-error-message'
              }

    @valid_config_keys = @config.keys

    # Configure through hash
    def self.configure(opts = {})
      opts.each {|k,v| @config[k.to_sym] = v if @valid_config_keys.include? k.to_sym}
    end

    # Configure through yaml file
    def self.configure_with(path_to_yaml_file)
      begin
        config = YAML::load(IO.read(path_to_yaml_file))
      rescue Errno::ENOENT
        puts 'File not found'
        return
      rescue Psych::SyntaxError
        puts 'Syntax Error'
        return
      end

      configure(config)
    end

    def self.config
      @config
    end

  end
end
