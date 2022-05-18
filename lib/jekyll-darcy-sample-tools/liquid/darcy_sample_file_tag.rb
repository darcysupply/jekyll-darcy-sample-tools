module JekyllDarcySampleTools

    class DarcySampleFileTag < Liquid::Tag
        def initialize(tag_name, args, token)
            super
            @args = args.strip
        end

        def render(context)
            template = Liquid::Template.parse(@args)
            split_render = template.render(context).split(' ')

            data = split_render[0]
            data_index = split_render[1].to_i if split_render[1] != nil

            raise 'No data given' if data == nil
            raise 'No data index given' if data_index == nil

            site = context.registers[:site]
            palette_data = site.data[data][data_index]
            
            JekyllDarcySampleTools::create_sample_file(palette_data, context)
        end
    end
    Liquid::Template.register_tag('darcy_sample_file', DarcySampleFileTag)
end