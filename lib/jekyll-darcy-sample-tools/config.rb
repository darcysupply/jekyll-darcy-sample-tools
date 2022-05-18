module JekyllDarcySampleTools
    DEFAULTS = {
        'staging_path' => '_staging',
        'destination_path' => 'palettes'
    }

    def self.config_staging_path(jekyll_config)
        config = jekyll_config['darcy-sample-tools'] || [{}]
        return config[0]['staging_path'] || DEFAULTS['staging_path']
    end

    def self.config_destination_path(jekyll_config)
        config = jekyll_config['darcy-sample-tools'] || [{}]
        config[0]['destination_path'] || DEFAULTS['destination_path']
    end
end