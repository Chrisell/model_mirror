module ModelMirror
  module Settings
    extend self

    # Configures the default settings
    # @param [Hash] Hash of desired overrides
    #
    def self.configure(opts = {})
      @config ||= {}
      opts.each do |k,v|
        @config[k.to_sym] = v
      end
    end

    # Configure through yaml file
    # @param [String] Path to the YAML file
    #
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
