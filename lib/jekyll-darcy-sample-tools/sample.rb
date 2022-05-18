module JekyllDarcySampleTools

    # Register a new asset with Jekyll from the staging directory in order
    # to be moved into the final build directory.
    def self.new_jekyll_asset(site, staging_path, output_path, filename)
        site.static_files << Jekyll::StaticFile.new(site, staging_path, output_path, filename)
    end

    def self.create_sample_file(palette, context)
        site = context.registers[:site]

        # create the json data
        sample_file_data = {
            "sampleExportVersion": 1.0,
            "palettes" =>  {
                "name" => palette["name"],
                "colors" => JekyllDarcySampleTools::split_hex_color_list(palette["colors"]).map { |color_values|
                    {
                        "valuesFormat" => 0,
                        "values" => [color_values["r"], color_values["g"], color_values["b"]],
                        "alphaValue" => 0
                    }
                }
            }
        }.to_json

        filename = "#{palette['name']}.sample"
        directory = JekyllDarcySampleTools::config_destination_path(site.config)

        staging_directory = File.join(JekyllDarcySampleTools::config_staging_path(site.config), directory)
        staging_path = File.join(staging_directory, filename)

        puts staging_directory.inspect
        FileUtils.mkpath(staging_directory) unless File.directory?(staging_directory)

        if !File.file?(staging_path)
            File.open(staging_path, 'w') do |file|
                file.write(sample_file_data)
            end
        end
        
        new_jekyll_asset(site, JekyllDarcySampleTools::config_staging_path(site.config), directory, filename)

        '/' + File.join(directory, filename)
    end
end